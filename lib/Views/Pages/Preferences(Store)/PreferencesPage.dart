import 'package:flagfall/ViewModels/ThemeViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'PreferencesRow.dart';

class PreferencesPage extends StatelessWidget {
  final Map<String, List<ThemeViewModel>> myStore = {
    'Color Scheme': [
      ThemeViewModel('assets\\images\\StoreColorFlagFall.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\StoreColorDefault.png', 'Default'),
      ThemeViewModel('assets\\images\\StoreColorClassic.png', 'Classic'),
      ThemeViewModel('assets\\images\\StoreColorFlagFall.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\StoreColorDefault.png', 'Default'),
      ThemeViewModel('assets\\images\\StoreColorClassic.png', 'Classic'),
      ThemeViewModel('assets\\images\\StoreColorFlagFall.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\StoreColorDefault.png', 'Default'),
      ThemeViewModel('assets\\images\\StoreColorClassic.png', 'Classic'),
    ],
    'Pieces Scheme': [
      ThemeViewModel('assets\\images\\StorePiecesFlagFall.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\StorePiecesDefault.png', 'Default'),
      ThemeViewModel('assets\\images\\StorePiecesClassic.png', 'Classic'),
      ThemeViewModel('assets\\images\\StorePiecesFlagFall.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\StorePiecesDefault.png', 'Default'),
      ThemeViewModel('assets\\images\\StorePiecesClassic.png', 'Classic'),
      ThemeViewModel('assets\\images\\StorePiecesFlagFall.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\StorePiecesDefault.png', 'Default'),
      ThemeViewModel('assets\\images\\StorePiecesClassic.png', 'Classic'),
    ],
    'BackGround Scheme': [
      ThemeViewModel('assets\\images\\DefaultTheme.png', 'Default'),
      ThemeViewModel('assets\\images\\FlagfallTheme.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\ClassicTheme.png', 'Classic'),
      ThemeViewModel('assets\\images\\FlagfallTheme.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\DefaultTheme.png', 'Default'),
      ThemeViewModel('assets\\images\\ClassicTheme.png', 'Classic'),
      ThemeViewModel('assets\\images\\FlagfallTheme.png', 'FlagFall'),
      ThemeViewModel('assets\\images\\DefaultTheme.png', 'Default'),
      ThemeViewModel('assets\\images\\ClassicTheme.png', 'Classic'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[700],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Preferences(Store)'),
        ),
        body: Stack(
          children: [
            Background(
              image: 'assets\\images\\StoreBackGround.png',
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PreferencesRow(myStore['Color Scheme'], 'Color Scheme'),
                  PreferencesRow(myStore['Pieces Scheme'], 'Pieces Scheme'),
                  PreferencesRow(
                      myStore['BackGround Scheme'], 'BackGround Scheme'),
                ],
              ),
            ),
          ],
        ));
  }
}
