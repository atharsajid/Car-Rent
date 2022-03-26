import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathone/Screen/Home%20Screen/home_screen.dart';
import 'package:hackathone/Screen/Login%20Screen/ApiService/login_api_controller.dart';
import '../../Components/colors.dart';
import '../../Components/configration.dart';
import '../components.dart';
import '../widget/logo_and_slogan_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double height = 40;

  TextEditingController contacttxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundimage,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: logoSlogan(name, iconimg, slogan),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  contact(),
                  SizedBox(
                    height: height,
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: height),
                    child: signbotton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//password textfield
  Widget contact() {
    return TextField(
      controller: contacttxt,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.numbers,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "+921111111111",
        hintStyle: txtwhite,
      ),
    );
  }

//sign in button which press to continue home screen
  Widget signbotton() {
    return OutlinedButton.icon(
      style: signbtn,
      onPressed: () {
        if (contacttxt.text.isNotEmpty) {
        
        } else {
          Get.snackbar('Required', 'Contact number must be +921234567891',
              colorText: Colors.white);
        }
      },
      icon: Icon(
        Icons.person,
        color: white,
      ),
      label: Text(
        "Get OTP",
        style: signbtntxt,
      ),
    );
  }

  final txtwhite = TextStyle(
    color: white,
  );
}
