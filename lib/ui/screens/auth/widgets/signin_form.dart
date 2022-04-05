import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../providers/providers.dart';
import '../../../../services/services.dart';
import '../../../widgets/widgets.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);


  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() { 
   _emailController    = TextEditingController();
   _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() { 
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Form(
        key: loginFormProvider.loginFormKey,
    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [    
    
              Image.asset(
                'assets/login.png',
                height: screenSize.height * 0.25,
              ),
              
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                      text: TextSpan(
                          text: 'Sign in To ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                          children: [
                    TextSpan(
                        text: 'TreeWo',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: kPrimaryColor, fontWeight: FontWeight.bold))
                  ])),
                )),
              
              const SizedBox(height: 45),
              
              CustomTextFormField(
                controller:  _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                filled: true,
                filledColor: Colors.white54,
                icon: Icons.email_outlined,
                hintText: 'Email address',
                validator: (value) {  
    
                   if(value == null || value.trim().isEmpty){
                    return 'The email address can\'t be empty.'; 
                   }
    
                  if(Validators.validateEmail(value)) return null;
                  return 'Invalid email address format.';                
                },
    
                onChanged: (value) {  
                  loginFormProvider.email = value.trim();
                },
              ) ,
              
              const SizedBox(height: 20),
              
              CustomTextFormField(
                controller: _passwordController,
                showVisibilityIcon: true,
                icon: Icons.lock_outline_rounded,
                textInputAction: TextInputAction.done,
                hintText: 'Password',
                filled: true,
                filledColor: Colors.white54,
                validator: (value) {                          
                  if( ((value?? '').trim().isNotEmpty) && ((value?? '').trim().length >= 6)) return null;
                  return 'Please enter at least 6 characters.';
                },
                onChanged: (value) {    
                  loginFormProvider.password = value;
                },
              ),
    
              const SizedBox(height: 8)
            ],
        ),
      ),
    );
  }

}