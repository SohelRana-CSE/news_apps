import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/Widgets/TrandingCard.dart';
import 'package:news_app/Pages/NewsDetails/NewsDetails.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.dashboard),
                ),
                Text(
                  "NEWS APP",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
                InkWell(
                  onTap: () {
                    newsController.getNewsForYou();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.person),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hottest News",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "See All",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: newsController.trandingNewsList
                        .map(
                          (e) => TrandingCard(
                            ontap: () {
                              Get.to(NewsDetailsPage(
                                news: e,
                              ));
                            },
                            imageUrl: e.urlToImage!,
                            title: e.title!,
                            author: e.author ?? "Unknown",
                            tag: 'Trending No 1',
                            time: e.publishedAt!,
                          ),
                        )
                        .toList(),
                  ),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "News for you",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "See All",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Column(
                children: newsController.NewsForYouList.map(
                  (e) => NewsTile(
                    ontap: () {
                      Get.to(NewsDetailsPage(news: e,));
                    },
                    imageUrl: e.urlToImage ??
                        "https://images.prothomalo.com/prothomalo-bangla%2F2024-07%2F95d9e5de-81e6-4577-b19e-13fffd679680%2F385549.webp?rect=200%2C0%2C1080%2C720&auto=format%2Ccompress&fmt=webp&format=webp&w=640&dpr=1.0",
                    title: e.title!,
                    author: e.author ?? "Unknown",
                    time: e.publishedAt!,
                  ),
                ).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
