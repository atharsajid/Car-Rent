import 'dart:convert';
import 'package:get/get.dart';
import 'package:hackathone/Screen/Login%20Screen/ApiService/model.dart';
import 'package:http/http.dart' as http;

class LoginService extends GetxController {
  Future<List<LoginModel>> fetchuser() async {
    try {
      final response = await http
          .get(Uri.parse('https://ecommerce-api-djang.herokuapp.com/'));

      return LoginModel.fromJsonList(jsonDecode(response.body));
      
    } catch (e) {
      print(e);
      Get.snackbar('Error', "Cought on error");
    }

    throw Exception('Failed to load Users');
  }
}
