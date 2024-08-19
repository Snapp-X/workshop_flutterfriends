import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_flutterfriends/src/cubit/mix_cubit.dart';
import 'package:workshop_flutterfriends/src/utils/theme.dart';

class MixPage extends StatelessWidget {
  const MixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ThemeColors.primary,
      body: Body(
        title: 'Mix your M&Ms',
        description:
            'Swipe the slider and choose how many M&Ms you want to mix.',
        lightColor: ThemeColors.primary,
        darkColor: ThemeColors.primaryDark,
      ),
    );
  }
}

// The Body widget handles the UI and logic of the page, such as the slider and button.
class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.title,
    required this.description,
    this.buttonText,
    required this.lightColor,
    required this.darkColor,
  });

  final String title;
  final String description;
  final String? buttonText;

  final Color lightColor;
  final Color darkColor;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // We use this variable to keep track of the current value of the slider.
  // To manage the slider's state, we use `setState` for simplicity.
  double sliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: widget.lightColor),
      child: DefaultTextStyle.merge(
        style: TextStyle(
          color: widget.darkColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO 1: Display the title text.
              //         Use the `widget.title` value and ensure the text is styled according to the theme.

              // TODO 2: Display the description text.
              //         Use the `widget.description` value and style it appropriately.

              const SizedBox(height: 46),

              // TODO 3: Implement the slider to select the number of M&Ms to mix.
              //         Ensure the slider's value is linked to `sliderValue` and updates on change.
              //         The slider should be disabled when the state is loading.

              const SizedBox(height: 46),

              // TODO 4: Implement the button to trigger the mix operation.
              //         The button should display a loading indicator when the state is loading.
              //         When not loading, the button should be enabled and display the text and icon.
            ],
          ),
        ),
      ),
    );
  }

  // TODO 5: Implement the slider's `onChanged` callback.
  //         This method should update the `sliderValue` when the slider is moved.

  // TODO 6: Implement the button's `onPressed` callback.
  //         This method should trigger the `mixCandies` method on the `MixCubit`.
}
