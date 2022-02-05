import 'dart:async';

import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/debouncer.dart';
import 'package:beautyapp/widgets/course_list_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/widgets/empty_list_replacement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);
  late LayoutCubit layoutCubit;
  String lastInputValue = '';

  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is SearchErrorState,
      buildWhen: (context, state) =>
          state is SearchSuccessState || state is SearchLoadingState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: mainColor.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: defaultFormField(
                controller: searchController,
                boarderColor: mainColor.withOpacity(.5),
                inputAction: TextInputAction.search,
                type: TextInputType.text,
                direction: TextDirection.ltr,
                onSubmit: (String? value) {
                  if (value!.isNotEmpty) {
                    layoutCubit.getSearchCourses(title: value.trim());
                  }
                },
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return emptyError;
                  }
                },
                onChange: (String? value) {
                  if (lastInputValue != value && value!.isNotEmpty && value.length > 2) {
                    lastInputValue = value;
                    _debouncer.run(() =>
                        layoutCubit.getSearchCourses(title: value.trim()));
                  }
                  // if (value!.isNotEmpty) {
                  //   layoutCubit.getSearchCourses(title: value.trim());
                  // }
                },
                label: 'ما الذي تبحث عنه',
                prefix: Icons.search,
                suffix: searchController.value.text.isEmpty
                    ? null
                    : Icons.cancel_rounded,
                suffixPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    searchController.clear();
                  });
                },
              ),
            ),
            Expanded(
              child: searchController.value.text.isEmpty
                  ? Icon(
                      Icons.search,
                      color: mainColor.withOpacity(.2),
                      size: 200,
                    )
                  : state is SearchLoadingState
                      ? spinkit
                      : state is SearchSuccessState
                          ? state.coursesModel.data!.isEmpty
                              ? const EmptyListReplacement(
                                  text: 'لا يوجد نتائج')
                              : ListView.builder(
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(5),
                                  itemCount: state.coursesModel.data!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) => GestureDetector(
                                      onTap: () {
                                        int id = state.coursesModel.data![i].id!
                                            .toInt();
                                        context.router.push(
                                            CourseDetailsScreen(id: id));
                                      },
                                      child: CourseListItem(
                                        key: Key(state.coursesModel.data![i].id
                                            .toString()),
                                        course: state.coursesModel.data![i],
                                        isSearch: true,
                                      )))
                          : Icon(
                              Icons.search,
                              color: mainColor.withOpacity(.2),
                              size: 200,
                            ),
            ),
          ],
        );
      },
    );
  }
}
