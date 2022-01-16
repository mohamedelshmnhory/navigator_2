import 'dart:io';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  } catch (_) {
    return false;
  }
}

void internetAlert(Function fun) {
  showDialog(
      context: navState.currentState!.context,
      builder: (_) => AlertDialog(
            title: const Text(internetErrorMsg, textAlign: TextAlign.center),
            content: IconButton(
                onPressed: () {
                  fun();
                  navState.currentState!.context.router.pop();
                },
                icon: const Icon(Icons.refresh)),
            // defaultTextButton(
            //     function: () {
            //       fun();
            //       Navigator.pop(navState.currentState!.context);
            //     },
            //     text: 'اعادة المحاولة',
            //     textColor: mainColor),
          ));
}

String internetErrorMessage() => 'No internet connection';
