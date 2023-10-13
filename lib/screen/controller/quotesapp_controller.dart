

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../utils/database/database_helper.dart';

class QuotesController extends GetxController
{
  RxList categoryList=[].obs;
  RxList quotesList=[].obs;
  List defaultList=["Motivation","Love"];
  var selectedCategory=  Rxn<String>();


  Future<void> getCategory()
  async {
    categoryList.value=await DataBaseHelper.dataBaseHelper.readDb();
  }

  Future<void> getQuotes({required category})
  async {
    quotesList.value=await DataBaseHelper.dataBaseHelper.readQuotesDb(category);
  }

  // Future<void> getQuotes()
  // async {
  //   quotesList.value=await DataBaseHelper.dataBaseHelper.readQuotesDb();
  // }




}