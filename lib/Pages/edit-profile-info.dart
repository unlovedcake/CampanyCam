import 'package:companycam/Pages/user-project-photos-reports.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:companycam/Widgets/textformfied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({Key? key}) : super(key: key);

  @override
  _EditProfileInfoState createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  bool showXButton = false;
  bool _isHidden = true;

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _fullNameText = TextEditingController();
  final TextEditingController _phoneNumberText = TextEditingController();
  final TextEditingController _jobTitleText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 40),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    color: Colors.grey[400],
                    icon: const Icon(
                      Icons.cancel,
                      size: 40,
                    ),
                    onPressed: () {
                      //Get.to(UserProjectsPhotosReports());
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Edit Profile Info",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )),
                  )
                ],
              ),
              addVerticalSpace(20),
              SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: _formKey1,
                    child: Column(
                      children: [
                        addVerticalSpace(50),
                        TextFormFields.textFormFields("Full Name", _fullNameText,
                            widget: null,
                            sufixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Full name is required");
                          }
                        }, onChanged: (val) {}),
                        addVerticalSpace(20),
                        TextFormFields.textFormFields("Work Email", _emailText,
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
                        TextFormFields.textFormFields("Phone Number", _phoneNumberText,
                            widget: null,
                            sufixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Phone number is required ");
                          }
                        }, onChanged: (val) {}),
                        addVerticalSpace(20),
                        TextFormFields.textFormFields("Job Title", _jobTitleText,
                            widget: null,
                            sufixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Job Title is required");
                          }
                        }, onChanged: (val) {}),
                        addVerticalSpace(20),
                        TextFormFields.textFormFields("New Password", _passwordText,
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
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8),
                          child: Text("T-shirt Size"),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                splashColor: Colors.black,
                                iconSize: 40,
                                icon: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                    radius: 20,
                                    child: Text("S")),
                                onPressed: () {},
                              ),
                              IconButton(
                                splashColor: Colors.black,
                                iconSize: 40,
                                icon: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                    radius: 20,
                                    child: Text("M")),
                                onPressed: () {},
                              ),
                              IconButton(
                                splashColor: Colors.black,
                                iconSize: 40,
                                icon: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                    radius: 20,
                                    child: Text("L")),
                                onPressed: () {},
                              ),
                              IconButton(
                                splashColor: Colors.black,
                                iconSize: 40,
                                icon: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                    radius: 20,
                                    child: Text("XL")),
                                onPressed: () {},
                              ),
                              IconButton(
                                splashColor: Colors.black,
                                iconSize: 40,
                                icon: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                    radius: 20,
                                    child: Text("2XL")),
                                onPressed: () {},
                              ),
                              IconButton(
                                splashColor: Colors.black,
                                iconSize: 40,
                                icon: CircleAvatar(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.grey[300]!,
                                    radius: 20,
                                    child: Text("3XL")),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
