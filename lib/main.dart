import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warp_desktop/src/app.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // setWindowMinSize(const Size(400, 500));
  // setWindowMaxSize(const Size(400, 500));
  // setWindowTitle('Warp VPN');
  runApp(ProviderScope(
    child: WarpDesktop(),
  ));
  doWhenWindowReady(() {
    const initialSize = Size(400, 500);
    appWindow.title = 'Warp VPN';
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.bottomRight;
    appWindow.show();
  });
}
