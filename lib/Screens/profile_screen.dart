import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  final String name; 
  const ProfileScreen({super.key,required this.name});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Center(child: Text("Welcome ${widget.name}")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back"))
        ],
      ),
    );
  }
}
