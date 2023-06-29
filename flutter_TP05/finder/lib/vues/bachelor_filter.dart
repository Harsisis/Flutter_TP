import 'package:flutter/material.dart';

class BachelorFilter extends StatefulWidget {
  const BachelorFilter({super.key});

  @override
  State<StatefulWidget> createState() => _BachelorFilter();
}

class _BachelorFilter extends State<BachelorFilter> {

bool isMale = false;
bool isFemale = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Theme.of(context).colorScheme.primary;
      }
      return Theme.of(context).colorScheme.secondary;
    }

    return Row(
      children: [
        ElevatedButton(
            onPressed: () => {print("homme")},
            child: const Icon(Icons.male_rounded)),
        ElevatedButton(
            onPressed: () => {print("femme")},
            child: const Icon(Icons.female_rounded)),
        Checkbox(
          checkColor: Theme.of(context).colorScheme.tertiaryContainer,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isMale,
          onChanged: (bool? value) {
            setState(() {
              isMale = value!;
            });
          },
        )
      ],
    );
  }
}
