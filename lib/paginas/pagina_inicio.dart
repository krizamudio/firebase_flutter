import 'package:firebase_app_3/firebase_metodos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: obtenerDatos(), 
        builder: (context, snapshot){
          //Se aplica una condicion para quitar la excepcion de datos nulos en metodos future
          if(snapshot.hasData) {
            //Lista de elementos
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['nombre']);
              },
            );
            //En caso contrario, mostrar simplemente un circulo de carga
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}