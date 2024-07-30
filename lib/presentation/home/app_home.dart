import 'dart:async';
import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 0.0271 * (width),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/brand/fomutur.png", // Corregida la ruta de la imagen
                  width: 0.1448 * (width),
                  height: 0.0397 * (width),
                  //fit: BoxFit.contain,
                ),
              ],
            ),
            toolbarHeight: 0.0549 * (width),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    child: SizedBox(
                      height: 0.0549 * (width),
                      child: Center(
                        child: Text(
                          '¿Quiénes somos?',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 0.0185 * (width),
                            fontFamily: 'alcaldia_fonts',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print('¿Quiénes somos?');
                    },
                  ),
                  SizedBox(
                    height: 0.0549 * (width),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          print('Persona perfil');
                        },
                        iconSize: 0.0355 * (width),
                        color: AppTheme.primaryColor,
                        icon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.0549 * (width),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          print('Persona ayuda');
                        },
                        iconSize: 0.0355 * (width),
                        color: AppTheme.primaryColor,
                        icon: const Icon(Icons.help),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const MainPage()],
            ),
          ),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<String> _imageList = [
    'assets/images/main/main_1.jpeg',
    'assets/images/main/main_2.jpeg',
    'assets/images/main/main_3.jpeg',
  ];
  void startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imageList.length;
        });
      }
      startTimer();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double width = constraints.maxWidth;
      return Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              _imageList[_currentIndex],
              height: 0.4907 * (width),
              width: width,
              fit: BoxFit.cover,
              key: ValueKey(_imageList[_currentIndex]),
            ),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          Image.asset(
            width: 0.6766 * (width),
            height: 0.2771 * (width),
            "images/brand/conoce.png", // Corregida la ruta de la imagen
            //fit: BoxFit.cover,
          )
        ],
      );
    });
  }
}
