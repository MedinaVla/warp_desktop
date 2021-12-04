import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warp_desktop/src/app.dart';

void main() {
  runApp(ProviderScope(
    child: WarpDesktop(),
  ));
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(400, 500);
    win.minSize = initialSize;
    win.maxSize = initialSize;
    win.position = Offset(400, 100);
    win.show();
  });
}
