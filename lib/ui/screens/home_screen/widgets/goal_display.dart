import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../../../providers/providers.dart';
import '../../../../services/services.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';
import 'widgets.dart';

class GoalDisplay extends StatelessWidget {

  const GoalDisplay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final movementProvider = Provider.of<MovementProvider>(context);

    final movementDetails = movementProvider.movementDetails;

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                text: TextSpan(
                    text: 'You have walked \n',
                    style: textTheme.headline5!.copyWith(color: Colors.black87),
                    children: [
                      TextSpan(
                          text:
                              '${movementDetails.plantedTreesPercent }% ',
                          style: textTheme.headline5!.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600)),
                      const TextSpan(text: 'of your goal!')
                    ]),
              ),
            )),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          width: 160,
          child: RadialProgress(
            primaryColor: kSecundaryColor,
            percentage: movementDetails.walkingPlantedtreesPercent,
            child: RadialProgress(
              primaryColor: kPrimaryColor,
              percentage: movementDetails.cyclingPlantedtreesPercent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${movementDetails.totalPlantedTrees}',
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Trees planted!',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    )
                  ]),
            ),
          ),
        ),
        const SizedBox(height: 10),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButtom(
                label: 'Walking',
                icon: FontAwesomeIcons.personWalking,
                iconColor: kSecundaryColor,
                onPressed: () => Navigator.push(context, NavigationService.fadeInTransition(const PhysicalActivityScreen(movingType: MovingType.walking))),
              ),
              CustomIconButtom(
                label: 'Cycling',
                icon: FontAwesomeIcons.personBiking,
                iconColor: kPrimaryColor,
                onPressed: () => Navigator.push(context, NavigationService.fadeInTransition(const PhysicalActivityScreen(movingType: MovingType.cycling))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}