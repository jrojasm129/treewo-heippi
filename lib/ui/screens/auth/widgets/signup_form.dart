
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../providers/providers.dart';
import '../../../../services/services.dart';
import '../../../widgets/widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);


  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() { 
   _nameController     = TextEditingController();
   _emailController    = TextEditingController();
   _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() { 
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final registerFormProvider = Provider.of<RegisterFormProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return Form(
      key: registerFormProvider.registerFormKey,
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
                        text: 'Sign up To ',
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
             controller: _nameController,
             icon: Icons.person_outline,
             hintText: 'User name',
             textInputAction: TextInputAction.next,
             filled: true,
             filledColor: Colors.white54,
             validator: (value) {
               if( ((value?? '').trim().isNotEmpty) && ((value?? '').trim().length >= 5)) return null;
                   
               return 'Please enter at least 5 characters.';
             },
             onChanged: (value) {
               registerFormProvider.name = value.trim();
             },
           ),
            
           const SizedBox(height: 20),
           
           CustomTextFormField(
             controller:  _emailController,
             icon: Icons.email_outlined,
             keyboardType: TextInputType.emailAddress,
             textInputAction: TextInputAction.next,
             hintText: 'Email address',
             filled: true,
             filledColor: Colors.white54,
             validator: (value) {

               if(value == null || value.trim().isEmpty){
                 return 'The email address can\'t be empty.'; 
               }

               if(Validators.validateEmail(value)) return null;
               return 'Invalid email address format.';                
             },
             onChanged: (value) {
               registerFormProvider.email = value.trim();
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
               registerFormProvider.password = value;
             },
           )
         ],
      ),
    );
  }

}