import 'package:flutter/material.dart';
import 'coming_soon_info_card.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({Key? key}) : super(key: key);

  // Mock data for demonstration purposes
  final List<Map<String, dynamic>> mockData = [
    {'title': 'Movie A', 'description': 'Description A'},
    {'title': 'Movie B', 'description': 'Description B'},
    {'title': 'Movie C', 'description': 'Description C'},
    // Add more mock data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockData.length,
      itemBuilder: (BuildContext context, int index) {
        final movieInfo = mockData[index];
        return const ComingSoonInfoCard();
      },
    );
  }
}
