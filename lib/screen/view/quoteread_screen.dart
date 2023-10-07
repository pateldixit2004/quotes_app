import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/%20utile/app_color.dart';
import 'package:quotes_app/%20utile/app_size.dart';
import 'package:quotes_app/%20utile/database/database_helper.dart';
import 'package:quotes_app/screen/controller/quotesapp_controller.dart';

import '../../ utile/decoration/app_decoration.dart';

class QuotesRead extends StatefulWidget {
  const QuotesRead({super.key});

  @override
  State<QuotesRead> createState() => _QuotesReadState();
}

class _QuotesReadState extends State<QuotesRead> {
  QuotesController controller=Get.put(QuotesController());
  @override
  void initState() {
    super.initState();
    controller.getQuotes();
  }
  @override
  Widget build(BuildContext context) {

    AppSize.size.intiSize(context);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
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
                  // Text("fefef"),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(onPressed: () {
                        DataBaseHelper.dataBaseHelper.deleteQuotes(controller.quotesList[index]["id"]);
                        controller.getQuotes();
                      }, icon: Icon(Icons.delete,color: redColors,))
                    ],
                  )
                ],
              ),
            ),
          );
        },
          itemCount: controller.quotesList.length,
          // itemCount: 2,
        ),
      ),
    ),);
  }
}
