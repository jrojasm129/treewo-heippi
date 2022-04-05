import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';
import '../../../../providers/providers.dart';

class BestDay extends StatelessWidget {

  final MovingType movingType;

  const BestDay({
    Key? key,
    required this.movingType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final movemenDetails = Provider.of<MovementProvider>(context).movementDetails;
    final textTheme = Theme.of(context).textTheme;

    final bestDayItem = movingType == MovingType.walking
      ? movemenDetails.getBestWalkingDayItem()
      : movemenDetails.getBestCyclingDayItem();

    final color =  movingType == MovingType.walking
     ? kSecundaryColor
     :kPrimaryColor;

    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text('Best day', style: textTheme.titleSmall!.copyWith(color: Colors.white)),
                  const SizedBox(height: 5),
                  Text(
                    bestDayItem?.date ?? '',
                    style: textTheme.subtitle1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Text('Trees planted', style: textTheme.bodyMedium),
            Text(
              '${bestDayItem?.planted ?? '0'}',
              style: textTheme.headlineSmall!.copyWith(
                color: color,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }
}