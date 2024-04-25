// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newhiitgymfirebase2/presentation/util/snackbar.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

class RegisterScreen extends StatefulWidget {
  static const name = 'register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseauthService _auth = FirebaseauthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImagenLogo(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                Column(
                  children: [
                    const Text(
                      'Registro',
                      style: TextStyle(fontSize: 24),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    UsernameTextField(usernameController: _usernameController),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    EmailTextField(emailController: _emailController),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    PasswordTextField(passwordController: _passwordController),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                FilledButton(
                    onPressed: _signUp,
                    child: const Text('Crear nueva cuenta')),
                ElevatedButton(
                    onPressed: () {
                      showSnackBar(context, 'Estamos mostrando un mensaje');
                    },
                    child: const Text('SnackBar'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    // Preferencias de usuario
    var prefs = PreferenciasUsuario();

    // Notificaciones , firebase messasing
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    print('El token del register es: ${token}');
    // Username , mail ....
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;

    User? user = await _auth.createAcountWithEmailAndPassword(email, password);

    if (user != null) {
      print('El usuario inicio sesion correctamente');
      prefs.ultimouid = user.uid;
      prefs.username = username;
      prefs.ultimaPagina = '/';
      await FirebaseFirestore.instance.collection('User').doc(user.uid).set({
        'email': email,
        'password': password,
        'username': username,
        'subscription': 'Tarifa básica',
        'admin': false,
        'token': token ?? '123456789'
      });
    } else {
      print('No consiguio registrarse');
    }
    context.push('/');
  }
}
