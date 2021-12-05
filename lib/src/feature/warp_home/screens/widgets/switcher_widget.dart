import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
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
        borderRadius: BorderRadius.circular(36),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: getAfirmationOrColorByWatchConnection(
              watch, switcherResultState, TypeToShow.color),
        ),
      ),
      child: Transform.scale(
        scale: 1.32,
        child: Switch(
          activeTrackColor: Colors.transparent,
          activeColor: Colors.white,
          value: getAfirmationOrColorByWatchConnection(
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

  getAfirmationOrColorByWatchConnection(ScopedReader watch,
      StateController<bool> switcherResultState, TypeToShow typeToShow) {
    switch (typeToShow) {
      case TypeToShow.afirmation:
        return watch(connectWarpNotifierProvider).when(
            initial: () => false,
            connecting: () => false,
            connected: (connect) => connect ? true : false,
            error: (error) => false);
      case TypeToShow.color:
        return watch(connectWarpNotifierProvider).when(
            initial: () => GradientColors.grey,
            connecting: () => GradientColors.white,
            connected: (connect) =>
                connect ? GradientColors.sunrise : GradientColors.grey,
            error: (error) => GradientColors.sunrise);

      default:
    }
  }
}
