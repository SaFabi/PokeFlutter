

import 'package:form_validation/src/DAO/pokemon.dart';

class ListaBloc{

  PokemonDAO _pokemonDAO = new PokemonDAO();



  listarPokemones(int value) async {
    var jsonRespuestaListar;
    
    try {
      jsonRespuestaListar = await _pokemonDAO.getLista(value);
      
    } catch (e) {

    }

    return jsonRespuestaListar;
  }

}