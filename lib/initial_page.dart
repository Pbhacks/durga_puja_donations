import 'package:flutter/material.dart';

import 'content_card.dart';
import 'gooey_carousel.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            color: 'Red',
            altColor: const Color(0xFF4259B2),
            title: "Invoke Durga Mata's Blessings",
            subtitle:
                'Start your day with a serene prayer to Durga Mata,the Divine Mother, seeking her blessings for a peaceful and prosperous day.',
          ),
          ContentCard(
              color: 'Yellow',
              altColor: const Color(0xFF904E93),
              title: "Find Solace in Durga Mata's Presence",
              subtitle:
                  'Offer your prayers and find solace in the divine presence of Durga Mata. Practice meditation and breathing exercises to calm your mind and soul.'),
          ContentCard(
            color: 'Blue',
            altColor: const Color(0xFFFFB138),
            title: "Rest Under Durga Mata's Watch",
            subtitle:
                'Conclude your day with a prayer to Durga Mata, seeking her protection and ensuring a peaceful night\'s sleep',
          ),
        ],
      ),
    );
  }
}
