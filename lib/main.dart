import 'package:flutter/material.dart';

import 'package:tree_wo/router/routes.dart';
import 'package:tree_wo/themes/themes.dart';
import 'services/services.dart';
import 'package:tree_wo/providers/providers.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await LocalStorage.configurePrefs();  
  
  runApp(const _MyAppState());
}

class _MyAppState extends StatelessWidget {
  const _MyAppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => MovementProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TreeWo',
      initialRoute: Routes.splashScreenRoute,
      routes: Routes.routes,
      scaffoldMessengerKey: NotificationService.messengerKey,
      theme: AppThemes.lightTheme,
    );
  }
}