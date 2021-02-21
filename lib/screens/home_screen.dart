import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import '../utils/themes_provider.dart';
import 'package:provider/provider.dart';

import '../utils/themes_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating reference to asset image
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

//store the dice image which is being shown on the screen
  AssetImage diceImage;
  Icon _themeIcon;
  @override
  void initState() {
    super.initState();
    setState(() {
      // loadTheme();
      diceImage = one;
      _themeIcon = Icon(
        Icons.bedtime,
        size: 33.0,
      );
    });
  }

  void rollDice() {
    int random = (1 + Random().nextInt(6));
    AssetImage newImage;

    switch (random) {
      case 1:
        newImage = one;
        break;

      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }

    setState(() {
      diceImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                fontStyle: FontStyle.italic)),
        actions: [
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => IconButton(
              icon: _themeIcon,
              onPressed: () {
                bool _isDark = notifier.toggleTheme();
                setState(() {
                  _isDark
                      ? _themeIcon = Icon(
                          Icons.wb_sunny_sharp,
                          size: 33.0,
                        )
                      : _themeIcon = _themeIcon = Icon(
                          Icons.bedtime,
                          size: 33.0,
                        );
                });
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: diceImage,
                width: 150.0,
                height: 150.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: MaterialButton(
                  child: Text("Roll the dice",
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.orangeAccent,
                  padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  onPressed: rollDice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
