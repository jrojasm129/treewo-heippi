import 'package:flutter/material.dart';
import 'package:tree_wo/ui/screens/home_screen/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                  
                       SizedBox(height: 15),
                      
                       HomeCustomAppBar(),
                  
                       SizedBox(height: 15),
                      
                       GoalDisplay(),
                  
                       SizedBox(height: 10),
                  
                       MotionControls(),
                      
                       SizedBox(height: 20),
                      
                      LeaderBoard(),

                       SizedBox(height: 10),
                      
                    ],         
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}


