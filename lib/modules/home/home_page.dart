import 'package:flutter/material.dart';
import 'package:payflow/modules/my_boletos/my_boletos_page.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';
import '/modules/home/home_controller.dart';
import '/shared/themes/app_colors.dart';
import '/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(
      child: MyBoletosPage(),
    ),
    Container(color: Colors.blue),
    Container(color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "Mateus",
                          style: AppTextStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text("Mantenha suas contas em dia",
                  style: AppTextStyles.captionShape),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: AppColors.primary,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/barcode_scanner');
                Navigator.pushNamed(context, '/insert_boleto');
              },
              child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  )),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(2);
                setState(() {});
              },
              icon: Icon(Icons.description_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
