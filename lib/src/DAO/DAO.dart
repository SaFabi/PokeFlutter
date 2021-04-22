
Future<Map<String,dynamic>>DaoRespuesta(e) async {

  Map<String,dynamic> respuesta;
  String error = e.toString();
  String errorCom = error.substring(0,34);

  switch(errorCom){

    case "SocketException: Failed host looku":
    case "SocketException: Connection failed":
    case "SocketException: OS Error: Network":
    case "SocketException: OS Error: No rout":
      respuesta ={
        "data":"Error",
        "message":"Error de conexion",
        "code":"01"
      };
      break;
    case "FormatException: Unexpected chara":
      respuesta ={
        "data":"Error",
        "message":"No se puede convertir json",
        "code":"02"
      };
      break;
    case "SocketException: OS Error: Connect":
      respuesta ={
        "data":"Error",
        "message":"Error no esta disponible el servidor",
        "code":"03"
      };
      break;
    case "SocketException: OS Error: Operati":
      respuesta ={
        "data":"Error",
        "message":"Error se excedió el tiempo de espera",
        "code":"04"
      };
      break;
    case "Connection closed before full head":
      respuesta ={
        "data":"Error",
        "message":"La conexión se cerro ",
        "code":"05"
      };
      break;
    default: respuesta={
      "data":"!Ups¡ Parece que algo salió mal",
      "message":"Ocurrio un error inesperado",
      "code":"00"
    };
    break;
  }
  return respuesta;
}



