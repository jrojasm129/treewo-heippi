import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';
import 'package:tree_wo/ui/screens/home_screen/home_loading_screen.dart';
import 'package:tree_wo/ui/screens/screens.dart';

import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../widgets/widgets.dart';
import '../../screens/auth/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xfff1f8e9),
       body: ChangeNotifierProvider(
       create: (context) => LoginFormProvider(),
     
       child: Builder(
         builder: (context) {
           
          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);
          final processing = Provider.of<UserProvider>(context).processing;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              physics: const BouncingScrollPhysics(),
              child: Align(
                alignment: Alignment.center,
                child: Column(            
                  children: [              
                    
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const SignInForm()
                    ),
                
                    const SizedBox(height: 30),
                    
                    processing
                     ? const CircularProgressIndicator()
                     : CustomOutlinedButtom(     
                      label: 'SIGN IN', 
                      onPressed: () async {  
                
                        final userProvider = Provider.of<UserProvider>(context, listen: false);  
                
                        try {
                
                          FocusScope.of(context).unfocus();
                
                          if (!loginFormProvider.validateLoginForm()) return;
                
                          final isLoggedin = await userProvider.login(loginFormProvider.email.trim(), loginFormProvider.password.trim());  
                
                          if(!isLoggedin) {
                            NotificationService.showSnackbarError('Email / Password incorrectos.');
                          }
                
                          Navigator.pushReplacement(context, NavigationService.fadeInTransition(const HomeLoadingScreen()));
                
                        } catch (e) {
                          
                          NotificationService.showSnackbarError('$e');
                        }
                
                      }
                    ),
                
                    const SizedBox(height: 20),
                
                    LinkLabel(
                      label: 'Don\'t have an account?', 
                      linkLabel: 'Sign up',
                      linkLabelColor: kPrimaryColor,
                      ontap: () => Navigator.pushReplacement(context, NavigationService.fadeInTransition(const RegisterScreen())) 
                    )
                
                  ],
                   ),
              ),
            ),
          );

         },
       ),
      ),
     );
  }
}