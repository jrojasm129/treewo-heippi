import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../../constants.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(

        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(color: Colors.black87),
          text: 'By continuing you accept the TreeWo ',
          children: [
            TextSpan(
               text: ' User Agreement',
               style: TextStyle(color: kPrimaryColor.withOpacity(0.8), fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                ..onTap = () => print('Accept User Agreement')
            )
          ]
        )
        
      ),
    );
  }
}