
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:form_validation/src/DAO/COnstants.dart';
import 'package:form_validation/src/DAO/DAO.dart';
import 'package:http/http.dart' as http;


class PokemonDAO{


Future<Map<String, dynamic>> getLista(int  value) async {
    String url = Constantes.HOST + Constantes.RUTA + "ability/?limit="+value.toString()+"&offset="+value.toString();
    print(url);
    
    Map<String, dynamic> respuesta;
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonObject = json.decode(response.body);
        if (jsonObject.length > 0) {
          respuesta = jsonObject;
        } else {
          respuesta = {
            "data": "eror",
            "message": "Ocurrio un problema",
            "code": "03"
          };
        }
      } else {
        var jsonObject = json.decode(response.body);
        respuesta = jsonObject;
      }
    } catch (e) {
      respuesta = await DaoRespuesta(e);
    }

    return respuesta;
  }


}