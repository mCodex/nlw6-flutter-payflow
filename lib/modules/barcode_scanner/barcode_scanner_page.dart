import 'package:flutter/material.dart';
import '/modules/barcode_scanner/barcode_scanner_controller.dart';
import '/modules/barcode_scanner/barcode_scanner_status.dart';
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
  final controller = BarCodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarCodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
          ValueListenableBuilder<BarCodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return Align(
                      alignment: Alignment.bottomLeft,
                      child: BottomSheetWidget(
                        title:
                            "Não foi possível identificar um código de barras.",
                        subtitle:
                            "Tente escanear novamente ou digite o código do seu boleto.",
                        primaryLabel: "Escanear novamente",
                        primaryOnPress: () {
                          controller.getAvailableCameras();
                        },
                        secondaryLabel: "Digite o código",
                        secondaryOnPress: () {},
                      ));
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
