import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';

class DefaultNameAvatar extends StatelessWidget {
  final String name;
  const DefaultNameAvatar({ Key? key, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final splitedName = name.split(' ');

    String subName = '';
   
    splitedName.length > 1
    ? subName = splitedName[0].substring(0,1) + splitedName[1].substring(0,1)
    : subName = splitedName[0].substring(0,2);

    return CircleAvatar(
      radius: 15,
      backgroundColor: kSecundaryColor,
      child: Text(
        subName.toUpperCase(), 
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}