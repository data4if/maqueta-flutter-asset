import 'package:flutter/material.dart';
import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:conoce_gama/configuration//core/app_router.dart';

class AppCore extends StatelessWidget {
  const AppCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Conoce Maracaibo',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.getThemeData(),
    );
  }
}
