

import 'package:tree_wo/models/leaderboard_model.dart';

import 'tree_woo_api_simulator.dart';

class LeaderBoardService {

  static Future<LeaderBoardModel> getLeaderBoard() async {

    try {
      
      final resp = await TreeWoApiSimulator.getLeaderBoard();

      final leaderBoardResponse = LeaderBoardModel.fromMap(resp);

      return leaderBoardResponse;

    } catch (e) {
      rethrow;
    }
  }


}
