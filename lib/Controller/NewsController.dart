import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/NewsModel.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> NewsForYouList = <NewsModel>[].obs;

  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrandingNews();
  }

  Future<void> getTrandingNews() async {
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body['articles'];
        for (var news in articals) {
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print('Something went wrong in Tranding News');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> getNewsForYou() async {
    var baseURL =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-06-29&sortBy=publishedAt&apiKey=API_KEY";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);

      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body['articles'];
        for (var news in articals) {
          NewsForYouList.add(NewsModel.fromJson(news));
        }
      } else {
        print('Something went wrong in News For You');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
