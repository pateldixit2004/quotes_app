
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/controller/quotesapp_controller.dart';
import 'package:quotes_app/screen/model/category_model.dart';

import '../../utils/app_color.dart';
import '../../utils/database/database_helper.dart';
import '../../utils/decoration/app_decoration.dart';
import '../../utils/app_size.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController txtCategory=TextEditingController();
  QuotesController controller=Get.put(QuotesController());
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
            SizedBox(height: w*0.025,),
            TextField(
              controller: txtCategory,
              decoration: inputDecoration,
            ),
            SizedBox(height:  h *0.025,),
            ElevatedButton(onPressed: () {
              CategoryModel model=CategoryModel(cat: txtCategory.text);
              DataBaseHelper.dataBaseHelper.insertDb(model);
              controller.getCategory();
              Get.snackbar("Succesfully Category Add", "");
            }, child: Text("Add Category"),style: ElevatedButton.styleFrom(backgroundColor: redColors),)
          ],
        ),
      )
    );
  }
}
