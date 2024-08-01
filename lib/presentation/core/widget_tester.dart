import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetTester extends StatelessWidget {
  const WidgetTester({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        return Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.rectangle,
          ),
          height: 0.03386 * width,
          width: 0.2685 * width,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('Prueba'),
              )
            ],
          ),
        );
      },
    );
  }
}
