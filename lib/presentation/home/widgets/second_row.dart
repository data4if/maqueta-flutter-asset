import 'package:conoce_gama/configuration/core/app_theme.dart';
import 'package:flutter/material.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        return Center(
          child: Container(
            color: AppTheme.primaryColor,
            width: width,
            //height: 0.1263 * width,
            height: 0.1463 * width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'alcaldia_fonts',
                      fontSize: 0.0509 * width,
                      color: AppTheme.primaryColor,
                    ),
                    children: const [
                      TextSpan(
                          text: 'Descubre ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.accentColor,
                          )),
                      TextSpan(
                          text: 'que hacer en maracaibo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 0.9603 * (width),
                      child: Text(
                        '¡No te pierdas la oportunidad de sumergirte en la esencia marabina y vivir experiencias inolvidables!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.0244 * width,
                          fontFamily: 'alcaldia_fonts',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
