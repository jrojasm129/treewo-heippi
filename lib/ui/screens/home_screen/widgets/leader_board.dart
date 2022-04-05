
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tree_wo/models/leaderboard_model.dart';
import 'package:tree_wo/services/services.dart';

import '../../../../constants.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
      future: LeaderBoardService.getLeaderBoard(),
      builder: (_, AsyncSnapshot<LeaderBoardModel> snapshot) {

        if (snapshot.hasError) return const SizedBox.shrink();

        final leaderBoard = snapshot.data;

        return Card(
          color: const Color(0xffF6F6F6),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('LeaderBoard ${leaderBoard?.date ?? ''}',
                        style: textTheme.titleMedium!.copyWith(
                            color: kPrimaryColor, fontWeight: FontWeight.bold)),
                    const IconButton(
                      icon: Icon(Icons.replay_outlined, color: kSecundaryColor,), 
                      onPressed: LeaderBoardService.getLeaderBoard,
                    )        
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Top of groups with the largets trees planted',
                  style: textTheme.subtitle2,
                ),

                const SizedBox(height: 20),

                ...leaderBoard?.leaders.map((e) => _LeaderItem(leader: e)).toList() ??
                List.generate(3, (index) => const _EmptyLeaderItem())
                
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LeaderItem extends StatelessWidget {

  final Leader leader;

  const _LeaderItem({
    Key? key,
     required this.leader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        title: Text(leader.groupName,
            style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text('${leader.plantedTrees} trees planted'),
        trailing:
            leader.position <= 3
            ? Icon(
              FontAwesomeIcons.medal, 
              color: leader.position == 1
                ? Colors.amber
                : leader.position == 2
                 ? Colors.grey
                 : Colors.deepOrange
            )
            : const SizedBox.shrink()
      ),
    );
  }
}

class _EmptyLeaderItem extends StatelessWidget {

  const _EmptyLeaderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10)
      )
    );
  }
}


