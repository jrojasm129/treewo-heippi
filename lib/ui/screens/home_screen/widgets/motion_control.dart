
import 'package:flutter/material.dart';
import 'package:tree_wo/ui/screens/home_screen/widgets/elapsed_time.dart';

import '../../../../providers/providers.dart';
import '../../../modals/start_movement_modal.dart';
import '../../../widgets/widgets.dart';

class MotionControls extends StatelessWidget {
  const MotionControls({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final movementProvider = Provider.of<MovementProvider>(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      child: movementProvider.isMoving
          ? const _MovingDetails()
          : const _StartButtom(),
    );
  }
}

class _MovingDetails extends StatelessWidget {
  const _MovingDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final movementProvider = Provider.of<MovementProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movementProvider.movingType == MovingType.cycling ? 'Cycling' : 'Walking',
                style: textTheme.subtitle2
              ),

              Text(
                'Started at ${movementProvider.startTime}',
                style: textTheme.subtitle2
              ),
            ],
          ),

          const SizedBox(height: 20),

          const ElapsedTime(),

          const SizedBox(height: 20),

          CustomOutlinedButtom(
            height: 40,
            width: 150,
            label: 'Stop',
            onPressed: movementProvider.stopMoving,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8)
      )
    );
  }
}

class _StartButtom extends StatelessWidget {
  const _StartButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    final movementProvider = Provider.of<MovementProvider>(context);

    return CustomOutlinedButtom(
      height: 40,
      width: 150,
      label: 'Start',
      onPressed: (){
        showModalBottomSheet(
          context: context, 
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withOpacity(0.2),
          builder: (_) => StartMovementModal(
            movementProvider: movementProvider,
          ),
        );
      },
    );
  }
}


