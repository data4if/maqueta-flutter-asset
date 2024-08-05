import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:conoce_gama/domain/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  final double width;
  EventWidget({super.key, required this.event, required this.width});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //var width = constraints.maxWidth;
        return Row(
          children: [
            SizedBox(
              width: (13 / 1512) * width,
            ),
            Container(
              width: (406 / 1512) * width,
              height: (512 / 1512) * width,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black54, // Shadow color
                  blurRadius: 0.5, // Shadow blur radius
                  spreadRadius: 0.5, // Shadow spread radius
                  offset: Offset(0, 2), // Changes the position of the shadow
                ),
              ]),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            event.imageUrl,
                            width: (406 / 1512) * width,
                            height: (315 / 1512) * width,
                          ),
                          Container(
                              width: (406 / 1512) * width,
                              height: (19 / 1512) * width,
                              decoration: const BoxDecoration(
                                color: AppTheme.greentColorOpacity,
                              )),
                        ],
                      ),
                    ),
                    Container(
                        width: (406 / 1512) * width,
                        height: (19 / 1512) * width,
                        decoration: const BoxDecoration(
                          color: AppTheme.greentColorNoOpacity,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        event.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'alcaldia_fonts',
                          color: AppTheme.primaryColor,
                          fontSize: (26 / 1512) * width,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Fecha: ' + event.date,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'alcaldia_fonts',
                        color: Colors.black,
                        fontSize: (20 / 1512) * width,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Lugar: ' + event.place,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'alcaldia_fonts',
                        color: Colors.black,
                        fontSize: (20 / 1512) * width,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: (13 / 1512) * width,
            ),
          ],
        );
      },
    );
  }
}
