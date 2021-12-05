import 'package:flutter/material.dart';
import 'package:warp_desktop/src/feature/warp_home/screens/widgets/switcher_widget.dart';
import 'package:warp_desktop/src/feature/warp_home/screens/widgets/text_connection_widget.dart';
import 'package:warp_desktop/src/feature/warp_home/screens/widgets/text_warp_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextWarpWidget(), SwitcherWidget(), TextConecctionWidget()],
    );
  }
}
