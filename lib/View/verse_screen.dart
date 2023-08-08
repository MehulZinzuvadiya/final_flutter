import 'package:final_flutter/Controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerseScreen extends StatefulWidget {
  const VerseScreen({super.key});

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {
  HomeController homeController = Get.put(HomeController());
  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        title: Text("Verse data"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
        future: homeController.getdata2(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${homeController.dataList2[index].id}",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${homeController.dataList2[index].wordMeanings}",
                  ),
                ],
              ),
            );
          }
          return Center(
            child: const CircularProgressIndicator(
              color: Colors.orangeAccent,
            ),
          );
        },
      ),
    ));
  }
}
