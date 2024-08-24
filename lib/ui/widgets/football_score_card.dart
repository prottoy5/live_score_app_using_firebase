import 'package:firebase_app/ui/entities/football.dart';
import 'package:flutter/material.dart';

class FootBallScoreCard extends StatelessWidget {
  const FootBallScoreCard({
    super.key,
    required this.footBall,
  });

  final FootBall footBall;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeam(footBall.team1Name, footBall.team1Score),
            Text('vs'),
            _buildTeam(footBall.team2Name, footBall.team2Score)
          ],
        ),
      ),
    );
  }

  Widget _buildTeam(String teamName, int score) {
    return Column(
      children: [
        Text(
          score.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          teamName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
