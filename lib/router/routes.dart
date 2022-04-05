

import 'package:flutter/material.dart';
import 'package:tree_wo/ui/screens/screens.dart';

class Routes {

static String splashScreenRoute = '/';  
static String getStartedScreenRoute = 'getStarted';  
static String loginScreenRoute = 'login';
static String registerScreenRoute = 'register';
static String homeScreenRoute = 'home';
static String physicalActivityScreenRoute = 'physicalActivity'; 

static final routes = <String, WidgetBuilder>{
  splashScreenRoute:     (_) => const SplashScreen(),
  getStartedScreenRoute: (_) => const GetStartedScreen(),
  loginScreenRoute:      (_) => const RegisterScreen(),
  registerScreenRoute:   (_) => const LoginScreen(),
  homeScreenRoute:       (_) => const HomeScreen(),
  physicalActivityScreenRoute: (_) =>  const PhysicalActivityScreen()
}; 



}