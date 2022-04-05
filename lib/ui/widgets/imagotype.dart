import 'package:flutter/material.dart';

import '../../constants.dart';

class Imagotype extends StatelessWidget {

  final Widget? title;

  const Imagotype({
    Key? key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/treewo_logo.png', filterQuality: FilterQuality.high),
            const SizedBox(height: 8),
            title ?? Text('TreeWo', style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold
            ))
          ]
      ),
    );
  }
}
