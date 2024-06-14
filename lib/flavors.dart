import 'package:flutter/material.dart';

enum Flavor {
  dev,
  stg,
  prd,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'TaskBunny Development';
      case Flavor.stg:
        return 'TaskBunny Staging';
      case Flavor.prd:
        return 'TaskBunny Production';
      default:
        return 'title';
    }
  }

  static Widget flavorBanner({required Widget child, bool show = true}) {
    if (!show) return const SizedBox();

    return Banner(
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.green.withOpacity(0.6),
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0),
      child: child,
    );
  }
}
