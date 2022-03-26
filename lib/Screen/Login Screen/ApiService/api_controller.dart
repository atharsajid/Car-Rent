import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostApi extends GetxController{
  registration(
    String firstname,
    String lastname,
    String contact,
    String address,
    String emailaddress,
    String username,
    String password,
  ) async {
    var response = await http
        .post(Uri.parse("https://apihackathone.herokuapp.com/create/"), body: {
      'firstname': firstname,
      'lastname': lastname,
      'contact': contact,
      'address': address,
      'emailaddress': emailaddress,
      'username': username,
      'password': password,
    });
    
    print(response.body);
  }
}
