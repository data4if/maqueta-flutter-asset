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
  final ScrollController _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // widht in real time.
        var width = constraints.maxWidth;
        // Function to scroll right
        void _scrollLeft() {
          _scrollController.animateTo(
            _scrollController.offset -
                (432 / 1512) * width, // Adjust the value as needed
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }

        // Function to scroll right
        void _scrollRight() {
          _scrollController.animateTo(
            _scrollController.offset +
                (432 / 1512) * width, // Adjust the value as needed
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }

        return Center(
          child: SizedBox(
              height: 0.3386 * width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: (25 / 1512) * (width),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      //width: width * 0.0462,
                      //height: width * 0.0462,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: FittedBox(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: width * (60 / 1542),
                          color: AppTheme.primaryColor,
                          icon: Icon(Icons.arrow_back),
                          onPressed: _scrollLeft,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (25 / 1512) * (width),
                  ),
                  Expanded(
                    child: eventList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: eventList.length,
                            itemBuilder: (context, index) {
                              return EventWidget(
                                event: eventList[index],
                                width: width,
                              );
                            }),
                  ),
                  SizedBox(
                    width: (25 / 1512) * (width),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      //width: width * 0.0462,
                      //height: width * 0.0462,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            iconSize: width * (60 / 1542),
                            color: AppTheme.primaryColor,
                            icon: Icon(Icons.arrow_forward),
                            onPressed: _scrollRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (25 / 1512) * (width),
                  ),
                ],
              )),
        );
      },
    );
  }
}
