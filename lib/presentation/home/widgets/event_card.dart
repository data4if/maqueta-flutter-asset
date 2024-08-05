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
              child: Center(
                child: Text(
                  event.title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.purple, boxShadow: [
                BoxShadow(
                  color: Colors.black54, // Shadow color
                  blurRadius: 0.5, // Shadow blur radius
                  spreadRadius: 0.5, // Shadow spread radius
                  offset: Offset(0, 2), // Changes the position of the shadow
                ),
              ]),
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
