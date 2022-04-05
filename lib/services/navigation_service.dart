

import 'package:flutter/material.dart';

class NavigationService {

  static PageRouteBuilder fadeInTransition(Widget child){

    return PageRouteBuilder(
     pageBuilder: (_, __, ___) => child,
     transitionDuration: const Duration(milliseconds: 200),
     transitionsBuilder: (_, animation, __, child) {
       return FadeTransition(
         opacity: animation,
         child: child,
       );
     },
   );
  }


}