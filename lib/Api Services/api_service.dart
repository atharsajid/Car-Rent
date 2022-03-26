import 'dart:convert';
import 'package:get/get.dart';
import 'package:hackathone/Api%20Services/model.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxController {
  Future<List<CarList>> fetchProduct() async {
    try {
      final response = await http
          .get(Uri.parse('https://apihackathone.herokuapp.com/car/'));
      return CarList.fromJsonList(jsonDecode(response.body));
      
    } catch (e) {
      print(e);
      Get.snackbar('Error', "Api Not Fetched");
    }

    throw Exception('Failed to load Users');
  }
}
