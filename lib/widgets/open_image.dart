import 'package:beautyapp/shared/styles/colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class OpenImage extends StatelessWidget {
  final String? link;

  const OpenImage({Key? key, this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accent,
      body: Stack(
        children: [
          InteractiveViewer(
            child: Center(
              child: link!.contains('.png')
                  ? ExtendedImage.asset(link!, fit: BoxFit.fitWidth)
                  : ExtendedImage.network(
                      link!,
                      fit: BoxFit.fitWidth,
                    ),
            ),
          ),
          Positioned(
              top: 35,
              left: 5,
              child: IconButton(icon: const Icon(Icons.close_rounded), onPressed: () { context.router.pop(); },)),
        ],
      ),
    );
  }
}
