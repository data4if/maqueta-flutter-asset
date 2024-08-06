import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:conoce_gama/domain/event.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  final double width;

  EventWidget({super.key, required this.event, required this.width});

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    try {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            SizedBox(
              width: (13 / 1512) * width,
            ),
            Container(
              width: (406 / 1512) * width,
              height: (512 / 1512) * width,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
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
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: (406 / 1512) * width,
                      height: (19 / 1512) * width,
                      decoration: const BoxDecoration(
                        color: AppTheme.greentColorNoOpacity,
                      ),
                    ),
                    SizedBox(
                      height: (70 / 1512) * width,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          event.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'alcaldia_fonts',
                            height: 0.9,
                            color: AppTheme.primaryColor,
                            fontSize: (26 / 1512) * width,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Fecha: ' + event.date,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'alcaldia_fonts',
                              color: Colors.black,
                              height: 0.9,
                              fontSize: (20 / 1512) * width,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Lugar: ' + event.place,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'alcaldia_fonts',
                              color: Colors.black,
                              fontSize: (20 / 1512) * width,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _launchUrl(event.link);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Link red social',
                              style: TextStyle(
                                fontSize: (18 / 1512) * width,
                                fontFamily: 'alcaldia_fonts',
                                color: AppTheme.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
