import 'package:flutter/material.dart';

import '/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import '/shared/widgets/set_label_buttons/set_label_buttons.dart';

import '/shared/themes/app_colors.dart';
import '/shared/themes/app_text_styles.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: "Não foi possível identificar um código de barras.",
      subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
      primaryLabel: "Escanear novamente",
      primaryOnPress: () {},
      secondaryLabel: "Digite o código",
      secondaryOnPress: () {},
    );
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Escaneie o código de barras do boleto",
              style: AppTextStyles.buttonBackground,
            ),
            centerTitle: true,
            leading: BackButton(
              color: AppColors.background,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              )
            ],
          ),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: "Inserir código do boleto",
            primaryOnPress: () {},
            secondaryLabel: "Adicionar da galera",
            secondaryOnPress: () {},
          ),
        ),
      ),
    );
  }
}
