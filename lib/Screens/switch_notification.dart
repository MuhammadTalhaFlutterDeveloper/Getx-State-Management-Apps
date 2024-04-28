import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'switch_controller.dart';

class SwitchNotification extends StatefulWidget {
  const SwitchNotification({super.key});

  @override
  State<SwitchNotification> createState() => _SwitchNotificationState();
}

class _SwitchNotificationState extends State<SwitchNotification> {

  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                Obx(() => Switch(
                      value: switchController.notification.value,
                      onChanged: (value) {
                        switchController.setNotification(value);
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
