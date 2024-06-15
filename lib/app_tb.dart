import 'package:flutter/material.dart';

import 'core/core.dart';

class AppTB extends StatelessWidget {
  const AppTB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: TBNavigation.instance.router,
      theme: TBTheme.light,
      darkTheme: TBTheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}
