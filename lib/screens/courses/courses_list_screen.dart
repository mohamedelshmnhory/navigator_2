import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/layout/layout.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/course_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesListScreen extends StatefulWidget {
  final int id;
  const CoursesListScreen({Key? key, @PathParam() required this.id})
      : super(key: key);
  @override
  _CoursesListScreenState createState() => _CoursesListScreenState();
}

class _CoursesListScreenState extends State<CoursesListScreen> {
  late LayoutCubit layoutCubit;
  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getCourses(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Text(
            layoutCubit.homeModel!.data!.Category!
                    .firstWhere((element) => element.id == widget.id)
                    .name ??
                '',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          Expanded(
            child: BlocConsumer<LayoutCubit, LayoutStates>(
              listenWhen: (context, state) => state is CoursesErrorState,
              buildWhen: (context, state) => state is CoursesSuccessState,
              listener: (context, state) {
                if (state is CoursesErrorState) {}
              },
              builder: (context, state) {
                return state is CoursesLoadingState
                    ? spinkit
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: layoutCubit.coursesModel!.data.length,
                        itemBuilder: (context, i) => GestureDetector(
                            onTap: () {
                              int id =
                                  layoutCubit.coursesModel!.data[i].id!.toInt();
                              context.router
                                  .push(CourseDetailsScreen(courseId: id));
                            },
                            child: CourseListItem(
                                course: layoutCubit.coursesModel!.data[i])));
              },
            ),
          ),
        ],
      ),
    );
  }
}
