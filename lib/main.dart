import 'package:flutter/material.dart';
import 'package:dice_roller/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'utils/themes_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dice Roller with Theme Toggler',
            theme: notifier.darkTheme ? dark : light,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
