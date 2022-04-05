import 'dart:convert';

class LeaderBoardModel {
    LeaderBoardModel({
        required this.date,
        required this.leaders,
    });

    String date;
    List<Leader> leaders;

    factory LeaderBoardModel.fromJson(String str) => LeaderBoardModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LeaderBoardModel.fromMap(Map<String, dynamic> json) => LeaderBoardModel(
        date: json["date"],
        leaders: List<Leader>.from(json["leaders"].map((x) => Leader.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "date": date,
        "leaders": List<dynamic>.from(leaders.map((x) => x.toMap())),
    };
}

class Leader {
    Leader({
        required this.groupName,
        required this.position,
        required this.plantedTrees,
    });

    String groupName;
    int position;
    int plantedTrees;

    factory Leader.fromJson(String str) => Leader.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Leader.fromMap(Map<String, dynamic> json) => Leader(
        groupName: json["groupName"],
        position: json["position"],
        plantedTrees: json["planted_trees"],
    );

    Map<String, dynamic> toMap() => {
        "groupName": groupName,
        "position": position,
        "planted_trees": plantedTrees,
    };
}
