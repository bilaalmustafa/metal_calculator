import 'package:flutter/material.dart';

import 'angle_screen.dart';
import 'beams_screen.dart';
import 'channel_screen.dart';
import 'flat_bar_screen.dart';
import 'hexagon_screen.dart';
import 'round_bar_screen.dart';
import 'round_tube_screen.dart';
import 'square_bar_screen.dart';
import 'square_tube_screen.dart';
import 't_bar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> structures = const [
    {
      "name": "Hexagon",
      "image": "assets/hexagon.png",
      "screen": HexagonScreen()
    },
    {
      "name": "Round Bar",
      "image": "assets/round_bar.png",
      "screen": RoundBarScreen()
    },
    {
      "name": "Round Tube",
      "image": "assets/round_tube.png",
      "screen": RoundTubeScreen()
    },
    {
      "name": "Square Bar",
      "image": "assets/square_bar.png",
      "screen": SquareBarScreen()
    },
    {
      "name": "Square Tube",
      "image": "assets/square_tube.png",
      "screen": SquareTubeScreen()
    },
    {"name": "T Bar", "image": "assets/t_bar.png", "screen": TBarScreen()},
    {"name": "Beam", "image": "assets/beam.png", "screen": BeamsScreen()},
    {
      "name": "Channel",
      "image": "assets/channel.png",
      "screen": ChannelScreen()
    },
    {"name": "Angle", "image": "assets/angle.png", "screen": AngleScreen()},
    {
      "name": "Flat Bar",
      "image": "assets/flat_bar.png",
      "screen": FlatBarScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: structures.length,
        itemBuilder: (context, index) {
          final item = structures[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  backgroundImage: AssetImage(item["image"]!),
                ),
                title: Text(
                  item["name"]!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    _navigateToScreen(context, item["screen"]);
                  },
                ),
                onTap: () {
                  _navigateToScreen(context, item["screen"]);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
