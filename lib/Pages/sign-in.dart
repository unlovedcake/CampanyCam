import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:companycam/Widgets/textformfied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _companyNameText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool showXButton = false;
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 40),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    addVerticalSpace(20),
                    Container(
                      margin: const EdgeInsets.only(left: 14),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Sign in to an existing account.",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    addVerticalSpace(20),
                    TextFormFields.textFormFields("Email", _emailText,
                        widget: null,
                        sufixIcon: showXButton
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    (context as Element)
                                        .markNeedsBuild(); // this line of code update the changes value
                                    _emailText.text = "";
                                    showXButton = false;
                                  },
                                  child: CircleAvatar(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.grey[300]!,
                                      radius: 10,
                                      child: const Icon(
                                        Icons.close,
                                        size: 14,
                                      )),
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(8.0),
                              ),
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next, validator: (value) {
                      if (value!.isEmpty) {
                        return ("Email is required");
                      } else if (!value!.contains("@")) {
                        return ("Invalid Email Format");
                      }
                    }, onChanged: (val) {
                      setState(() {});

                      if (val.isEmpty) {
                        showXButton = false;
                      } else {
                        showXButton = true;
                      }
                    }),
                    addVerticalSpace(20),
                    TextFormFields.textFormFields("Password", _passwordText,
                        widget: null,
                        sufixIcon: IconButton(
                          icon: Icon(
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            _isHidden = !_isHidden;

                            (context as Element).markNeedsBuild();
                          },
                        ),
                        obscureText: _isHidden,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done, validator: (value) {
                      if (value!.isEmpty) {
                        return ("Password is required ");
                      }
                    }, onChanged: (val) {}),
                    addVerticalSpace(20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(370, 40),
                          textStyle: TextStyle(fontSize: 14),
                          primary: Color(0xff00ABC9),
                          onPrimary: Colors.white),
                      onPressed: () {
                        Get.to(
                          () => const Home(),
                        );

                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    addVerticalSpace(20),
                    const Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
