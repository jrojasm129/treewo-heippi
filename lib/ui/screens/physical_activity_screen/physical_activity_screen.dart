import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tree_wo/providers/providers.dart';
import 'package:tree_wo/ui/screens/physical_activity_screen/widgets/best_day.dart';
import 'package:tree_wo/ui/screens/physical_activity_screen/widgets/chart.dart';

import '../../../constants.dart';
import '../../widgets/widgets.dart';

class PhysicalActivityScreen extends StatefulWidget {
  final MovingType movingType;

  const PhysicalActivityScreen({Key? key, this.movingType = MovingType.walking})
      : super(key: key);

  @override
  State<PhysicalActivityScreen> createState() => _PhysicalActivityScreenState();
}

class _PhysicalActivityScreenState extends State<PhysicalActivityScreen> {
  late bool isWalkingMode;

  @override
  void initState() {
    super.initState();
    isWalkingMode = widget.movingType == MovingType.walking;
  }

  void changeWalkingmode(bool value) {
    setState(() {
      isWalkingMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black87),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    
                        Text(isWalkingMode ? 'Walking' : 'Cycling',
                            style: textTheme.headline5!
                                .copyWith(fontWeight: FontWeight.bold)
                        ),
                    
                        const SizedBox(height: 10),
                    
                        Text('Keep moving everyday to meet your tree goal',
                            style: textTheme.subtitle1),
          
                        const SizedBox(height: 8),
                    
                        Chart(
                          height: screenSize.height * 0.4,
                          showWalkingChart: isWalkingMode
                        ),
                    
                    
                        const SizedBox(height: 20),
                        
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButtom(
                                  backGroundColor: isWalkingMode
                                      ? kPrimaryColor.withOpacity(0.2)
                                      : null,
                                  label: 'Walking',
                                  icon: FontAwesomeIcons.personWalking,
                                  iconColor: kSecundaryColor,
                                  onPressed: () {
                                    changeWalkingmode(true);
                                  }),
                              CustomIconButtom(
                                backGroundColor: !isWalkingMode
                                    ? kPrimaryColor.withOpacity(0.2)
                                    : null,
                                label: 'Cycling',
                                icon: FontAwesomeIcons.personBiking,
                                iconColor: kPrimaryColor,
                                onPressed: () {
                                  changeWalkingmode(false);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
                BestDay(movingType: isWalkingMode ? MovingType.walking : MovingType.cycling)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



