import 'package:flutter/material.dart';
import 'package:workshop_flutterfriends/src/utils/theme.dart';

class MixPage extends StatelessWidget {
  const MixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.green,
      body: IconTheme(
        data: const IconThemeData(color: ThemeColors.green),
        child: DefaultTextStyle.merge(
          style: const TextStyle(color: ThemeColors.darkGreen),
          child: Center(
            child: Body(
              title: 'Mix your M&Ms',
              description:
                  'Swipe the slider and choose how many M&Ms you want to mix.',
              lightColor: ThemeColors.green,
              darkColor: ThemeColors.darkGreen,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.title,
    required this.description,
    this.buttonText,
    this.onPressed,
    required this.lightColor,
    required this.darkColor,
  });

  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onPressed;

  final Color lightColor;
  final Color darkColor;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double sliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: widget.darkColor,
              ),
        ),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: widget.darkColor,
              ),
        ),
        const SizedBox(height: 46),
        SizedBox(
          width: 800,
          child: Slider(
            value: sliderValue,
            min: 0.0,
            max: 10.0,
            divisions: 10,
            label: sliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
            activeColor: widget.darkColor,
            inactiveColor: Colors.white54,
          ),
        ),
        const SizedBox(height: 46),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: widget.darkColor,
            foregroundColor: widget.lightColor,
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.buttonText ?? 'Mix'),
              const SizedBox(width: 16),
              const Icon(
                Icons.east_rounded,
                size: 48,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
