import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Model/NewsModel.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new),
                            Text('Back')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          news.urlToImage ??
                              'https://images.prothomalo.com/prothomalo%2Fimport%2Fmedia%2F2020%2F05%2F10%2Ff0aa0797e6639d97de80c9906c394717-5eb81cdc9e298.jpg?auto=format%2Ccompress&fmt=webp&format=webp&w=640&dpr=1.0',
                          fit: BoxFit.cover,
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  news.title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      news.publishedAt! ?? "Unknown",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(news.author![0]),
                    ),
                    SizedBox(width: 10),
                    Text(
                      news.author! ?? "Unknown",
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        news.description!,
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
