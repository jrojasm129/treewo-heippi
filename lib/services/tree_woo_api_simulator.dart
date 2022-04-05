import 'package:tree_wo/constants.dart';
import 'package:tree_wo/data/data.dart';

class TreeWoApiSimulator {


  static login({required String email, required String password}) async {

    await Future.delayed(kdefaultRequestDuration);
    
    try {

      //$TecPass05  
      if(email == 'prueba@heippi.com' && password == '123456'){
        return loggedUser;
      }

      throw 'Usuario o contraseña incorrecta';

    } catch (e) {
      throw 'Usuario o contraseña incorrecta';
    }

  }

  static renewToken({String? token}) async {

    await Future.delayed(kdefaultRequestDuration);
    
    try {

      //$TecPass05  
      if(token != null){
        return loggedUser;
      }

      throw 'Token no válido o ya expiró.';

    } catch (e) {
      throw 'Token no válido o ya expiró.';
    }

  }

  static getLeaderBoard() async {

    await Future.delayed(kdefaultRequestDuration);
    
    try {

      return leaders;

    } catch (e) {
      throw 'Se produjo un error al obtener la lista de posiciones.';
    }

  } 

    static getUserMovementdetails() async {

    await Future.delayed(kdefaultRequestDuration);
    
    try {

      return movementDetails;

    } catch (e) {
      throw 'Se produjo un error al obtener la lista de posiciones.';
    }

  }  




}