import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validation/Models/pokemon.dart';
import 'package:form_validation/src/bloc/lista_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/widgets/card_pokemon.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListaBloc _listaBloc = new ListaBloc();
  Future getElementos;

  int _elementos = 20;

  @override
  void initState() {
    getElementos = obtenerLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: FutureBuilder(
        future: getElementos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            var jsonresults = snapshot.data["results"];
            return ListView.builder(
                itemCount:snapshot.data["results"].length,
                itemBuilder: (_, i) => Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.red,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(jsonresults[i]["name"]),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                    ));
          }else{
          
            return Container(

            );
          }
        },
      ),
    );
  }

  Future obtenerLista() async {
    var respuesta;
    respuesta = await _listaBloc.listarPokemones(_elementos);
    return respuesta;
  }
}
