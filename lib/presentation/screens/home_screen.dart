import 'dart:ui';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const name = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<IconData> navIcons2 = [
  Icons.home_outlined,
  Icons.camera_alt_outlined,
  Icons.person_2_outlined
];

List<GestureDetector> navIcons = [
  GestureDetector(
    child: const Icon(Icons.home_outlined),
  ),
  GestureDetector(
    child: const Icon(Icons.camera_alt_outlined),
  ),
  GestureDetector(
    child: const Icon(Icons.person_2_outlined),
  ),
];

List<String> navTitle = ['Home', 'TikGym', 'Perfil'];

int selectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    _notifactions(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), scale: 1.2)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderHomeScreen(prefs: prefs),
                  // const _SubtitleText(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  const _HomeScreenCards(),
                  // Se utilizan los snapshots para traer datos varias veces , con el GET solo tendriamos que cambiar el stream por un future.
                  const Expanded(child: _List()),
                  Text(prefs.isAdmin.toString()),
                  GestureDetector(
                    onTap: () async {
                      FirebaseMessaging messaging = FirebaseMessaging.instance;
                      FirebaseAuth.instance.signOut();
                      User? user = FirebaseAuth.instance.currentUser;
                      messaging.deleteToken();
                      context.go('/login_screen');
                      prefs.ultimaPagina = '/tutorial_screen';
                      FirebaseFirestore.instance
                          .collection('User')
                          .doc(user?.uid)
                          .update({
                            'token': ''
                          });
                    },
                    child: const Text('Desconectarse'),
                  ),
                  // bottomBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _notifactions(BuildContext context) async {
    context.read<NotificationsBloc>().requestPermission();
    // final FirebaseauthService _auth = FirebaseauthService();
    var prefs = PreferenciasUsuario();
    print('Token: ${prefs.token}');
  }
}

Widget bottomBar() {
  return Container(
    height: 65,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    // color: Colors.red,
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 229, 190, 187),
        borderRadius: BorderRadius.all(Radius.circular(50))),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons2.map((e) {
          return GestureDetector(
            child: Icon(e),
          );
        }).toList()),
  );
}

class _HomeScreenCards extends StatelessWidget {
  const _HomeScreenCards();

  @override
  Widget build(BuildContext context) {
    String title1 = 'Horarios';
    String subtitle1 = 'Consulta nuestros horarios';
    IconData icon1 = Icons.calendar_month;

    String title2 = 'Apuntarse';
    String subtitle2 = 'Recuerda apuntarte antes de asistir !';
    IconData icon2 = Icons.fitness_center;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardHomeScreen(title1: title1, subtitle1: subtitle1, icon1: icon1),
        CardHomeScreen(title1: title2, subtitle1: subtitle2, icon1: icon2),
      ],
    );
  }
}

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({
    super.key,
    required this.prefs,
  });

  final PreferenciasUsuario prefs;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final colors = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const Text(
            'Hola ',
            style: TextStyle(fontSize: 42),
          ),
          GetUsername(prefs: prefs, colors: colors),
        ],
      ),
      FutureBuilder(
        future:
            FirebaseFirestore.instance.collection('User').doc(user?.uid).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            final _data = snapshot.data?.data();
            if (_data!.isNotEmpty) {
              return Text(_data['subscription'],
                  style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18));
            }
            return const Placeholder();
          }
        },
      ),
    ]);
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    final titleStyleLarge = Theme.of(context).textTheme.titleLarge;
    final subtitleStyleSmall = Theme.of(context).textTheme.bodyMedium;
    return ListView.builder(
      itemCount: appHomeMenuItem.length,
      itemBuilder: ((context, index) {
        final homeMenuIndex = appHomeMenuItem[index];
        return GestureDetector(
          onTap: () => context.push(homeMenuIndex.url),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  homeMenuIndex.title,
                  style: titleStyleLarge,
                ),
                subtitle: Text(
                  homeMenuIndex.subtitle,
                  style: subtitleStyleSmall,
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class HomeMenuItem {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;

  HomeMenuItem(
      {required this.title,
      required this.subtitle,
      required this.url,
      required this.icon});
}

final appHomeMenuItem = <HomeMenuItem>[
  HomeMenuItem(
      title: 'Rutina de los 5 días.',
      subtitle:
          'Rutina para las personas que se exigen un nivel de disciplina alto.',
      url: '/runtina_5dias_screen',
      icon: Icons.abc),
  HomeMenuItem(
      title: 'Rutina de los 3 días.',
      subtitle: 'Rutina que te exigira dar lo maximo de ti .',
      url: '/runtina_3dias_screen',
      icon: Icons.abc),
];
