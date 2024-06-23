import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/core.dart';

class AppTB extends StatefulWidget {
  const AppTB({super.key});

  @override
  State<AppTB> createState() => _AppTBState();
}

class _AppTBState extends State<AppTB> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: TBRouter.routerConfig,
        theme: TBTheme.light,
        darkTheme: TBTheme.dark,
        builder: (context, child) {
          final textScaler = TextScaler.linear(1.sp);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: textScaler),
            child: child!,
          );
        },
      ),
    );
  }
}
