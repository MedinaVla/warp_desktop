import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warp_desktop/src/core/utils.dart';

class TextInfoVersion extends ConsumerWidget {
  const TextInfoVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final version = watch(getVersionProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Text(
            version.when(
              data: (info) => 'v$info',
              loading: () => '',
              error: (error, _) => '',
            ),
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
