import 'package:beautyapp/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class EmptyListReplacement extends StatelessWidget {
  final IconData? icon;
  final String text;
  const EmptyListReplacement({Key? key, this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...[
            icon != null
                ? Icon(icon, color: mainColor, size: 50)
                : const Image(
                    // height: 123,
                    width: 200,
                    image: AssetImage('assets/images/logo.png'),
                  )
          ],
          Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
