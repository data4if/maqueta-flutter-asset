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
        double width = constraints.maxWidth;
        return SizedBox(
          height: 0.3386 * width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0159 * width),
                child: Container(
                  width: width * 0.0529,
                  height: width * 0.0529,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      //iconSize: width * 0.0529,
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppTheme.primaryColor,
                      ),
                      onPressed: _previousCard,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length, // Número de tarjetas
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 0.0185 * width,
                        ),
                        Center(
                          child: Container(
                            color: Colors.white,
                            height: 0.3386 * width,
                            width: 0.2685 * width,
                            child: Text('Hola amigo'),
                          ),
                        ),
                        SizedBox(
                          width: 0.0185 * width,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0159 * width),
                child: Container(
                  width: width * 0.0529,
                  height: width * 0.0529,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      ///iconSize: width * 0.0529,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: AppTheme.primaryColor,
                      ),
                      onPressed: _previousCard,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
