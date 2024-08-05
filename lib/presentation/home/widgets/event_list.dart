import 'dart:convert';
import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:conoce_gama/domain/event.dart';
import 'package:conoce_gama/presentation/home/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  int currentIndex = 0;
  List<Event> eventList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response =
        await rootBundle.loadString('assets/json/events.json');
    final List<dynamic> EventJsonList = json.decode(response);
    setState(() {
      eventList = EventJsonList.map((json) => Event.fromJson(json)).toList();
    });
  }

  void _previousCard() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        print('back ' + currentIndex.toString());
      }
    });
  }

  void _nextCard() {
    setState(() {
      if (currentIndex < eventList.length - 1) {
        currentIndex++;
        print('next ' + currentIndex.toString());
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
<<<<<<< HEAD
              //height: 0.5 * width,
=======
              height: 0.3386 * width,
>>>>>>> parent of bf0f3e8 (movimiento de la lista sin chiste pixel control)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.0462,
                      height: width * 0.0462,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            iconSize: width * 0.0362,
                            color: AppTheme.primaryColor,
                            icon: Icon(Icons.arrow_back),
                            onPressed: _previousCard,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                  Expanded(
                    child: eventList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: eventList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  width: 0.4 * width,
                                  child: EventWidget(
                                    event: eventList[currentIndex],
                                    width: width,
                                  ));
                            }),
                  ),
                  SizedBox(
                    width: 0.01587 * (width),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.0462,
                      height: width * 0.0462,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            iconSize: width * 0.0362,
                            color: AppTheme.primaryColor,
                            icon: Icon(Icons.arrow_forward),
                            onPressed: _nextCard,
                          ),
                        ),
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
