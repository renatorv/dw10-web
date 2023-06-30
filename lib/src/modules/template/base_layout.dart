import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;
  const BaseLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
