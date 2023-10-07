import 'package:flutter/material.dart';
import 'package:quotes_app/%20utile/app_color.dart';
import 'package:quotes_app/screen/view/category_screen.dart';
import 'package:quotes_app/screen/view/quotes_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: redColors,
            bottom: TabBar(tabs: [
              Tab(
                child: Text("Add category"),

              ),
              Tab(
                child: Text("Add quotes"),
              ),
            ],indicatorSize: TabBarIndicatorSize.label,indicatorColor: Colors.black,isScrollable: false),
          ),
          body: TabBarView(
            children: [
              CategoryScreen(),
              QuotesScreen(),
            ],

          ),
        ),
      ),
    );
  }
}
