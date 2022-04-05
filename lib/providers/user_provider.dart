import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/services.dart';


class UserProvider extends ChangeNotifier{

  late User user;
  bool processing = false;
  
  Future<bool> login( String email, String password) async{

    try {

        processing = true;
        notifyListeners();
        
        final resp = await TreeWoApiSimulator.login(email: email, password: password);

        final authResponse = AuthResponse.fromMap(resp);

        user = authResponse.user;
        await LocalStorage.prefs.setString('token', authResponse.token);
        
        notifyListeners();

        processing = false;
        notifyListeners();

        return true;
        
    } catch (e) {
      processing = false;
      notifyListeners();
      rethrow;
    }

  }

  Future<bool> isAuthenticated() async {

    try {
      final token = LocalStorage.prefs.getString('token');
      
      final resp = await TreeWoApiSimulator.renewToken(token: token);

      final authResponse = AuthResponse.fromMap(resp);

      user = authResponse.user;

      await LocalStorage.prefs.setString('token', authResponse.token);
           
      notifyListeners();

      return true;

    } catch (e) {
      LocalStorage.prefs.remove('token');
      rethrow;
    }
  }

  Future<void> logOut() async {

    try {
      LocalStorage.prefs.remove('token');
    } catch (e) {
      LocalStorage.prefs.remove('token');
      rethrow;
    }
  }

}