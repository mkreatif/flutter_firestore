import 'package:flutter/material.dart';

const primaryColor = Colors.blue;

InputDecoration defaultInputDecoration(
    {required String hintText,
    bool stslabel = true,
    bool showSufix = false,
    bool isObscured = false,
    Function()? onIconTap}) {
  return InputDecoration(
    label: stslabel ? Text(hintText) : null,
    hintText: hintText,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.red),
    ),
    suffixIcon: showSufix
        ? IconButton(
            focusNode: null,
            icon: Icon(
              isObscured ? Icons.visibility : Icons.visibility_off,
              color: isObscured ? primaryColor : Colors.grey,
            ),
            onPressed: onIconTap,
          )
        : null,
  );
}
