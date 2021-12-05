import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warp_desktop/src/core/utils.dart';
import 'package:warp_desktop/src/feature/warp_home/logic/connect_warp/connect_warp_provider.dart';

class SwitcherWidget extends ConsumerWidget {
  const SwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final switcherResultState = watch(switcherResultProvider);
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: watchConnection(watch, switcherResultState, TypeToShow.color),
          borderRadius: BorderRadius.circular(36)),
      child: Transform.scale(
        scale: 1.2,
        child: Switch(
          activeTrackColor: Colors.deepOrange,
          activeColor: Colors.white,
          value: watchConnection(
              watch, switcherResultState, TypeToShow.afirmation),
          onChanged: (changeValue) {
            if (watch(connectWarpNotifierProvider).isConnectign) {
              return;
            }
            switcherResultState.state = changeValue;
            watch(connectWarpNotifierProvider.notifier).connectWarp();
          },
        ),
      ),
    );
  }

  watchConnection(ScopedReader watch, StateController<bool> switcherResultState,
      TypeToShow typeToShow) {
    switch (typeToShow) {
      case TypeToShow.afirmation:
        return watch(connectWarpNotifierProvider).when(
            initial: () => false,
            connecting: () => false,
            connected: (connect) => connect ? true : false,
            error: (error) => false);
      case TypeToShow.color:
        return watch(connectWarpNotifierProvider).when(
            initial: () => Colors.grey,
            connecting: () => Colors.white,
            connected: (connect) => connect ? Colors.deepOrange : Colors.grey,
            error: (error) => Colors.deepOrange);

      default:
    }
  }
}
