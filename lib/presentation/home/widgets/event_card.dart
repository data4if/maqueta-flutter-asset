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
        return Container(
          width: 0.2685 * width,
          height: 0.3386 * width,
          child: Center(
            child: Text(
              event.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: const BoxDecoration(color: Colors.purple, boxShadow: [
            BoxShadow(
              color: Colors.black54, // Shadow color
              blurRadius: 10.0, // Shadow blur radius
              spreadRadius: 2.0, // Shadow spread radius
              offset: Offset(0, 2), // Changes the position of the shadow
            ),
          ]),
        );
      },
    );
  }
}
