import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/material.dart';

class TextFormFields {
  static Widget textFormFields(
      String label, String hint, TextEditingController? controller,
      {required Widget? widget,
      required Widget? sufixIcon,
      required bool obscureText,
      required TextInputType keyboardType,
      required TextInputAction textInputAction,
      required FormFieldValidator validator}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  autofocus: false,
                  cursorColor: Colors.orange,
                  controller: controller,
                  validator: validator,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: hint,
                    labelText: hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: sufixIcon,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                    ),
                  ),
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    ),
            ],
          ),
          addVerticalSpace(4),
        ],
      ),
    );
  }
}
