import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';
import 'package:tree_wo/services/services.dart';
import 'package:tree_wo/ui/screens/screens.dart';
import 'package:tree_wo/ui/widgets/widgets.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({ Key? key }) : super(key: key);

  final List<BottomTitledImage> slideshow = const [
    BottomTitledImage(          
          title: 'Sowing hope for the planet',
          image: AssetImage('assets/get_started1.png'),
          fit: BoxFit.scaleDown,
        ),
    BottomTitledImage(
      title: 'Join us on this mission ',  
      image: AssetImage('assets/get_started2.png'),
      fit: BoxFit.scaleDown,
    )    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f8e9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  
                  const SizedBox(height: 25),
            
                  const _Imagotype(),
            
                  Expanded(
                    child: HorizontalSlider(
                      activeDotColor: kSecundaryColor.withOpacity(0.6),
                      inactiveDotColor: kSecundaryColor.withOpacity(0.3),
                      children: slideshow
                    ),
                  ),
            
                 const SizedBox(height: 15),
            
                 CustomOutlinedButtom(
                   label: 'Get Started',
                   onPressed: ()=> Navigator.pushReplacement(context, NavigationService.fadeInTransition(const RegisterScreen())),
                 ),
            
                 const SizedBox(height: 25),
            
                  LinkLabel(
                    label: 'Already have account?', 
                    linkLabel: 'Sign in',
                    linkLabelColor: kPrimaryColor,
                    ontap: () => Navigator.pushReplacement(context, NavigationService.fadeInTransition(const LoginScreen())), 
                  ),
            
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

class _Imagotype extends StatelessWidget {
  const _Imagotype({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Imagotype(
        title: RichText(
          text: TextSpan(
            text: 'Welcome To ',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(text: 'TreeWo',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold
                ))
          ])
        )
      ),
    );
  }
}
