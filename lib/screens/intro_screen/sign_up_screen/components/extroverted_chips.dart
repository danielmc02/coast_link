import 'dart:ffi';

import 'package:coast_link/state_providers/intro_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExtrovertedChips extends StatefulWidget {
  const ExtrovertedChips({super.key});

  @override
  State<ExtrovertedChips> createState() => _ExtrovertedChipsState();
}

class _ExtrovertedChipsState extends State<ExtrovertedChips> {
  List<Widget> extrovertedChips = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.end,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        children: [
          for (String title in IntroState.extrovertedHobbies)
            ChoiceChip(
              onSelected: (value) {
                setState(() {
                  if (algo.currentExtrovertChoices.length <
                      algo.maxCapExtrovertChoices) 
                      //Problem: Once false
                      {
                    if (IntroState.extrovertedHobbiesState[
                        IntroState.extrovertedHobbies.indexOf(title)])
                    // iff the current index state is true than we want to remove it from the current choices
                    {
                      algo.currentExtrovertChoices.remove(title);
                      print(
                          "Just removed $title from ${algo.currentExtrovertChoices}");
                      IntroState.extrovertedHobbiesState[
                          IntroState.extrovertedHobbies.indexOf(title)] = value;
                    } else {
                      algo.currentExtrovertChoices.add(title);
                      print(
                          'Just added $title to ${algo.currentExtrovertChoices}');
                      IntroState.extrovertedHobbiesState[
                          IntroState.extrovertedHobbies.indexOf(title)] = value;
                    }
                  } else {
                    if(IntroState.extrovertedHobbiesState[
                        IntroState.extrovertedHobbies.indexOf(title)])
                        {
                          algo.currentExtrovertChoices.remove(title);
                      print(
                          "Just removed $title from ${algo.currentExtrovertChoices}");
                      IntroState.extrovertedHobbiesState[
                          IntroState.extrovertedHobbies.indexOf(title)] = value;
                        }
                    print(
                        "MAX HAS BEEN HIT NO MORE SELECTIONS AND ADDING ALLOWED");
                  }
                });
              },
              label: Text(
                  style: TextStyle(
                      color: IntroState.extrovertedHobbiesState[
                              IntroState.extrovertedHobbies.indexOf(title)]
                          ? Colors.white
                          : Colors.black),
                  IntroState.extrovertedHobbies[
                      IntroState.extrovertedHobbies.indexOf(title)]),
              selected: IntroState.extrovertedHobbiesState[
                  IntroState.extrovertedHobbies.indexOf(title)],
              // disabledColor: Colors.white,
              backgroundColor: Colors.white,
              selectedColor: Theme.of(context).colorScheme.primary,
              side: const BorderSide(
                  color: Colors.black, width: .5, style: BorderStyle.solid),
            )
        ],
      ),
    );
  }
}


class IntrovertedChips extends StatefulWidget {
  const IntrovertedChips({super.key});

  @override
  State<IntrovertedChips> createState() => _IntrovertedChipsState();
}

class _IntrovertedChipsState extends State<IntrovertedChips> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.end,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        children: [
          for (String title in IntroState.introvertedHobbies)
            ChoiceChip(
              onSelected: (value) {
                setState(() {
                  if (algo.currentIntrovertChoices.length <
                      algo.maxCapExtrovertChoices) 
                      //Problem: Once false
                      {
                    if (IntroState.introvertedHobbiesState[
                        IntroState.introvertedHobbies.indexOf(title)])
                    // iff the current index state is true than we want to remove it from the current choices
                    {
                      algo.currentIntrovertChoices.remove(title);
                      print(
                          "Just removed $title from ${algo.currentIntrovertChoices}");
                      IntroState.introvertedHobbiesState[
                          IntroState.introvertedHobbies.indexOf(title)] = value;
                    } else {
                      algo.currentIntrovertChoices.add(title);
                      print(
                          'Just added $title to ${algo.currentIntrovertChoices}');
                      IntroState.introvertedHobbiesState[
                          IntroState.introvertedHobbies.indexOf(title)] = value;
                    }
                  } else {
                    if(IntroState.introvertedHobbiesState[
                        IntroState.introvertedHobbies.indexOf(title)])
                        {
                          algo.currentIntrovertChoices.remove(title);
                      print(
                          "Just removed $title from ${algo.currentIntrovertChoices}");
                      IntroState.introvertedHobbiesState[
                          IntroState.introvertedHobbies.indexOf(title)] = value;
                        }
                    print(
                        "MAX HAS BEEN HIT NO MORE SELECTIONS AND ADDING ALLOWED");
                  }
                });
              },
              label: Text(
                  style: TextStyle(
                      color: IntroState.introvertedHobbiesState[
                              IntroState.introvertedHobbies.indexOf(title)]
                          ? Colors.white
                          : Colors.black),
                  IntroState.introvertedHobbies[
                      IntroState.introvertedHobbies.indexOf(title)]),
              selected: IntroState.introvertedHobbiesState[
                  IntroState.introvertedHobbies.indexOf(title)],
              // disabledColor: Colors.white,
              backgroundColor: Colors.white,
              selectedColor: Theme.of(context).colorScheme.primary,
              side: const BorderSide(
                  color: Colors.black, width: .5, style: BorderStyle.solid),
            )
        ],
      ),
    );
  }
}