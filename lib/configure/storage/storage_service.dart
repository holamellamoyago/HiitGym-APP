import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newhiitgymfirebase2/presentation/widgets_screens.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = FirebaseAuth.instance.currentUser;

bool value = false;

Future<bool> uploadImageProfile(File image, String path) async {
  final Reference ref =
      storage.ref().child('User').child(auth.currentUser!.uid).child(path);

  try {
    await ref.delete();
  } on FirebaseException catch (e) {
    print(e);
  }

  try {
    await ref.putFile(image);
    value = true;
  } on FirebaseException catch (e) {
    print(e);
  }

  var image_url = await ref.getDownloadURL();

  await FirebaseFirestore.instance
      .collection('User')
      .doc(user?.uid)
      .update({'image_url': image_url});


  return value;
}

Future<bool> subirImage(File image) async {
  // Esto es para ponerle un nombre de archivo infinito a la imagen, se cambiaria en el apartado "Path"
  final String nombreArchivo = image.path.split('/').last;
  Random random = Random();
  var pathRandom = random.nextInt(1000000000);

  final Reference ref = storage
      .ref()
      .child('User')
      .child(auth.currentUser!.uid)
      .child(pathRandom.toString());

  try {
    await ref.putFile(image);
    value = true;
  } on FirebaseException catch (e) {
    print(e);
  }
  return value;
}
