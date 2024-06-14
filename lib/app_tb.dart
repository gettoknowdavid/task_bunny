import 'package:flutter/material.dart';

import 'core/core.dart';

class AppTB extends StatelessWidget {
  const AppTB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: TBNavigation.instance.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
