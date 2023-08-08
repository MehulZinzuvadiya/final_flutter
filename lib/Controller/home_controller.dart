import 'package:get/get.dart';

import '../Utils/api_helper.dart';

class HomeController extends GetxController {
  List<dynamic> dataList = [];

  List<dynamic> dataList2 = [];

  Future<List> getdata() async {
    dataList = await ApiHelper.apiHelper.getApi() as List;
    return dataList;
  }

  Future<List> getdata2() async {
    dataList2 = await ApiHelper.apiHelper.getApi2() as List;
    return dataList2;
  }
}
