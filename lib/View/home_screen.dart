import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange.shade100,
        appBar: AppBar(
          title: Text(
            "Bhagvad Gita",
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: FutureBuilder(
          future: homeController.getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${homeController.dataList[index].slug}",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('/verse', arguments: index);
                            },
                            child: Text(
                              "Read",
                              style: TextStyle(color: Colors.green),
                            )),
                      ],
                    ),
                  );
                },
                itemCount: homeController.dataList.length,
              );
            }
            return Center(
              child: const CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
