import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathone/Screen/Login%20Screen/ApiService/api_controller.dart';
import '../../Components/colors.dart';
import '../../Components/configration.dart';
import '../Sign In Screen/sign_in_screen.dart';
import '../components.dart';
import '../widget/logo_and_slogan_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String firstname = "";
  String lastname = "";
  String address = "";
  String contact = "";
  String username = "";
  String email = "";
  String password = "";
  double heightgap = 20;
  bool passwrd = true;
  bool istextfieldempty = false;
  TextEditingController firstnameCont = TextEditingController();
  TextEditingController lastnameCont = TextEditingController();
  TextEditingController contactCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController emailtxt = TextEditingController();
  TextEditingController usernametxt = TextEditingController();
  TextEditingController passwordtxt = TextEditingController();
  final registrationController = Get.put(PostApi());
  @override
  void initState() {
    super.initState();
    emailtxt.addListener(() => setState(() {}));
    usernametxt.addListener(() => setState(() {}));
    passwordtxt.addListener(() => setState(() {}));
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: logoSlogan(name, iconimg, slogan),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    firstnametext(),
                    SizedBox(
                      height: heightgap,
                    ),
                    lastnametext(),
                    SizedBox(
                      height: heightgap,
                    ),
                    contactText(),
                    SizedBox(
                      height: heightgap,
                    ),
                    addressText(),
                    SizedBox(
                      height: heightgap,
                    ),
                    usernm(),
                    SizedBox(
                      height: heightgap,
                    ),
                    emal(),
                    SizedBox(
                      height: heightgap,
                    ),
                    pass(),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: heightgap),
                      child: signbotton(),
                    ),
                    SizedBox(
                      height: heightgap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//First Name TextField
  Widget firstnametext() {
    return TextField(
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
      keyboardType: TextInputType.name,
      controller: firstnameCont,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.text_format,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "First Name",
        hintStyle: txtwhite,
        suffixIcon: firstnameCont.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      firstnameCont.clear();
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

  //LastName textfield
  Widget lastnametext() {
    return TextField(
      onChanged: (value) {
        setState(() {
          lastname = value;
        });
      },
      keyboardType: TextInputType.name,
      controller: lastnameCont,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.text_format,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Last Name",
        hintStyle: txtwhite,
        suffixIcon: lastnameCont.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      lastnameCont.clear();
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

  //Contact
  Widget contactText() {
    return TextField(
      onChanged: (value) {
        setState(() {
          contact = value;
        });
      },
      keyboardType: TextInputType.number,
      controller: contactCont,
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
        hintText: "Contact Number",
        hintStyle: txtwhite,
        suffixIcon: contactCont.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      addressCont.clear();
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

  //Address TextField
  Widget addressText() {
    return TextField(
      onChanged: (value) {
        setState(() {
          address = value;
        });
      },
      keyboardType: TextInputType.name,
      controller: addressCont,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.location_on,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Address",
        hintStyle: txtwhite,
        suffixIcon: addressCont.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      addressCont.clear();
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

//email textfield
  Widget usernm() {
    return TextField(
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
      keyboardType: TextInputType.name,
      controller: usernametxt,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.person,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Username",
        hintStyle: txtwhite,
        suffixIcon: usernametxt.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      usernametxt.clear();
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

//email textfield
  Widget emal() {
    return TextField(
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      keyboardType: TextInputType.emailAddress,
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
        hintText: "Email",
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

//password textfield
  Widget pass() {
    return TextField(
      controller: passwordtxt,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
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
              passwrd = !passwrd;
            });
          },
          icon: passwrd
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
      obscureText: passwrd,
    );
  }

//password textfield
  Widget repassword() {
    return TextField(
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
        hintText: "Re-enter Password",
        hintStyle: txtwhite,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwrd = !passwrd;
            });
          },
          icon: passwrd
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
      obscureText: passwrd,
    );
  }

//sign in button which press to continue home screen
  Widget signbotton() {
    return OutlinedButton.icon(
      style: signbtn,
      onPressed: () {
        setState(() {
          if (firstnameCont.text.isNotEmpty &&
              lastnameCont.text.isNotEmpty &&
              contactCont.text.isNotEmpty &&
              addressCont.text.isNotEmpty &&
              emailtxt.text.isNotEmpty &&
              usernametxt.text.isNotEmpty &&
              passwordtxt.text.isNotEmpty) {
            registrationController.registration(
              firstnameCont.text,
              lastnameCont.text,
              contactCont.text,
              addressCont.text,
              emailtxt.text,
              usernametxt.text,
              passwordtxt.text,
            );
            successmsg(context);
          } else {
            Get.snackbar('Required', 'All fields are required',
                colorText: Colors.white);
          }
        });
      },
      icon: Icon(
        Icons.person,
        color: white,
      ),
      label: Text(
        "Sign Up",
        style: signbtntxt,
      ),
    );
  }

//white text style for textfied hint text
  final txtwhite = TextStyle(
    color: white,
  );
//Pop up dialog for successful account created
  void successmsg(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text("Congratulations!"),
            content: const Text("Your account has been created successfuly."),
            actions: [
              TextButton(
                onPressed: () {
                  firstnameCont.clear();
                  lastnameCont.clear();
                  contactCont.clear();
                  addressCont.clear();
                  emailtxt.clear();
                  usernametxt.clear();
                  passwordtxt.clear();
                  Get.back();
                },
                child: const Text("Back"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  });
                },
                child: const Text(
                  "Sign In",
                ),
              ),
            ],
          ));
}
