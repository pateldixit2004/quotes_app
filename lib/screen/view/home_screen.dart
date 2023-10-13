import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/utils/app_color.dart';
import 'package:quotes_app/utils/app_size.dart';
import 'package:quotes_app/utils/database/database_helper.dart';
import 'package:quotes_app/screen/controller/quotesapp_controller.dart';
import 'package:sizer/sizer.dart';

import '../../utils/decoration/app_decoration.dart';
import '../../utils/textStyle/app_textStyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHover = false;
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.size.intiSize(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quotes"),
          centerTitle: true,
          backgroundColor: redColors,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("/tab");
              },
              child: Icon(Icons.add),
              onHover: (value) {
                print("$value");
                setState(
                  () {
                    isHover = value;
                  },
                );
              },
            ),
            IconButton(onPressed: () {





            }, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(

                onTap: () {
                  Get.toNamed("/quotes",arguments: controller.categoryList[index]['category']);
                },
                onDoubleTap: () {
                  print("==================================");
                  DataBaseHelper.dataBaseHelper.readDb();
                  DataBaseHelper.dataBaseHelper.deleteCategory(controller.categoryList[index]['id']);
                  controller.getCategory();
                  print("==================================");
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(w * 0.04),),
                  child: Text(
                    "${controller.categoryList[index]['category']}",
                    style: TextStyle(fontSize: w * 0.05),
                  ),
                ),
              );
            },
            itemCount: controller.categoryList.length,
          ),
        ),
      ),
    );
  }
}
