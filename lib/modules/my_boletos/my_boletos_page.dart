import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class MyBoletosPage extends StatefulWidget {
  const MyBoletosPage({Key? key}) : super(key: key);

  @override
  _MyBoletosPageState createState() => _MyBoletosPageState();
}

class _MyBoletosPageState extends State<MyBoletosPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Meus Boletos",
          style: AppTextStyles.titleBoldHeading,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
        )
      ],
    );
  }
}
