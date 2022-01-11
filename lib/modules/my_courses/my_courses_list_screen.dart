import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/widgets/my_course_list_item.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';

class MyCoursesListScreen extends StatefulWidget {
  const MyCoursesListScreen({Key? key}) : super(key: key);

  @override
  _MyCoursesListScreenState createState() => _MyCoursesListScreenState();
}

class _MyCoursesListScreenState extends State<MyCoursesListScreen> {
  @override
  Widget build(BuildContext context) {
    return ShouldLogin(child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, i) => MyCourseListItem(image: bannerImages[0]),
    ),);
  }
}
