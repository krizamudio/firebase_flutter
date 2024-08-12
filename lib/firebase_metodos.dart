import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Regresa una lista de datos
Future<List> obtenerDatos() async {
  List gente = [];
  CollectionReference collectionReferenceGente = db.collection('bd_usuarios');

  QuerySnapshot queryGente = await collectionReferenceGente.get();
  queryGente.docs.forEach((documento){
    gente.add(documento.data());
  });

  await Future.delayed(const Duration(seconds: 4));
  return gente;
}