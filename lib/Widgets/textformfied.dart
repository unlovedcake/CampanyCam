import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/material.dart';

class TextFormFields {
  static Widget textFormFields(String hint, TextEditingController? controller,
      {required Widget? widget,
      required Widget? sufixIcon,
      required bool obscureText,
      required TextInputType keyboardType,
      required TextInputAction textInputAction,
      required FormFieldValidator validator,
      required Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: onChanged,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  autofocus: false,
                  cursorColor: Colors.black,
                  controller: controller,
                  validator: validator,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 20, 15),
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
