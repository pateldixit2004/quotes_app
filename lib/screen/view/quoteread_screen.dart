import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/utils/app_color.dart';
import 'package:quotes_app/utils/app_size.dart';
import 'package:quotes_app/utils/database/database_helper.dart';
import 'package:quotes_app/screen/controller/quotesapp_controller.dart';

import '../../utils/decoration/app_decoration.dart';

class QuotesRead extends StatefulWidget {
  const QuotesRead({super.key});

  @override
  State<QuotesRead> createState() => _QuotesReadState();
}

class _QuotesReadState extends State<QuotesRead> {
  QuotesController controller=Get.put(QuotesController());
  String? category;
  @override
  void initState() {
    super.initState();
    category=Get.arguments;
    controller.getQuotes(category: category);
    // controller.getQuotes();
  }
  @override
  Widget build(BuildContext context) {

    AppSize.size.intiSize(context);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        backgroundColor: Colors.redAccent.shade200,
      ),
      body: Obx(() => ListView.builder(itemBuilder: (context, index) {
          return  Padding(
          padding: EdgeInsets.only(top: h*0.025,left: w*0.02,right: w*0.02,bottom: h*0.02),
            child: Container(
              height: h*0.2,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: h*0.02,vertical: 0.02),
              decoration: quotesDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: h*0.05,),
                  Text("${controller.quotesList[index]["quotes"]}\n"),

                  Spacer(),
                  Row(
                    children: [
                      IconButton(onPressed: () {

                        DataBaseHelper.dataBaseHelper.deleteQuotes(controller.quotesList[index]["id"]);
                        controller.getQuotes(category: category);
                        // controller.getQuotes();

                      }, icon: Icon(Icons.delete,color: redColors,))
                    ],
                  ),
                ],
              ),
            ),
          );
        }, itemCount: controller.quotesList.length,
          // itemCount: 2,
        ),
      ),
    ),);
  }
}
