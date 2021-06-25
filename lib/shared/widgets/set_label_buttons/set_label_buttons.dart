import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import '/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import '/shared/widgets/label_button/label_button_widget.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPress;

  final String secondaryLabel;
  final VoidCallback secondaryOnPress;

  final bool enablePrimaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPress,
    required this.secondaryLabel,
    required this.secondaryOnPress,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
              child: LabelButton(
            label: primaryLabel,
            onPressed: primaryOnPress,
            style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
          )),
          DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPress,
            ),
          ),
        ],
      ),
    );
  }
}
