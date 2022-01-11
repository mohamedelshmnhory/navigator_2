import 'package:beautyapp/modules/courses/course_details_screen.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/widgets/course_list_item.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


class FavouritesListScreen extends StatefulWidget {
  const FavouritesListScreen({Key? key}) : super(key: key);

  @override
  _FavouritesListScreenState createState() => _FavouritesListScreenState();
}

class _FavouritesListScreenState extends State<FavouritesListScreen> {
  @override
  Widget build(BuildContext context) {
    return ShouldLogin(child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, i) => GestureDetector(
            onTap: () {
             // context.router.push(CourseDetailsScreenRoute(courseId: 'courseId'));
            },
            child: CourseListItem(image: bannerImages[0]))),);
  }
}
