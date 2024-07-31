import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetTester extends StatelessWidget {
  const WidgetTester({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        return Scaffold(
          body: Center(
            child: Container(
              height: 0.03386 * width,
              width: 0.2685 * width,
              //decoration: InputDecoration(fillColor: AppTheme.primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      //height: ,
                      ),
                  //OneRow(),
                  //SecondRow(),
                  //EventList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
