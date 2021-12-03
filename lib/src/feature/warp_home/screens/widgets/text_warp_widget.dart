import 'package:flutter/material.dart';
import 'package:warp_desktop/src/core/utils.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextWarpWidget extends StatelessWidget {
  const TextWarpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            child: Container(
                padding: EdgeInsets.all(defaultPadding),
                child: SizedBox(
                  child: AnimatedTextKit(
                    totalRepeatCount: 1000,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        '1.1.1.1',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                        speed: const Duration(seconds: 1),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                )))
      ],
    );
  }
}
