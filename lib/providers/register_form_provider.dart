import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  
  String name = '';
  String email = '';
  String password = '';

  bool validateRegisterForm(){

    if(registerFormKey.currentState!.validate()){
      
      return true;

    }else{
    
      return false;

    }




  }



}