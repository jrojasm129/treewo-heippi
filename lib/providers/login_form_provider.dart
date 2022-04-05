import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  
  String email = '';
  String password = '';

  bool validateLoginForm() => loginFormKey.currentState!.validate();



}