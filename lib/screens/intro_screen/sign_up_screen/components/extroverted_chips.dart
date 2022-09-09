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
          ChoiceChip(
            onSelected: (value) {
              setState(() {
                IntroState.extrovertedHobbiesState[0] = value;
              });
              print(value);
            },
            label: Text(IntroState.extrovertedHobbies[0]),
            selected: IntroState.extrovertedHobbiesState[0],
            // disabledColor: Colors.white,
            backgroundColor: Colors.red,
            selectedColor: Colors.green,
            side: const BorderSide(
                color: Colors.black, width: .5, style: BorderStyle.solid),
          ),
        ],
      ),
    );
  }
}
