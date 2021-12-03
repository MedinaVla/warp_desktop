import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warp_desktop/src/core/utils.dart';
import 'package:warp_desktop/src/feature/warp_home/logic/connect_warp/connect_warp_provider.dart';

class TextConecctionWidget extends ConsumerWidget {
  const TextConecctionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final switcherResultState = watch(switcherResultProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: SizedBox(
            child: Text(
              watch(connectWarpNotifierProvider).when(
                  initial: () => 'Disconnected',
                  connecting: () => switcherResultState.state
                      ? 'Connecting...'
                      : 'Disconnecting',
                  connected: (connect) =>
                      connect ? 'Connected' : 'Disconnected',
                  error: (error) => ''),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
        )
      ],
    );
  }
}
