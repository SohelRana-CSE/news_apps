import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/Pages/HomePage/HomePage.dart';
import 'package:news_app/Pages/Profile/ProfilePage.dart';

class BottomNavigationController extends GetxController{
   RxInt index = 0.obs;

   var pages = [
     HomePage(),
     ArticlePage(),
      ProfilePage(),
   ];
}
