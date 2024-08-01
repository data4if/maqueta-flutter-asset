import 'dart:convert';
import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<dynamic> data = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response =
        await rootBundle.loadString('assets/mock_data/event_mock.json');
    final List<dynamic> dataList = json.decode(response);
    setState(() {
      data = dataList;
    });
  }

  void _previousCard() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void _nextCard() {
    setState(() {
      if (currentIndex < data.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.maxWidth;
        return Center(
          child: SizedBox(
              height: 0.3386 * width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: width * (0.0462),
                      height: width * (0.0462),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        iconSize: width * (0.0462),
                        color: AppTheme.primaryColor,
                        icon: Icon(Icons.arrow_back),
                        onPressed: _previousCard,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: width * (0.0462),
                      height: width * (0.0462),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        iconSize: width * (0.0462),
                        color: AppTheme.primaryColor,
                        icon: Icon(Icons.arrow_forward),
                        onPressed: _nextCard,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                ],
              )),
        );
      },
    );
  }
}
