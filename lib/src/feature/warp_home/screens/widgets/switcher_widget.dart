import 'dart:io';

import 'package:flutter/material.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:warp_desktop/src/core/utils.dart';

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switcher(
      value: switcherResult,
      size: SwitcherSize.large,
      enabledSwitcherButtonRotate: true,
      iconOn: Icons.cloud_done,
      colorOff: Colors.blueGrey.withOpacity(0.3),
      colorOn: Colors.yellow,
      onTap: () => runProccess(switcherResult),
      onChanged: (state) {
        switcherResult = !switcherResult;
      },
    );
  }

  Future<bool> runProccess(bool switcherResult) async {
    var value = 'connect';
    if (switcherResult) {
      value = 'disconnect';
    }
    Process.run('warp-cli', [value]);
    bool successConnect = await getStatusWarp();

    print(successConnect);
    return successConnect;
  }

  Future<bool> getStatusWarp() async {
    bool successConnect = false;
    await Future.delayed(Duration(seconds: 3));

    ProcessResult rs = await Process.run('warp-cli', ['status']);
    String result = rs.stdout.toString().split(' ')[2].trim();
    print(result);

    if (result == 'Connected') {
      successConnect = true;
    }
    print('El resultado de  la  conexion  es: $successConnect');

    return successConnect;
  }
}
