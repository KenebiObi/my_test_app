import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_app/widgets/character_option.dart';

class GeneratePasswordScreen extends StatefulWidget {
  const GeneratePasswordScreen();

  @override
  State<GeneratePasswordScreen> createState() => _GeneratePasswordScreenState();
}

class _GeneratePasswordScreenState extends State<GeneratePasswordScreen> {
  bool _addUpperCase = false;
  bool _addLowerCase = false;
  bool _addNumbers = false;
  bool _addSymbols = false;
  int mainSliderValue = 0;

  String _allCharacters =
      '!@#\$%^&*()_+qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890';
  String _allLowerCaseChars = 'qwertyuiopasdfghjklzxcvbnm';
  String _password = "password";

  Map<String, String> theMap = {
    'lower': 'qwertyuiopasdfghjklzxcvbnm',
    'upper': 'QWERTYUIOPASDFGHJKLZXCVBNM',
    'nums': '1234567890',
    'special': '!@#\$%^&*()_+',
  };

  List options = [];

  void generatePassword() {
    String generatedCharacters = "";

    if (options.length != 0) {
      while (generatedCharacters.length < mainSliderValue) {
        for (var option in options) {
          if (generatedCharacters.length <= mainSliderValue) {
            String randomChar =
                theMap[option]![Random().nextInt(theMap[option]!.length)];
            print('randomChar is $randomChar');
            generatedCharacters += randomChar;
          }
          print(generatedCharacters);
        }
      }
    } else {
      for (int i = 0; i < mainSliderValue; i++) {
        generatedCharacters +=
            _allLowerCaseChars[Random().nextInt(_allLowerCaseChars.length)];
      }
    }
    List listOfGeneratedChars = generatedCharacters.split('');
    print(listOfGeneratedChars);
    listOfGeneratedChars.shuffle(Random());
    String shuffledString = listOfGeneratedChars.join('');
    print(shuffledString);
    _password = shuffledString; // MAIN GENERATED PASSWORD
    print(_password);
    if (_password == "") {
      _password = "password";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30.0,
                      top: 30.0,
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          ("${mainSliderValue.toString()} Characters"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    _password,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            CharacterOptionWidget(
              icon: Icons.text_fields_rounded,
              color: _addLowerCase
                  ? Theme.of(context).primaryColorLight
                  : Colors.white,
              chracterSelection: "Add lower case charcters",
              onTap: () {
                setState(() {
                  _addLowerCase = !_addLowerCase;
                });

                print(_addLowerCase);
                if (_addLowerCase) {
                  options.add('lower');
                } else {
                  options.remove('lower');
                }
              },
            ),
            CharacterOptionWidget(
              icon: Icons.text_fields_rounded,
              color: _addUpperCase
                  ? Theme.of(context).primaryColorLight
                  : Colors.white,
              chracterSelection: "Add upper case charcters",
              onTap: () {
                setState(() {
                  _addUpperCase = !_addUpperCase;
                });

                print(_addUpperCase);
                if (_addUpperCase) {
                  options.add('upper');
                } else {
                  options.remove('upper');
                }
              },
            ),
            CharacterOptionWidget(
              icon: Icons.looks_one_rounded,
              color: _addNumbers
                  ? Theme.of(context).primaryColorLight
                  : Colors.white,
              chracterSelection: "Add numbers",
              onTap: () {
                setState(() {
                  _addNumbers = !_addNumbers;
                });

                print(_addUpperCase);
                if (_addNumbers) {
                  options.add('nums');
                } else {
                  options.remove('nums');
                }
              },
            ),
            CharacterOptionWidget(
              icon: Icons.star_rate_rounded,
              color: _addSymbols
                  ? Theme.of(context).primaryColorLight
                  : Colors.white,
              chracterSelection: "Add special charcters",
              onTap: () {
                setState(() {
                  _addSymbols = !_addSymbols;
                });
                print(_addUpperCase);
                if (_addUpperCase) {
                  options.add('special');
                } else {
                  options.remove('special');
                }
              },
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackShape: const RoundedRectSliderTrackShape(),
                trackHeight: 15.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12.0,
                ),
              ),
              child: Slider(
                autofocus: true,
                min: 0.0,
                max: 20.0,
                label: "${mainSliderValue.round()}",
                value: mainSliderValue.toDouble(),
                onChanged: (newValue) {
                  setState(
                    () {
                      mainSliderValue = newValue.round();
                      print(mainSliderValue);
                      generatePassword();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
