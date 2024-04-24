import 'package:flutter/material.dart';
import 'package:newhiitgymfirebase2/configure/localNotification/local_notification.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await PreferenciasUsuario.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await LocalNotification.initializeLocalNotifications();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NotificationsBloc(),
    )
  ], child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: AppTheme.getTheme(),
      theme: Apptheme2().getTheme(),
      routerConfig: appRouter,
    );
  }
}
