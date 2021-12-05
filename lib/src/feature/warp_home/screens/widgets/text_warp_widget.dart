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
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'WARP VPN',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                        speed: const Duration(milliseconds: 2000),
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
