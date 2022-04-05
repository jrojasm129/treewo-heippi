
import 'package:flutter/material.dart';
import 'package:tree_wo/ui/screens/home_screen/home_loading_screen.dart';

import '../../../providers/providers.dart';
import '../../../services/services.dart';

import '../../screens/screens.dart';
import '../../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200), lowerBound: 0.96);
    _controller.repeat(reverse: true);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
    _chekingLoginState(context);
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: const Color(0xfff1f8e9),
     body:AnimatedBuilder(
          animation: _controller,   
          child: const Imagotype(),      
          builder: (context, child) {

            return Opacity(
              opacity: ((_controller.value * 10) - 9).clamp(0.0, 1.0),
              child: Transform.scale(
                scale: _controller.value,
                child: child,
              ),
            );
          })
    );
  }

}

Future<void> _chekingLoginState(BuildContext context) async{

  final userProvider = Provider.of<UserProvider>(context, listen: false);

  try {
    final autenticado = await userProvider.isAuthenticated();

    autenticado 
     ? Navigator.pushReplacement(context, NavigationService.fadeInTransition(const HomeLoadingScreen()))
     : Navigator.pushReplacement(context, NavigationService.fadeInTransition(const GetStartedScreen()));

  } catch (e) {
    Navigator.pushReplacement(context, NavigationService.fadeInTransition(const GetStartedScreen()));
  }

}
