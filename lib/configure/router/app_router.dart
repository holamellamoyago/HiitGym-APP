import 'package:newhiitgymfirebase2/presentation/dashboard/dashboard.dart';
import 'package:newhiitgymfirebase2/presentation/rutinas/the_3dias_screen.dart';
import 'package:newhiitgymfirebase2/presentation/screens/profile_screen.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

final prefs = PreferenciasUsuario();

final appRouter = GoRouter(
  // initialLocation: prefs.ultimaPagina,
  initialLocation: '/dashboard',
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
    GoRoute(
        path: '/runtina_3dias_screen',
        name: Rutina3dias.name,
        builder: (context, state) => const Rutina3dias()),
    GoRoute(
        path: '/profile_screen',
        name: ProfileScreen.name,
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: '/dashboard',
        name: DashBoard.routename,
        builder: (context, state) => const DashBoard()),
  ],
);
