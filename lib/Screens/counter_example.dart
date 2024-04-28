import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Screens/counter_controller.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Obx(() => Text(
                  style: const TextStyle(
                      fontSize: 30,),
                  counterController.counter.toString())))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
