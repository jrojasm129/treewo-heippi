

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tree_wo/providers/providers.dart';

import '../../constants.dart';
import '../widgets/widgets.dart';

class StartMovementModal extends StatefulWidget {

  final MovementProvider movementProvider;

  const StartMovementModal({ Key? key, required this.movementProvider }) : super(key: key);

  @override
  State<StartMovementModal> createState() => _StartMovementModalState();
}

class _StartMovementModalState extends State<StartMovementModal> {

  bool isWalkingMode = true;

  void changeWalkingmode(bool value){
    setState(() {
      isWalkingMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;    

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30)
        ),
        height: screenSize.height * 0.33,
        child: Column(
          children: [

            const SizedBox(height: 10),
            
                 Container(
                   height: 5,
                   width: 30,
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius: BorderRadius.circular(10)
                   ),
                 ),     
            
            const SizedBox( height: 20),  


            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [   
              
                   Text('Choose your modality', style: textTheme.subtitle2),
              
                   const SizedBox( height: 15), 
              
                   FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButtom(
                                backGroundColor: isWalkingMode ? kPrimaryColor.withOpacity(0.2) : null,
                                label: 'Walking', 
                                icon:  FontAwesomeIcons.personWalking,
                                iconColor: kSecundaryColor,
                                onPressed: (){
                                  changeWalkingmode(true);
                                }
                              ),
                              CustomIconButtom(
                                backGroundColor: !isWalkingMode ? kPrimaryColor.withOpacity(0.2) : null,
                                label: 'Cycling', 
                                icon:  FontAwesomeIcons.personBiking,
                                iconColor: kPrimaryColor,
                                onPressed: (){
                                 changeWalkingmode(false);
                                },
                              ),
                            ],
                          ),
                   ),
              
                   const SizedBox( height: 20), 
              
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CustomOutlinedButtom(
                             height: 40,
                             width: 150,
                             label: 'Start',
                             onPressed: (){
                               
                               widget.movementProvider.startMoving(
                                 type: isWalkingMode
                                  ? MovingType.walking
                                  : MovingType.cycling
                               );

                               Navigator.pop(context);
                             }
                      ),
                    ),
            
                    const SizedBox( height: 20), 
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}