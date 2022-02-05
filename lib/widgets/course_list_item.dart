import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/models/courses_model.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'photo_widget.dart';
import 'package:auto_route/auto_route.dart';

class CourseListItem extends StatefulWidget {
  const CourseListItem({
    Key? key,
    required this.course,
    this.isSearch = false,
  }) : super(key: key);

  final Course course;
  final bool isSearch;

  @override
  State<CourseListItem> createState() => _CourseListItemState();
}

class _CourseListItemState extends State<CourseListItem> {
  late final course = widget.course;
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
              child: PhotoWidget(photoLink: course.image, canOpen: false)),
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name!.trim(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white, fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(height: 3),
                        defaultButton(
                          width: 130,
                          height: 35,
                          function: () {
                            context.router.push(CourseDetailsScreen(
                              id: course.id!.toInt(),
                            ));
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '4.6',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(width: 3),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: RatingBar.builder(
                                initialRating: 4.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: false,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                unratedColor: Colors.white,
                                itemSize: 15,
                                onRatingUpdate: (v) {
                                  // CustomerCubit.get(context).rate(
                                  //     v, 'CartItem', widget.product.id);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    course.duration.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                              buildVerticalDivider,
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    course.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                              buildVerticalDivider,
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.hourglass_top_sharp,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '3 أسابيع',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!widget.isSearch)
            BlocConsumer<LayoutCubit, LayoutStates>(
              listener: (context, state) {
                if (state is FavouriteErrorState) {
                  setState(() {
                    course.is_fav = !course.is_fav!;
                  });
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      if (userToken != '') {
                        setState(() {
                          course.is_fav = !course.is_fav!;
                        });
                        LayoutCubit.get(context).toggleFav(course: course);
                      } else {
                        showLoginDialog(context);
                      }
                    },
                    child: course.is_fav!
                        ? Lottie.asset(
                            'assets/images/59461-heart-beat-pop-up.json',
                            height: 50,
                            repeat: false)
                        : const SizedBox(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.favorite_border, color: primary)),
                  ),
                );
              },
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
