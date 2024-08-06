import 'package:flutter/material.dart';
import 'package:workshop_flutterfriends/src/page/mix_page.dart';
import 'package:workshop_flutterfriends/src/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter and Friends Workshop',
      theme: buildTheme(),
      home: const MixPage(),
    );
  }
}
