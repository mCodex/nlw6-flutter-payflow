import 'package:flutter/material.dart';

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
    return Material(
      child: Container(
        color: AppColors.shape,
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black.withOpacity(0.6),
            )),
            Column(children: [
              Text.rich(
                TextSpan(
                  text: title,
                  children: [
                    TextSpan(text: "\n$subtitle"),
                  ],
                ),
              ),
              SetLabelButtons(
                  primaryLabel: primaryLabel,
                  primaryOnPress: primaryOnPress,
                  secondaryLabel: secondaryLabel,
                  secondaryOnPress: secondaryOnPress)
            ]),
          ],
        ),
      ),
    );
  }
}
