import 'package:flutter/material.dart';
import '/shared/themes/app_text_styles.dart';

import '/shared/widgets/set_label_buttons/set_label_buttons.dart';

import '/shared/themes/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPress;

  final String secondaryLabel;
  final VoidCallback secondaryOnPress;

  final String title;
  final String subtitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPress,
    required this.secondaryLabel,
    required this.secondaryOnPress,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text.rich(
                      TextSpan(
                        text: title,
                        style: AppTextStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: "\n$subtitle",
                            style: AppTextStyles.buttonHeading,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.stroke,
                  ),
                  SetLabelButtons(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnPress: primaryOnPress,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPress: secondaryOnPress)
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
