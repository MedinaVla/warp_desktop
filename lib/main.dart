import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warp_desktop/src/app.dart';

void main() {
  runApp(ProviderScope(
    child: WarpDesktop(),
  ));
}
