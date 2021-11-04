import 'package:flutter/material.dart';

import 'Loop Animation/ripple_animation.dart';
import 'Other Animations/expandable_latter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const RippleAnimationScreen()
    );
  }
}
