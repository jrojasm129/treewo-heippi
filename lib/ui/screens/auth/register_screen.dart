import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';
import 'package:tree_wo/providers/providers.dart';
import 'package:tree_wo/ui/screens/auth/login_screen.dart';

import '../../../services/services.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xfff1f8e9),
       body: ChangeNotifierProvider(
       create: (context) => RegisterFormProvider(),
     
       child: Builder(
         builder: (context) {
           
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              physics: const BouncingScrollPhysics(),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                                    
                    Container(
                      constraints: const  BoxConstraints(maxWidth: 500),
                      padding: const  EdgeInsets.symmetric(horizontal: 20),
                      child: const SignUpForm()
                    ),  
                        
                    const SizedBox(height: 20),
                        
                    Container(
                      constraints: const BoxConstraints(maxWidth: 350),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const TermsAndConditions()
                    ),
                        
                    const SizedBox(height: 30),
                        
                    CustomOutlinedButtom(        
                      label: 'SIGN UP', 
                      onPressed: () {            
                       
                        try {
                        
                          FocusScope.of(context).unfocus();
                        
                          if (!registerFormProvider.validateRegisterForm()) return;
                      
                            NotificationService.showSnackbarSucces('Registro en desarrollo');
                        
                        } catch (e) {
                          NotificationService.showSnackbarError('$e');
                        }
                        
                      }
                    ),
                        
                    const SizedBox(height: 20),
                        
                    LinkLabel(
                      label: 'Already have account?', 
                      linkLabel: 'Sign in',
                      linkLabelColor: kPrimaryColor,
                      ontap: () => Navigator.pushReplacement(context, NavigationService.fadeInTransition(const LoginScreen())), 
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