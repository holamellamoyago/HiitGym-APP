// ignore_for_file: use_build_context_synchronously

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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
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
                    child: const Text('Crear cuenta')),
                FilledButton(
                    onPressed: () {
                      _sigIn();
                    },
                    child: const Text('Iniciar sesion')),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: colors.primary,
                  ),
                ),
                const Text('O mejor inicia sesión como '),
                Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: colors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  final user = await _auth.loginGoogle();
                  if (user != null) {
                    _signInGoogle();
                    context.go('/');
                  }
                } on FirebaseAuthException {
                  return;
                  // showSnackBar(context, e.message?? 'Algo salio mal');
                }
              },
              child: Container(
                padding: const EdgeInsets.all(40),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage('assets/google.png'))),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _sigIn() async {
    var prefs = PreferenciasUsuario();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.sigInWithEmailAndPassword(email, password);

    if (user != null) {
      context.push('/');
      prefs.ultimaPagina = '/';
      prefs.ultimouid = user.uid;
      FirebaseFirestore.instance
          .collection('User')
          .doc(user.uid)
          .update({'token': token});
      showSnackBar(context, 'Inicio sesion correctamente');
    } else {
      showSnackBar(context, 'Error de contraseña o mail ');
    }
  }

  void _signInGoogle() async {
    var prefs = PreferenciasUsuario();
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    final username = user?.displayName;
    final uid = user?.uid;
    const password = 'No hay contrrasna';
    const subscription = 'Tarifa basica';
    final email = user?.email;

    if (user != null) {
      prefs.ultimouid = user.uid;
      prefs.ultimaPagina = '/';

      FirebaseFirestore.instance.collection('User').doc(uid).set({
        'admin': true,
        'username': username,
        'password': password,
        'subscription': subscription,
        'email': email,
        'token': token
      });
    } else {
      showSnackBar(context, 'Error en el login_screen 172');
    }
  }
}
