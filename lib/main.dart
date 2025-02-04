import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/hexagon_screen.dart';
import 'controllers/hexagon_controller.dart';

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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HexagonScreen(),
      ),
    );
  }
}
