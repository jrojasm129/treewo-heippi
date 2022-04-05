import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationService {

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackbarError(String message){

      final snackBar = SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 15),),
        backgroundColor: Colors.red.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      );

      messengerKey.currentState!.showSnackBar(snackBar);

  }

  static void showSnackbarSucces(String message){
  
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20),),
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
    );
  
    messengerKey.currentState!.showSnackBar(snackBar);

  }

  static Future<void> showOkDialog(BuildContext context, String title, String content) async {
  
   final dialogBuilder = AlertDialog(
     title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600),),
     content: Text(content),
     backgroundColor: Colors.white.withOpacity(0.9),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(15)
     ),
     elevation: 5,
     actions: [
       TextButton(
         style: TextButton.styleFrom(

         ),
         onPressed: () => Navigator.maybePop(context), 
         child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
       )
     ],
   );

   final cupertinoDialogBuilder = CupertinoAlertDialog(
     title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600),),
     content: Text(content),
     actions: [
       CupertinoDialogAction(
         isDefaultAction: true,
         child: const Text('OK'),
         onPressed: () => Navigator.maybePop(context),
       )
     ],
   );
  
  (!Platform.isAndroid || kIsWeb)
    ? await showDialog(
       context: context, 
       builder: (_) => dialogBuilder,
      )
    : await showCupertinoDialog(
     context: context, 
     builder: (_) => cupertinoDialogBuilder,
   );

  }


}