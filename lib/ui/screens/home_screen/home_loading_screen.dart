
import 'package:flutter/material.dart';

import '../../../providers/providers.dart';
import '../../../services/services.dart';

import '../../screens/screens.dart';

class HomeLoadingScreen extends StatefulWidget {
  const HomeLoadingScreen({Key? key}) : super(key: key);


  @override
  _HomeLoadingScreenState createState() => _HomeLoadingScreenState();
}

class _HomeLoadingScreenState extends State<HomeLoadingScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200), lowerBound: 0.96);
    _controller.repeat(reverse: true);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
    _getPhysicalActivityDetails(context);
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
     body:Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset('assets/loading.png', height: 150),
           const SizedBox(height: 20),
           AnimatedBuilder(
                animation: _controller,   
                child: const Text('Loading physical activity ...'),      
                builder: (context, child) {

                  return Opacity(
                    opacity: ((_controller.value * 10) - 9).clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: _controller.value,
                      child: child,
                    ),
                  );
                }),
         ],
       ),
     )
    );
  }

}

Future<void> _getPhysicalActivityDetails(BuildContext context) async{

  final userProvider = Provider.of<UserProvider>(context, listen: false);
  final movementProvider = Provider.of<MovementProvider>(context, listen: false);

  try {
    final ready = await movementProvider.getUserMovementsDetails();

    if(ready){
     Navigator.pushReplacement(context, NavigationService.fadeInTransition(const HomeScreen()));
    } 

  } catch (e) {
    userProvider.logOut();
    Navigator.pushReplacement(context, NavigationService.fadeInTransition(const GetStartedScreen()));
  }

}
