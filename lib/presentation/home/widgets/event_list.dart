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
  double currentIndex = 0;
  List<Event> eventList = [];
  ScrollController listScrollController = ScrollController();

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

/*   void _previousCard() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        //print('back ' + currentIndex.toString());
        listScrollController.jumpTo(currentIndex);
      }
    });
  } */

/*   void _nextCard() {
    setState(() {
      if (currentIndex < eventList.length - 1) {
        currentIndex++;
        //print('next ' + currentIndex.toString());
        listScrollController.jumpTo(currentIndex);
      }
    });
  } */

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.maxWidth;
        // Function to scroll left
        void _scrollLeft() {
          listScrollController.animateTo(
            listScrollController.offset -
                (406 / 1512) * width, // Adjust the value as needed
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }

        // Function to scroll right
        void _scrollRight() {
          listScrollController.animateTo(
            listScrollController.offset +
                (406 / 1512) * width, // Adjust the value as needed
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }

        // Control del objeto a renerizar
        return Center(
          child: SizedBox(
              //height: 0.5 * width,
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
                            onPressed: _scrollLeft,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: (13 / 1512) * width,
                    decoration: BoxDecoration(color: AppTheme.primaryColor),
                  ),
                  Expanded(
                    //width: ((406 * 3 + 4 * 26) / (1512)) * width,
                    //height: (406 / 1512) * width,
                    child: eventList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            controller: listScrollController,
                            //physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: eventList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: (13 / 1512) * width,
                                    decoration: BoxDecoration(
                                        color: AppTheme.primaryColor),
                                  ),
                                  SizedBox(
                                      width: (406 / 1512) * width,
                                      height: (512 / 1512) * width,
                                      child: EventWidget(
                                        event: eventList[index],
                                        width: width,
                                      )),
                                  Container(
                                    width: (13 / 1512) * width,
                                    decoration: BoxDecoration(
                                        color: AppTheme.primaryColor),
                                  ),
                                ],
                              );
                            }),
                  ),
                  Container(
                    width: (13 / 1512) * width,
                    decoration: BoxDecoration(color: AppTheme.primaryColor),
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
                            onPressed: _scrollRight,
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
