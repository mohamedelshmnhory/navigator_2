import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_route/auto_route.dart';
import 'constants.dart';
import 'image_paths.dart';

Widget defaultButton({
  double height = 50,
  double width = double.infinity,
  Color background = mainColor,
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double radius = 10.0,
  double textSize = 18,
  required Function function,
  required String? text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function as void Function()?,
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize),
        ),
        splashColor: Colors.transparent,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        // border: Border.all(),
        color: background,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
  Color textColor = Colors.white,
  FontWeight weight = FontWeight.w900,
  double size = 14,
}) =>
    TextButton(
      onPressed: function as void Function()?,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(fontWeight: weight, color: textColor, fontSize: size),
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String? label,
  required IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  min = 1,
  double prefixWidth = 45,
  direction = TextDirection.rtl,
  inputAction = TextInputAction.done,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      autocorrect: false,
      obscureText: isPassword,
      enabled: isClickable,
      textInputAction: inputAction,
      onFieldSubmitted: onSubmit as void Function(String)?,
      textDirection: direction,
      textAlign: TextAlign.right,
      onChanged: onChange as void Function(String)?,
      onTap: onTap as void Function()?,
      validator: validate,
      minLines: min,
      maxLines: isPassword ? 1 : 5,
      cursorColor: mainColor,
      cursorHeight: 25,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        // border: InputBorder.none,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: mainColor, width: 1.5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        prefixIcon: Icon(
          prefix,
          color: mainColor,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: prefixWidth),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed as void Function()?,
                icon: Icon(
                  suffix,
                  color: mainColor,
                  size: 25,
                ),
              )
            : null,
        // border: OutlineInputBorder(),
      ),
    );

void showSnack({
  required String text,
  SnackStates state = SnackStates.SUCCESS,
}) =>
    ScaffoldMessenger.of(navState.currentContext!).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(14),
      backgroundColor: chooseToastColor(state),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, color: Colors.white, fontFamily: 'cairo'),
      ),
    ));

// enum
enum SnackStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(SnackStates state) {
  switch (state) {
    case SnackStates.SUCCESS:
      return mainColor.withOpacity(.5);
    case SnackStates.ERROR:
      return Colors.redAccent.withOpacity(.5);
    case SnackStates.WARNING:
      return Colors.orangeAccent.withOpacity(.5);
  }
}

const spinkit = Center(
  child: SpinKitRing(
    color: mainColor,
    size: 40.0,
    lineWidth: 5,
    duration: Duration(milliseconds: 800),
  ),
);

BoxDecoration get authBoxDecoration {
  return BoxDecoration(
    color: Colors.white,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Colors.white30,
        const Color(0xFF10BAD2).withOpacity(.3),
      ],
    ),
    image: DecorationImage(
        opacity: .5,
        image: AssetImage(getAssetImage(ImagePathName.auth)),
        fit: BoxFit.cover),
  );
}

Image get buildLogo {
  return Image(
    image: AssetImage(getAssetImage(ImagePathName.logo)),
    width: SizeConfig.screenHeight! * .3,
  );
}

buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline5,
      maxLines: 1,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, size: 20),
      onPressed: () => context.popRoute(),
    ),
  );
}

Stack buildDropdownMenu({
  required BuildContext context,
  required TextEditingController controller,
  required String label,
  IconData? icon,
  Function? onChange,
  required items,
}) {
  return Stack(
    // alignment: Alignment.center,
    children: [
      defaultFormField(
        controller: controller,
        type: TextInputType.name,
        validate: (String? value) {
          if (value!.isEmpty) {
            return emptyError;
          }
        },
        label: label,
        prefix: icon,
        prefixWidth: icon == null ? 0 : 45,
      ),
      // SizedBox.expand(child: Container()),
      DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 10),
          child: DropdownButton(
            isExpanded: true,
            menuMaxHeight: 400,
            onChanged: onChange as void Function(dynamic)?,
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: mainColor,
            ),
            items: items,
          ),
        ),
      ),
    ],
  );
}


// void navigateTo(context, widget) => Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//     );
//
// void navigateAndFinish(
//   context,
//   widget,
// ) =>
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//       (route) {
//         return false;
//       },
//     );