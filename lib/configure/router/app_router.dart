import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

final prefs = PreferenciasUsuario();

final appRouter = GoRouter(
  initialLocation: prefs.ultimaPagina,
  routes: [
    GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/login_screen',
        name: LoginPage.name,
        builder: (context, state) => const LoginPage()),
    GoRoute(
        path: '/register_screen',
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen()),
    GoRoute(
        path: '/tutorial_screen',
        name: TutorialScreen.name,
        builder: (context, state) => const TutorialScreen()),
    GoRoute(
        path: '/runtina_5dias_screen',
        name: Rutina5Dias.name,
        builder: (context, state) => const Rutina5Dias()),
  ],
);