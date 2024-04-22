import 'package:flutter/material.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

class Rutina3dias extends StatefulWidget {
  static const name = '/rutina_3dias_screen';
  const Rutina3dias({super.key});

  @override
  State<Rutina3dias> createState() => _Rutina3diasState();
}

class _Rutina3diasState extends State<Rutina3dias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('Rutinas')
              .doc('3Dias')
              .get(),
          builder: (context, snapshot) {
            final rutinaData = snapshot.data?.data();
            return !snapshot.hasData ? CircularProgressIndicator() : Center();
          },
        ),
      ),
    );
  }
}
