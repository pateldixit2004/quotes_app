

import 'package:get/get.dart';
import 'package:quotes_app/%20utile/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class QuotesController extends GetxController
{
  RxList categoryList=[].obs;
  RxList quotesList=[].obs;
  List defaultList=["Motivation","Love"];

  Future<void> getCategory()
  async {
    categoryList.value=await DataBaseHelper.dataBaseHelper.readDb();
  }

  Future<void> getQuotes()
  async {
    quotesList.value=await DataBaseHelper.dataBaseHelper.readQuotesDb();
  }


  // RxList searchCat=[].obs;
  // List filterList=[];
  // void searchCategory(String serch)
  // {
  //   if(serch.isEmpty)
  //     {
  //       searchCat.value=List.from(categoryList);
  //       log("=================================================${searchCat.length}");
  //     }
  //   else
  //     {
  //       for(var x in categoryList)
  //         {
  //
  //         }
  //     }
  // }
}