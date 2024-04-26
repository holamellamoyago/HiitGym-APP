import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //Lo que hacemos con message.data es desglosar la notificacion en partes para que podamos dividir sus partes.

  var mensaje = message.data;
  var body = mensaje['body'];
  var title = mensaje['title'];

  Random random = Random();
  var id = random.nextInt(10000);
  LocalNotification.showLocalNotification(id: id, title: title, body: body);
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  // 1.Iniciamos el servicio.
  FirebaseMessaging messasing = FirebaseMessaging.instance;

  NotificationsBloc() : super(NotificationsInitial()) {
    _onForegroundMessage();
  }

  // 2.Solicitamos permisos de notificaciones.
  void requestPermission() async {
    var prefs = PreferenciasUsuario();
    NotificationSettings settings = await messasing.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await LocalNotification.requestPermissionLocalNotifications();

    settings.authorizationStatus;
    // 3.Recogemos el token
    _getFCMToken();
  }

  // Guardar token en firestore
  // Para crear un grupo de personas debería de crear a esas personas con un mismo token , con esto
  //   haría que le llegase a todos las notificiaciones

  void _getFCMToken() async {
    var prefs = PreferenciasUsuario();
    final settings = await messasing.getNotificationSettings();

    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = await messasing.getToken();

    if (token != null) {
      final prefs = PreferenciasUsuario();

      prefs.token = token;
    }
    prefs.token = token.toString();
    print('El nuevo token es: ${prefs.token}');
  }

  // 3.Creamos el cuerpo de la notificación
  void handleRemoteMessage(RemoteMessage message) {
    //Lo que hacemos con message.data es desglosar la notificacion en partes para que podamos dividir sus partes.

    var mensaje = message.data;
    var body = mensaje['body'];
    var title = mensaje['title'];

    Random random = Random();
    var id = random.nextInt(10000);
    LocalNotification.showLocalNotification(id: id, title: title, body: body);
  }

  // 4.Esto es por si tiene la app abierta en el momento de la notificación.
  //  Esto es lo que escucha las notificaciones que se lo pasa al handle
  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }
}

// on<NotificationsEvent>((event, emit) {
//   // TODO: implement event handler
// });
