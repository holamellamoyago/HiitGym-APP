import 'package:flutter/material.dart';
import 'package:newhiitgymfirebase2/presentation/util/snackbar.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

class LoginPage extends StatefulWidget {
  static const name = 'login_screen';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseauthService _auth = FirebaseauthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo(1).jpg',
              height: 200,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            EmailTextField(emailController: _emailController),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            PasswordTextField(passwordController: _passwordController),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    onPressed: () {
                      context.push('/register_screen');
                    },
                    child: const Text('Registro')),
                FilledButton(
                    onPressed: () {
                      _sigIn();
                    },
                    child: const Text('Iniciar sesion')),
              ],
            ),
            FilledButton(
                onPressed: () async {
                  try {
                    final user = await _auth.loginGoogle();
                    if (user != null) {
                      context.go('/');
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e.message);
                    // showSnackBar(context, e.message?? 'Algo salio mal');
                  }
                },
                child: const Text('Google'))
          ],
        )),
      ),
    );
  }

  void _sigIn() async {
    var prefs = PreferenciasUsuario();

    final colors = Theme.of(context).colorScheme;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.sigInWithEmailAndPassword(email, password);

    if (user != null) {
      print('El usuario inicio sesion correctamente');
      context.push('/');
      prefs.ultimaPagina = '/';
      prefs.ultimouid = user.uid;
      showSnackBar(context, 'Inicio sesion correctamente');
    } else {
      print('No consiguio iniciar sesion');
      showSnackBar(context, 'Error de contraseña o mail ');
    }
  }

  void _SignInGoogle() async {
    var prefs = PreferenciasUsuario();
    User? user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName;
    final uid = user?.uid;
    final password = 'No hay contrrasna';
    final subscription = 'Tarifa basica';
    final email = user?.email;

    if (user != null) {
      prefs.ultimouid = user.uid;
      // prefs.username = username!;
      prefs.ultimaPagina = '/';

      FirebaseFirestore.instance.collection('User').doc(uid).set({
        'admin': false,
        'username': username,
        'password': password,
        'subscription': subscription,
        'email': email
      });
    } else {}
    context.go('/');
  }
}
