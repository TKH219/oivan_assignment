import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showToastMessage(String message, {ToastGravity gravity = ToastGravity.CENTER}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: gravity,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.grey,
    textColor: Colors.black,
    fontSize: 16,
  );
}

void showLoadingCircle(bool isLoading) {
  final _currentContext = Get.context!;
  if (isLoading) {
    showDialog(
      context: _currentContext,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CupertinoActivityIndicator(
              radius: 15,
            ),
          ),
        ),
      ),
    );
  } else {
    Navigator.of(_currentContext).pop();
  }
}
