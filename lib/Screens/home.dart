import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Screens/slider_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SliderOpacityController sliderOpacityController =
      Get.put(SliderOpacityController());

  @override
  Widget build(BuildContext context) {
    print("build method here");
    bool favourite = false;
    final customHeight = MediaQuery.of(context).size.height * 1;
    final customWidth = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: const Text('Getx App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple.shade100,
        selectedItemColor: Colors.yellow,
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Setting",
              icon: InkWell(
                  onTap: () => Get.toNamed('/settings'),
                  child: const Icon(Icons.settings))),
          const BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
                title: Text("Change Theme"),
                trailing: Icon(Icons.add_alert_sharp))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('My Youtube Channel'),
                subtitle:
                    const Text("Freelancer Talha is my youtube channel name."),
                trailing: IconButton(
                  onPressed: () {
                    favourite = true;
                    setState(() {});
                  },
                  icon: favourite == false
                      ? const Icon(Icons.favorite_outline_rounded)
                      : const Icon(Icons.favorite),
                ),
                onTap: () {
                  Get.defaultDialog(
                    title: "Freelancer Talha",
                    middleText: "Please subscribe my channel. Yes/No ?",
                    contentPadding: const EdgeInsets.all(5),
                    confirm: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("No")),
                    cancel: TextButton(
                        onPressed: () {},
                        child: InkWell(
                            onTap: () => launchUrl(Uri.parse(
                                'https://www.youtube.com/@freelancertalha2509')),
                            child: const Text("Yes"))),
                    // content: const Column(
                    //   children: [
                    //     Text("Welcome to add more content"),
                    //     Text("Welcome to add more content"),
                    //     Text("Welcome to add more content"),
                    //     Text("Welcome to add more content"),
                    //     Text("Welcome to add more content")
                    //   ],
                    // ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('My Youtube Channel'),
                subtitle:
                    const Text("Freelancer Talha is my youtube channel name."),
                trailing: const Icon(Icons.favorite_outline_rounded),
                onTap: () {
                  Get.bottomSheet(Container(
                    decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              "Change Theme of the App",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text("Light Theme"),
                          trailing: const Icon(Icons.light_mode_rounded),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          title: const Text("Dark Theme"),
                          trailing: const Icon(Icons.dark_mode_rounded),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ),
            SizedBox(
              height: customHeight * .02,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/profile");
                },
                child: const Text("Next Screen")),
            SizedBox(
              height: customHeight * .02,
            ),
            Obx(
              () => Container(
                color: Colors.purple
                    .withOpacity(sliderOpacityController.opacity.value),
                height: customHeight * .1,
                width: customWidth * .7,
                child: ListTile(
                  title: Text("title".tr),
                  subtitle: Text("value".tr),
                ),
              ),
            ),
            SizedBox(
              height: customHeight * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale("en", "US"));
                    },
                    child: const Text("English")),
                OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale("ur", "PK"));
                    },
                    child: const Text("Urdu"))
              ],
            ),
           
            Obx(
              () => Slider(
                value: sliderOpacityController.opacity.value,
                onChanged: (value) {
                  sliderOpacityController.sliderOpacity(value);
                },
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Get.toNamed('/counter');
                      },
                      child: const Text("Counter App")),
                  OutlinedButton(
                      onPressed: () {
                        Get.toNamed('/switch');
                      },
                      child: const Text("Switch On/Off")),
                
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/favourite');
                    },
                    child: const Text("Favourite App")),
                OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/imagePicker');
                    },
                    child: const Text("Image Picker"))
              ],
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.snackbar(
      //       "Talha",
      //       "I'm a Software Engineer",
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
