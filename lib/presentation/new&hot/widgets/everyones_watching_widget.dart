import 'package:flutter/material.dart';
import 'everyones_watching_info_card.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  // Mock data for demonstration purposes
  final List<Map<String, dynamic>> mockData = [
    {'title': 'Movie 1', 'description': 'Description 1'},
    {'title': 'Movie 2', 'description': 'Description 2'},
    {'title': 'Movie 3', 'description': 'Description 3'},
    // Add more mock data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: mockData.length,
      itemBuilder: (BuildContext context, int index) {
        final movieInfo = mockData[index];
        return const EveryonesWatchingInfoCard();
      },
    );
  }
}
