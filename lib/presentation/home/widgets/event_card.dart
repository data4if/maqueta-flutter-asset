import 'package:conoce_gama/domain/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        Image.network(
          event.imageUrl,
          fit: BoxFit.cover,
        ),
        // Box transparente superior (por ejemplo, para el título)
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              event.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Box transparente inferior (por ejemplo, para la descripción)
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              event.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
