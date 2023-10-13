import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/utils/database/database_helper.dart';
import 'package:quotes_app/screen/controller/quotesapp_controller.dart';
import 'package:quotes_app/screen/model/quotes_model.dart';

import '../../utils/app_color.dart';
import '../../utils/app_size.dart';
import '../../utils/decoration/app_decoration.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  TextEditingController txtquotes = TextEditingController();
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.size.intiSize(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: w * 0.025,
            ),
            TextField(
              controller: txtquotes,
              decoration: inputDecorationQuotes,
            ),
            SizedBox(
              height: w * 0.025,
            ),
            Obx(
              () =>  DropdownButton(
                value: controller.selectedCategory.value,
                items: controller.categoryList.value
                    .map((e) => DropdownMenuItem(
                          child: Text("${e['category']}"),
                          value: e['category'],
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedCategory.value = value as String;
                },
                isExpanded: true,
              ),
            ),
            SizedBox(
              height: h * 0.045,
            ),
            ElevatedButton(
              onPressed: () {
                QuotesModel model = QuotesModel(quotes: txtquotes.text,category: controller.selectedCategory.value);
                DataBaseHelper.dataBaseHelper.insertQuotesDb(model);

                controller.getQuotes(category: controller.selectedCategory.value);
                // controller.getQuotes();
                Get.snackbar(
                  "Succesfully Quotes Add",
                  "",
                  backgroundColor: redColors,
                  onTap: (snack) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Woh"),
                          content: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Ok")),
                        );
                      },
                    );
                  },
                );
              },
              child: Text("Add Quotes"),
              style: ElevatedButton.styleFrom(backgroundColor: redColors),
            )
          ],
        ),
      ),
    );
  }
}
