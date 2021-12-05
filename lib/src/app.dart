import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:warp_desktop/src/feature/warp_home/screens/home_page.dart';

class WarpDesktop extends StatelessWidget {
  const WarpDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      title: 'Warp',
      home: Scaffold(
        body: WindowBorder(
          color: Color(0xFF805306),
          child: Row(children: [HomePage()]),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

var sidebarColor = Color(0xFFF6A00C);

var backgroundStartColor = Color(0xFFFFD500);
var backgroundEndColor = Color(0xFFF6A00C);

var buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF805306),
    mouseOver: Color(0xFFF6A00C),
    mouseDown: Color(0xFF805306),
    iconMouseOver: Color(0xFF805306),
    iconMouseDown: Color(0xFFFFD500));

var closeButtonColors = WindowButtonColors(
    mouseOver: Colors.red[700],
    mouseDown: Colors.red[900],
    iconNormal: Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
