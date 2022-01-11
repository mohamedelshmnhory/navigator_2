import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'photo_widget.dart';
import 'package:auto_route/auto_route.dart';

class MyCourseListItem extends StatefulWidget {
  const MyCourseListItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  State<MyCourseListItem> createState() => _MyCourseListItemState();
}

class _MyCourseListItemState extends State<MyCourseListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: SizeConfig.screenWidth! * .9,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: mainColor, width: 1),
          boxShadow: const [
            BoxShadow(offset: Offset(.1, .1), blurRadius: 5, spreadRadius: .1)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        //alignment: Alignment.topLeft,
        children: [
          Container(
              // margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 200,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const PhotoWidget(
                  photoLink:
                      'https://images.unsplash.com/photo-1505944270255-72b8c68c6a70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                  canOpen: false)),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    Colors.transparent,
                    Colors.black54,
                    Colors.black
                  ])),
              // width: SizeConfig.screenWidth! * .95,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'برنامج العناية بالبشرة',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  defaultButton(
                    width: 130,
                    height: 35,
                    function: () {
                      context.router
                          .push(MyCourseDetailsScreen(courseId: "courseId"));
                    },
                    text: 'التفاصيل',
                    textSize: 14,
                    radius: 5,
                    background: Colors.white,
                    textColor: mainColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  VerticalDivider get buildVerticalDivider {
    return const VerticalDivider(
      color: Colors.white,
      width: 30,
      thickness: 1.5,
      indent: 10,
      endIndent: 10,
    );
  }
}
