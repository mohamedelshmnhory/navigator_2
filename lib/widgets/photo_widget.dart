import 'package:beautyapp/shared/components/components.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'open_image.dart';

class PhotoWidget extends StatelessWidget {
  final String? photoLink;
  final bool canOpen;
  const PhotoWidget({Key? key, this.photoLink, this.canOpen = false})
      : super(key: key);

  // with TickerProviderStateMixin {
  // late AnimationController controller;

  // @override
  // initState() {
  //   super.initState();
  //   initController();
  // }
  //
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  // void initController() {
  //   controller = BottomSheet.createAnimationController(this);
  //   controller.duration = const Duration(milliseconds: 500);
  //   controller.reverseDuration = const Duration(milliseconds: 500);
  // }

  @override
  Widget build(BuildContext context) {
    return photoLink != null
        ? !canOpen
            ? image()
            : GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    builder: (context) => OpenImage(link: photoLink),
                    isScrollControlled: true,
                    useRootNavigator: true,
                    context: context,
                   // transitionAnimationController: controller,
                  );
                      //.whenComplete(() => initController());
                },
                child: image(),
              )
        : const Icon(Icons.image_not_supported_outlined);
  }

  ExtendedImage image() {
    return photoLink!.contains('.png') ||
           photoLink!.contains('.jpeg')
        ? ExtendedImage.asset(photoLink!,
            fit: BoxFit.cover,
            enableSlideOutPage: true,
            filterQuality: FilterQuality.high)
        : ExtendedImage.network(
            photoLink!,
            fit: BoxFit.cover,
            cache: true,
            enableSlideOutPage: true,
            filterQuality: FilterQuality.high,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return spinkit;
                case LoadState.completed:
                  return null;
                case LoadState.failed:
                  return GestureDetector(
                    child: const Center(
                      child: Text("Reload"),
                    ),
                    onTap: () {
                      state.reLoadImage();
                    },
                  );
              }
            },
          );
  }
}
