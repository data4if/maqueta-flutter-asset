import 'dart:convert';
import 'package:conoce_gama/domain/axi.dart';
import 'package:conoce_gama/presentation/home/widgets/axis_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AxisList extends StatefulWidget {
  const AxisList({super.key});

  @override
  _AxisListState createState() => _AxisListState();
}

class _AxisListState extends State<AxisList> {
  //int currentIndex = 0;
  List<Axi> axiList = [];
  //final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response =
        await rootBundle.loadString('assets/json/axis.json');
    print(response);
    try {
      final List<dynamic> AxiJsonList = json.decode(response);
      setState(() {
        print('asignacion ALTA ESTA ENTRANDO');
        axiList = AxiJsonList.map((json) => Axi.fromJson(json)).toList();
        if (axiList.isNotEmpty) {
          print('asignacion Lista COMPLETA');
        }
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.maxWidth;

        return Container(
          height: (800 / 1512) * width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: (30 / 1512) * (width),
                ),
                Expanded(
                  child: axiList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          //controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: axiList.length,
                          itemBuilder: (context, index) {
                            return AxisCard(
                              axi: axiList[index],
                              width: width,
                            );
                          }),
                ),
                SizedBox(
                  width: (30 / 1512) * (width),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
