import 'package:flutter/material.dart';
import 'package:metal_calculator/screens/hexagon_screen.dart';
import 'package:provider/provider.dart';
import 'controllers/angle_controller.dart';
import 'controllers/beams_controller.dart';
import 'controllers/channel_controller.dart';
import 'controllers/flat_bar_controller.dart';
import 'controllers/round_bar_controller.dart';
import 'controllers/round_tube_controller.dart';
import 'controllers/sheet_controller.dart';
import 'controllers/square_bar_controller.dart';
import 'controllers/square_tube_controller.dart';
import 'controllers/hexagon_controller.dart';
import 'controllers/t_bar_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HexagonController()),
        ChangeNotifierProvider(create: (_) => RoundBarController()),
        ChangeNotifierProvider(create: (_) => RoundTubeController()),
        ChangeNotifierProvider(create: (_) => SquareBarController()),
        ChangeNotifierProvider(create: (_) => SquareTubeController()),
        ChangeNotifierProvider(create: (_) => ChannelController()),
        ChangeNotifierProvider(create: (_) => FlatBarController()),
        ChangeNotifierProvider(create: (_) => SheetController()),
        ChangeNotifierProvider(create: (_) => BeamsController()),
        ChangeNotifierProvider(create: (_) => AngleController()),
        ChangeNotifierProvider(create: (_) => TBarController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HexagonScreen(),
      ),
    );
  }
}
