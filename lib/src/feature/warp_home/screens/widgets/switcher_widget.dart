import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:warp_desktop/src/feature/warp_home/logic/connect_warp/connect_warp_provider.dart';

class SwitcherWidget extends ConsumerWidget {
  const SwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final switcherResultState = watch(switcherResultProvider);
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: switcherResultState.state ? Colors.deepOrange : Colors.white,
          borderRadius: BorderRadius.circular(36)),
      child: Transform.scale(
        scale: 1.2,
        child: Switch(
          activeTrackColor: Colors.deepOrange,
          activeColor: Colors.white,
          value: watch(connectWarpNotifierProvider).when(
              initial: () => false,
              connecting: () => false,
              connected: (connect) =>
                  connect ? switcherResultState.state : false,
              error: (error) => false),
          onChanged: (changeValue) {
            switcherResultState.state = changeValue;
            watch(connectWarpNotifierProvider.notifier).connectWarp();
          },
        ),
      ),
    );
  }
}
