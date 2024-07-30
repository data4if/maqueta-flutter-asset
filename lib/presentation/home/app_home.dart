import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:conoce_gama/presentation/home/widgets/animate_banner.dart';
import 'package:conoce_gama/presentation/home/widgets/row_one.dart';
import 'package:conoce_gama/presentation/home/widgets/second_row.dart';
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
                      //width: 0.0549 * (width),
                      child: Center(
                        child: Text(
                          '¿Quiénes somos?',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 0.0185 * (width),
                            fontFamily: 'alcaldia_fonts',
                            fontWeight: FontWeight.w600,
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
                    width: 0.0549 * (width),
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
          body: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainPage(),
                OneRow(),
                SecondRow(),
              ],
            ),
          ),
        );
      },
    );
  }
}
