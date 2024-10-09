import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:upalerts/res/res.dart';

class Toasts {
  BuildContext? contex;

  init(BuildContext ctx) {
    contex = ctx;
  }

  static getErrorToast({@required String? text}) async {
    // await Fluttertoast.showToast(
    //     msg: text ?? "please try again",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 2,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: sizes!.fontRatio * 16.0);
    if (text != null) {
      BotToast.showText(
        text: text,
        contentColor: Colors.red,
        align: const Alignment(0, .6),
        borderRadius: BorderRadius.circular(getHeight() * .2),
        textStyle: TextStyle(
          fontSize: sizes!.fontSize16,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
      );
    }

    // primaryColor: AppColors.redColor,
    // );
    debugPrint("Error toast is : $text");
  }

  static getSuccessToast({@required String? text, Color? bgColor}) async {
    // await Fluttertoast.showToast(
    //     msg: text ?? "please try again",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 2,
    //     backgroundColor: AppColors.yellowColor,
    //     textColor: Colors.white,
    //     fontSize: sizes!.fontRatio * 16.0);
    BotToast.showText(
      text: text ?? "Success",
      contentColor: bgColor ?? Colors.green,
      //  AppColors.yellowColor,
      align: const Alignment(0, .6),
      borderRadius: BorderRadius.circular(getHeight() * .2),
      textStyle: TextStyle(
        fontSize: sizes!.fontSize16,
        color: Colors.white,
      ),
    );
  }

  static getWarningToast({@required String? text}) async {
    // await Fluttertoast.showToast(
    //     msg: text ?? "please try again",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 2,
    //     backgroundColor: Colors.orange,
    //     textColor: Colors.white,
    //     fontSize: sizes!.fontRatio * 16.0);
    BotToast.showText(
      text: text!,
      contentColor: Colors.orange,
      align: const Alignment(0, .6),
      borderRadius: BorderRadius.circular(getHeight() * .2),
      textStyle: TextStyle(
        fontSize: sizes!.fontSize16,
        color: Colors.white,
      ),
    );
  }
}
