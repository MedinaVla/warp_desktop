import 'package:flutter/material.dart';
import 'package:warp_desktop/src/feature/warp_home/screens/home_page.dart';

class WarpDesktop extends StatelessWidget {
  const WarpDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warp',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
