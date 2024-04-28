import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'favourite_controller.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  final FavouriteController favouriteController =
      Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        centerTitle: true,
        title: const Text("Favourite App"),
      ),
      body: ListView.builder(
        itemCount: favouriteController.fruitList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        onTap: () {
                          if (favouriteController.fruitList2.contains(
                              favouriteController.fruitList[index]
                                  .toString())) {
                            favouriteController.removeFavourite(
                                favouriteController.fruitList[index]
                                    .toString());
                          } else {
                            favouriteController.addFavourite(
                                favouriteController.fruitList[index]
                                    .toString());
                          }
                        },
                        title:Text(
                            favouriteController.fruitList[index].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        trailing:
                            Obx(() => favouriteController.fruitList2.contains(
                                  favouriteController.fruitList[index]
                                      .toString(),
                                )
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                      )),
                      ))));
        },
      ),
    );
  }
}
