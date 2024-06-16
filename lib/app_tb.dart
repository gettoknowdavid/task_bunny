import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/core.dart';
import 'features/auth/auth.dart';

class AppTB extends StatelessWidget {
  const AppTB({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = TBNavigation(authBloc: context.watch<AuthBloc>());
    final textScaler = TextScaler.linear(1.sp);

    return ScreenUtilInit(
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: navigation.router,
        theme: TBTheme.light,
        darkTheme: TBTheme.dark,
        themeMode: ThemeMode.light,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: textScaler),
          child: child!,
        ),
      ),
    );
  }
}
