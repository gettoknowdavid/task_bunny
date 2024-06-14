import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

class AppTB extends StatelessWidget {
  const AppTB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: F.flavorBanner(
        show: kDebugMode,
        child: const Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
