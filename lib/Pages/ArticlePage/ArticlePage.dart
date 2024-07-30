import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/Widgets/SearchWidget.dart';

import '../HomePage/Widgets/NewsTile.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child: ListView(
            children: const [
              SearchWidget(),
              SizedBox(height: 20),
              Column(
                children: [],
              )

            ],
          ),
        ),
      ),
    );
  }
}
