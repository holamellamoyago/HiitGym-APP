import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newhiitgymfirebase2/configure/imagePicker/select_image.dart';
import 'package:newhiitgymfirebase2/configure/storage/storage_service.dart';
import 'package:newhiitgymfirebase2/presentation/util/snackbar.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('User')
                        .doc(user?.uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                         return CircularProgressIndicator();
                      } else {
                        final _data = snapshot.data?.data();
                        return ClipOval(
                          child: CircleAvatar(
                            radius: 70,
                            child: Image.network(_data?['image_url'], fit: BoxFit.cover,),
                          ),
                        );
                      }
                    },
                  ),
                  // CircleAvatar(
                  //   radius: 70,
                  //   child: Image.asset('assets/logo.png'),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TÚ PERFIL',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text('Nombre del usuario'),
                      FilledButton(
                          onPressed: () async {
                            final image = await getImage();
                            showSnackBar(context, 'Cargando');
                            if (image == null) {
                              return;
                            } else {
                              final imageUploaded = File(image.path);
                              final uploaded = await uploadImageProfile(
                                  imageUploaded, 'Foto_Perfil');
                              uploaded
                                  ? showSnackBar(
                                      context, 'Imágen subida correctamente')
                                  : showSnackBar(
                                      context, 'Error al subir la imagen');
                            }
                          },
                          child: Text('Modificar foto de perfil'))
                    ],
                  )
                ],
              ),
            ),
            Text('Aquí termina'),
          ],
        ),
      ),
    );
  }
}
