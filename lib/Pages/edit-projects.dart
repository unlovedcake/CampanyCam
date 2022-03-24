import 'package:companycam/Widgets/sizebox.dart';
import 'package:companycam/Widgets/textformfied.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProjects extends StatefulWidget {
  const EditProjects({Key? key}) : super(key: key);

  @override
  _EditProjectsState createState() => _EditProjectsState();
}

class _EditProjectsState extends State<EditProjects> {
  final _formKey1 = GlobalKey<FormState>();

  bool showXButton = false;

  final TextEditingController _projectNamelText = TextEditingController();
  final TextEditingController _addressLine1Text = TextEditingController();
  final TextEditingController _addressLine2Text = TextEditingController();
  final TextEditingController _cityText = TextEditingController();
  final TextEditingController _stateText = TextEditingController();
  final TextEditingController _postalCodeText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 8, top: 30),
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
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Edit Project",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(20),
              SingleChildScrollView(
                child: Container(
                  height: 750,
                  child: Form(
                    key: _formKey1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        addVerticalSpace(50),
                        TextFormFields.textFormFields("Project Name", _projectNamelText,
                            widget: null,
                            sufixIcon: showXButton
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        (context as Element)
                                            .markNeedsBuild(); // this line of code update the changes value
                                        _projectNamelText.text = "";
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
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Project Name is required");
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
                        TextFormFields.textFormFields("Address Line 1", _addressLine1Text,
                            widget: null,
                            sufixIcon: showXButton
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        (context as Element)
                                            .markNeedsBuild(); // this line of code update the changes value
                                        _addressLine1Text.text = "";
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
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Address is required");
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
                        TextFormFields.textFormFields("Address Line 2", _addressLine2Text,
                            widget: null,
                            sufixIcon: showXButton
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        (context as Element)
                                            .markNeedsBuild(); // this line of code update the changes value
                                        _addressLine2Text.text = "";
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
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Address is required");
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
                        TextFormFields.textFormFields("City", _cityText,
                            widget: null,
                            sufixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next, validator: (value) {
                          if (value!.isEmpty) {
                            return ("City is required ");
                          }
                        }, onChanged: (val) {}),
                        addVerticalSpace(20),
                        TextFormFields.textFormFields("State", _stateText,
                            widget: null,
                            sufixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next, validator: (value) {
                          if (value!.isEmpty) {
                            return ("State is required ");
                          }
                        }, onChanged: (val) {}),
                        addVerticalSpace(20),
                        TextFormFields.textFormFields("Postal Code", _postalCodeText,
                            widget: null,
                            sufixIcon: null,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done, validator: (value) {
                          if (value!.isEmpty) {
                            return ("Postal Code is required ");
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
                            if (_formKey1.currentState!.validate()) {}
                          },
                          child: const Text(
                            "Save Changes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
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
