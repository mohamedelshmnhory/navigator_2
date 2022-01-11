import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (value != '0') ...[
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              // padding: EdgeInsets.all(1.0),
              // color: Theme.of(context).accentColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color ,
              ),
              constraints: const BoxConstraints(
                  minWidth: 14, minHeight: 14, maxHeight: 14, maxWidth: 14),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 8, color: Colors.white),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
