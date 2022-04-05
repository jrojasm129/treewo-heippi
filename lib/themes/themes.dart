

import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';

class AppThemes{
 
  static ThemeData lightTheme = ThemeData.light().copyWith(
     scaffoldBackgroundColor: kBackgroundColor,
     colorScheme: ThemeData().colorScheme.copyWith(          
       primary: kPrimaryColor,
     ),
     inputDecorationTheme: const InputDecorationTheme().copyWith(
       iconColor: Colors.grey,
       fillColor: kSecundaryColor,
       contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
       hintStyle: const TextStyle(color: Colors.grey, fontSize:18),
       focusedBorder: _outlineInputBorder(focused: true),
       border: _outlineInputBorder(),
       enabledBorder: _outlineInputBorder(),
       errorBorder: _outlineInputBorder()
     )
  );
}

  OutlineInputBorder _outlineInputBorder({bool focused = false}) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: focused ? Colors.grey.withOpacity(0.8) : Colors.grey.withOpacity(0.5) ,
            width: focused ? 2 : 1
          )
      );
  }


