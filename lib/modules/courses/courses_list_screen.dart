import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/widgets/course_list_item.dart';
import 'package:flutter/material.dart';

class CoursesListScreen extends StatefulWidget {
  final String title;
  const CoursesListScreen({Key? key, @PathParam() required this.title})
      : super(key: key);
  @override
  _CoursesListScreenState createState() => _CoursesListScreenState();
}

class _CoursesListScreenState extends State<CoursesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: bannerImages.length ,
                itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      context.router
                          .push(CourseDetailsScreen(courseId: 'courseId'));
                    },
                    child: CourseListItem(image: bannerImages[i]))),
          ),
        ],
      ),
    );
  }
}
