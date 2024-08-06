import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_flutterfriends/src/cubit/mix_cubit.dart';
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
          child: const Center(
            child: Body(
              title: 'Mix your M&Ms',
              description:
                  'Swipe the slider and choose how many M&Ms you want to mix.',
              lightColor: ThemeColors.green,
              darkColor: ThemeColors.darkGreen,
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
          child: BlocBuilder<MixCubit, MixState>(
            builder: (context, state) {
              final loading = state is MixLoading;

              return Slider(
                value: sliderValue,
                min: 0.0,
                max: 10.0,
                divisions: 10,
                activeColor: widget.darkColor,
                inactiveColor: Colors.white54,
                label: sliderValue.round().toString(),
                onChanged: loading
                    ? null
                    : (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
              );
            },
          ),
        ),
        const SizedBox(height: 46),
        BlocBuilder<MixCubit, MixState>(
          builder: (context, state) {
            log('State: $state');

            final loading = state is MixLoading;

            return FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: widget.darkColor,
                foregroundColor: widget.lightColor,
              ),
              onPressed: loading
                  ? null
                  : () {
                      context.read<MixCubit>().mixCandies(sliderValue.toInt());
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.buttonText ?? 'Mix'),
                  const SizedBox(width: 16),
                  if (loading)
                    const SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black26),
                        ),
                      ),
                    )
                  else
                    const Icon(
                      Icons.east_rounded,
                      size: 48,
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
