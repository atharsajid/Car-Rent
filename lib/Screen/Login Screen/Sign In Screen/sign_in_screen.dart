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
  bool password = true;

  passEyeIcon() {
    password
        ? Icon(
            Icons.visibility,
            color: white,
          )
        : Icon(
            Icons.visibility_off,
            color: white,
          );
  }

  TextEditingController emailtxt = TextEditingController();
  TextEditingController passtxt = TextEditingController();
  final loginController = Get.put(LoginService());

  @override
  void initState() {
    super.initState();
    emailtxt.addListener(() => setState(() {}));
    passtxt.addListener(() => setState(() {}));
  }

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
                  email(),
                  SizedBox(
                    height: height,
                  ),
                  pass(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Colors.white),
                    ),
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
  Widget pass() {
    return TextField(
      controller: passtxt,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.lock,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Password",
        hintStyle: txtwhite,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              password = !password;
            });
          },
          icon: passtxt.text.isEmpty
              ? Container(
                  width: 0,
                )
              : password
                  ? Icon(
                      Icons.visibility,
                      color: white,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: white,
                    ),
        ),
      ),
      obscureText: password,
    );
  }

  Widget email() {
    return TextField(
      controller: emailtxt,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.email,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Username",
        hintStyle: txtwhite,
        suffixIcon: emailtxt.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      emailtxt.clear();
                    },
                  );
                },
                icon: Icon(
                  Icons.cancel,
                  color: white,
                ),
              ),
      ),
    );
  }

//sign in button which press to continue home screen
  Widget signbotton() {
    return OutlinedButton.icon(
      style: signbtn,
      onPressed: () {
        if (emailtxt.text.isNotEmpty && passtxt.text.isNotEmpty) {
          Get.to(HomeScreen());
        } else {
          Get.snackbar('Required', 'All Fields are required',
              colorText: Colors.white);
        }
      },
      icon: Icon(
        Icons.person,
        color: white,
      ),
      label: Text(
        "Sign In",
        style: signbtntxt,
      ),
    );
  }

  final txtwhite = TextStyle(
    color: white,
  );
}
