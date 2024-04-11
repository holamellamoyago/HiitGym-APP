import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class DataBaseMethods {
  Future<Stream<QuerySnapshot>> getUsersDetails() async {
    return await FirebaseFirestore.instance.collection('User').snapshots();
  }

  Future updateRutina5Dias(Map<String, dynamic> updateRutina5Dias) async {
    return await FirebaseFirestore.instance
        .collection('Rutinas')
        .doc('5Dias')
        .update(updateRutina5Dias);
  }
}

Future<List> getUser() async {
  List user = [];
  CollectionReference collectionReferencePeople = db.collection('User');

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((documento) {
    user.add(documento.data());
  });

  await Future.delayed(Duration(seconds: 3));

  return user;
}

Future<List> getRutinas() async {
  List user = [];
  CollectionReference collectionReferencePeople = db.collection('Rutina');

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((documento) {
    user.add(documento.data());
  });

  await Future.delayed(Duration(seconds: 3));

  return user;
}
