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
    return Switcher(
      value: switcherResultState.state,
      size: SwitcherSize.large,
      enabledSwitcherButtonRotate: true,
      iconOn: Icons.cloud_done,
      colorOff: Colors.blueGrey.withOpacity(0.3),
      colorOn: Colors.yellow,
      // onTap: () => watch(connectWarpNotifierProvider.notifier)
      //     .connectWarp(actionState.state),
      onChanged: (changeValue) {
        switcherResultState.state = changeValue;
        watch(connectWarpNotifierProvider.notifier).connectWarp();
      },
    );
  }
}
