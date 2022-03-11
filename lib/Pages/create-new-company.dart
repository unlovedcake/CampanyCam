import 'package:companycam/Widgets/sizebox.dart';
import 'package:companycam/Widgets/textformfied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class CreateNewCompany extends StatefulWidget {
  const CreateNewCompany({Key? key}) : super(key: key);

  @override
  _CreateNewCompanyState createState() => _CreateNewCompanyState();
}

class _CreateNewCompanyState extends State<CreateNewCompany> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _companyNameText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 10, top: 40),
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Container(
              margin: const EdgeInsets.only(left: 14),
              alignment: Alignment.topLeft,
              child: const Text(
                "Create a new company.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            addVerticalSpace(20),
            TextFormFields.textFormFields(
                "Company Name", "Company Name", _companyNameText,
                widget: null,
                sufixIcon: null,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next, validator: (value) {
              if (value!.isEmpty) {
                return ("Company is required");
              }
            }),
            addVerticalSpace(20),
            TextFormFields.textFormFields("Work Email", "Email", _emailText,
                widget: null,
                sufixIcon: null,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next, validator: (value) {
              if (value!.isEmpty) {
                return ("Email is required");
              } else if (!value!.contains("@")) {
                return ("Invalid Email Format");
              }
            }),
            addVerticalSpace(20),
            TextFormFields.textFormFields("Password", "Password", _passwordText,
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
            }),
            addVerticalSpace(20),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: valuefirst,
                  onChanged: (value) {
                    setState(() {
                      valuefirst = value!;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                      text: 'I agree to ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms of Use ',
                            style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              }),
                        TextSpan(
                            text: 'and ',
                            style: TextStyle(fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              }),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              })
                      ]),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(370, 40),
                  textStyle: TextStyle(fontSize: 14),
                  primary: Colors.blue,
                  onPrimary: Colors.black),
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text(
                "Create Company",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _emailText {}
