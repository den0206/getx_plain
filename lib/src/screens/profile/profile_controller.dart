import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_plain/src/model/user.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  late User user;
  @override
  void onInit() async {
    super.onInit();

    await getUser();
  }

  getUser() async {
    final dataFromUrl = "https://randomuser.me/api/";
    final uri = Uri.parse(dataFromUrl);
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      return;
    }
    final jsonData = json.decode(response.body);
    final data = jsonData["results"][0];

    user = User.fromJson(data);
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
