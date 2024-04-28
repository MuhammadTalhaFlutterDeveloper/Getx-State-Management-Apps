import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<String> fruitList =
      ["Apple", "Banana", "Orange", "Mangoe", "Guava"].obs;
  RxList<dynamic> fruitList2 = [].obs;

  addFavourite(String value) {
    fruitList2.add(value);
  }

  removeFavourite(String value) {
    fruitList2.remove(value);
  }
}
