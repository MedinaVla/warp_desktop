import 'package:flutter/material.dart';
import 'package:warp_desktop/src/feature/warp_home/screens/home_page.dart';

class WarpDesktop extends StatelessWidget {
  const WarpDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
        title: 'Warp',
        home: Scaffold(body: HomePage()),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system);
  }
}
