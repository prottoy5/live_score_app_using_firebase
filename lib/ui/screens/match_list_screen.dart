import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/ui/entities/football.dart';
import 'package:flutter/material.dart';

import '../widgets/football_score_card.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<FootBall> matchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FootBall'),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: firebaseFirestore.collection('football').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No Matches Found'));
          }

          matchList.clear();

          for (QueryDocumentSnapshot<Map<String, dynamic>> doc
              in snapshot.data!.docs) {
            matchList.add(
              FootBall(
                matchName: doc.id,
                team1Name: doc.data()['team1Name'] ?? 'Unknown',
                team2Name: doc.data()['team2Name'] ?? 'Unknown',
                team1Score: doc.data()['team1Score'] ?? 0,
                team2Score: doc.data()['team2Score'] ?? 0,
              ),
            );
          }

          return ListView.builder(
            itemCount: matchList.length,
            itemBuilder: (context, index) {
              return FootBallScoreCard(
                footBall: matchList[index],
              );
            },
          );
        },
      ),
    );
  }
}
