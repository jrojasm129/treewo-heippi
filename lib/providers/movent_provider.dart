import 'dart:async';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/services.dart';

enum MovingType{
  walking,
  cycling
}

class MovementProvider extends ChangeNotifier{

  late MovementDetailsModel movementDetails;

  bool isMoving = false;
  MovingType movingType = MovingType.walking;
  late Timer timer;
  String startTime = '';
  int _steps = 0;

  Future<bool> getUserMovementsDetails() async {
    try {        
        final resp = await TreeWoApiSimulator.getUserMovementdetails();

        movementDetails = MovementDetailsModel.fromMap(resp);
        
        return true;
        
    } catch (e) {
        rethrow;
    }
  }

  void plantTree(){
    _steps += 1;
    if(movingType == MovingType.walking){
      if(_steps == 5){
        final time = DateTime.now();
        final postTime = '${time.day.toString().padLeft(2, '0')}:${time.month.toString().padLeft(2, '0')}';
        _steps = 0;
        movementDetails.walking.plantedTrees += 1;
        movementDetails.addWalkingDataItem(DataModelItem(date: postTime, planted: 1));

        notifyListeners();
      }
    }

    if(movingType == MovingType.cycling){
      if(_steps == 20){
        _steps = 0;
        final time = DateTime.now();
        final postTime = '${time.day.toString().padLeft(2, '0')}:${time.month.toString().padLeft(2, '0')}';
        _steps = 0;
        movementDetails.cycling.plantedTrees += 1;
        movementDetails.addCyclingDataItem(DataModelItem(date: postTime, planted: 1));
        notifyListeners();
      }
    }
  }

  startMoving({required MovingType type}){
    final time = DateTime.now();
    movingType = type;
    isMoving = true;
    startTime =' ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    timer = Timer.periodic(const Duration(seconds: 3), (_) => plantTree());
    
    notifyListeners();
  }

  stopMoving(){
    timer.cancel();
    isMoving = false;
    _steps = 0;

    notifyListeners();
  }



}