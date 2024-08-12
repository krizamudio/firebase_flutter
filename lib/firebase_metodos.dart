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
  //Dar una duracion de 4 segundos para mostrar que el circulo funciona
  await Future.delayed(const Duration(seconds: 2));
  return gente;
}

//Leer datos
Future<void> leerNombre(String nombre) async {
  await db.collection("bd_usuarios").add({"nombre": nombre});
}

//Sintaxis de una base de datos NoSQL de Firebase
/*
"bd_usuarios":
 [
    {
      "nombre": "Oscar",
    },
    {
      "nombre": "irene",
    },
    {
      "nombre": "Ulises",
    },
    ...
 ]
*/