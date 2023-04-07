import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';

abstract class Failure extends Error {
  void handleError();
}

class GeneralFailure extends Failure {
  final dynamic error;

  GeneralFailure(this.error);

  void handleError() {
    debugPrint('General error: ${error.toString()}');
  }
}


class ServerFailure extends Failure {
  final DioError? error;

  ServerFailure(this.error);

  void handleError() {
    switch(error?.response?.statusCode){
      case 500:
      case 400:
      case 401:
        showToastMessage(error?.response?.statusMessage ?? '', gravity: ToastGravity.BOTTOM);
        break;
      default:
        break;
    }
  }
}
