import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:tree_wo/providers/movent_provider.dart';

class MovementDetailsModel {
    MovementDetailsModel({
        required this.goal,
        required this.cycling,
        required this.walking,
    });

    int goal;
    DataModel cycling;
    DataModel walking;
    bool _added = false;

    factory MovementDetailsModel.fromJson(String str) => MovementDetailsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovementDetailsModel.fromMap(Map<String, dynamic> json) => MovementDetailsModel(
        goal: json["goal"],
        cycling: DataModel.fromMap(json["cycling"]),
        walking: DataModel.fromMap(json["walking"]),
    );

    factory MovementDetailsModel.empty() => MovementDetailsModel(
      cycling: DataModel(plantedTrees: 0, data: []), 
      walking: DataModel(plantedTrees: 0, data: []),
      goal: 0
    );

    Map<String, dynamic> toMap() => {
        "goal": goal,
        "cycling": cycling.toMap(),
        "walking": walking.toMap(),
    };

    int get totalPlantedTrees{    
      return cycling.plantedTrees + walking.plantedTrees;
    }

    int get plantedTreesPercent{
      return goal> 0 ? ((totalPlantedTrees / goal)*100).round() : 0;
    }

    double get cyclingPlantedtreesPercent{
      return totalPlantedTrees > 0 ? (cycling.plantedTrees / totalPlantedTrees)*100 : 0;
    }

    double get walkingPlantedtreesPercent{
      return totalPlantedTrees > 0 ? (walking.plantedTrees / totalPlantedTrees)*100 : 0;
    }

    void addWalkingDataItem(DataModelItem item){
      for (var element in walking.data) {
          if (element.date == item.date){
            element.planted += 1;
            _added = true;
          }
      } 
        if(_added == false){
           walking.data.add(item);
        }

       _added = false; 
    }

    void addCyclingDataItem(DataModelItem item){
      for (var element in cycling.data) {
          if (element.date == item.date){
            element.planted += 1;
            _added = true;
          }
      } 
        if(_added == false){
           cycling.data.add(item);
        }

      _added = false;  
    }

    DataModelItem? getBestCyclingDayItem(){
      DataModelItem? dataItem; 
      int n = 0;
      for (var element in cycling.data) {
          if (element.planted >= n){
            n = element.planted;
            dataItem = element;
          }
      }  

      return dataItem; 
    }

    DataModelItem? getBestWalkingDayItem(){
      DataModelItem? dataItem; 
      int n = 0;
      for (var element in walking.data) {
          if (element.planted >= n){
            n = element.planted;
            dataItem = element;
          }
      }  

      return dataItem; 
    }

    List<charts.Series<DataModelItem, String>> getChartSeriesData({required MovingType movingType, Color color = Colors.lightBlue}) {
     
     final data =  movingType == MovingType.walking
      ? walking.data
      : cycling.data;
      
     final series = [
      charts.Series(
          id: "Moving",
          data: data,
          domainFn: (DataModelItem series, _) => series.date,
          measureFn: (DataModelItem series, _) => series.planted,
          colorFn: (DataModelItem series, _) => charts.ColorUtil.fromDartColor(color))
    ];
    return series;
  }
}

class DataModel {
    DataModel({
        required this.plantedTrees,
        required this.data,
    });

    int plantedTrees;
    List<DataModelItem> data;

    String toJson() => json.encode(toMap());

    factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        plantedTrees: json["plantedTrees"],
        data: List<DataModelItem>.from(json["data"].map((x) => DataModelItem.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "plantedTrees": plantedTrees,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class DataModelItem {
    DataModelItem({
        required this.date,
        required this.planted,
    });

    String date;
    int planted;

    factory DataModelItem.fromJson(String str) => DataModelItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataModelItem.fromMap(Map<String, dynamic> json) => DataModelItem(
        date: json["date"],
        planted: json["planted"],
    );

    Map<String, dynamic> toMap() => {
        "date": date,
        "planted": planted,
    };
}
