import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/screen/model/category_model.dart';
import 'package:quotes_app/screen/model/quotes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper
{
  static final  dataBaseHelper=DataBaseHelper._();
  DataBaseHelper._();
  Database? database;
  final String dbPath="database.db";
  final String quotesTable="quotes";
  final String categoryTable="category";
  final String category="category";
  final String quotes="quotes";
  final String name="name";


  Future<Database?> checkDb()
  async {
    if(database!=null)
      {
        return database;
      }
    else
      {
        return await initDb();
      }
  }

  Future<Database> initDb()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    String? path=join(dir.path,dbPath);
    return await openDatabase(onCreate: (db, version) async {
      await db.execute("CREATE TABLE $categoryTable ( id INTEGER PRIMARY KEY AutoIncrement , $category TEXT)");
      await db.execute("CREATE TABLE $quotesTable ( id INTEGER PRIMARY KEY AutoIncrement , $quotes TEXT,$category TEXT)");
    },version: 1,path);
  }

  Future<int> insertDb(CategoryModel model)
  async {
    database=await checkDb();
    return await database!.insert(categoryTable, {
      category:model.cat,
    });
  }

  Future<List> readDb()
  async {
    database=await checkDb();
   String? query="SELECT * FROM $categoryTable";
   List<Map> list=await database!.rawQuery(query);
   return list;
  }

 Future<int> deleteCategory(int id)
  async {
    database= await checkDb();
    return database!.delete(categoryTable,where: "id=?",whereArgs: [id]);
  }



  Future<int> insertQuotesDb(QuotesModel model)
  async {
    database=await checkDb();
    return await database!.insert(quotesTable, {

      category:model.category,
      quotes:model.quotes,
    });
  }

  Future<List> readQuotesDb(String c)
  async {
    database=await checkDb();
    // String? query="SELECT * FROM $quotesTable WHERE $category='$cat'";
    String query="SELECT * FROM $quotesTable WHERE $category = '$c'";IP4
    List list=await database!.rawQuery(query);
    return list;
  }

  Future<void> deleteQuotes(int id)
  async {
    database=await checkDb();
    database!.delete(quotesTable,where: "id=?",whereArgs: [id]);
  }
}