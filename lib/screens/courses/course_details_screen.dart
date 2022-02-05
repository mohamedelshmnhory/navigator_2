import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/components/image_paths.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'course_reservation.dart';

class CourseDetailsScreen extends StatefulWidget {
  final int? id;

  const CourseDetailsScreen({Key? key, @PathParam() this.id}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late LayoutCubit layoutCubit;
  final ScrollController scrollController = ScrollController();
  // final _paymentItems = [
  //   const PaymentItem(
  //     label: 'Total',
  //     amount: '99.99',
  //     status: PaymentItemStatus.final_price,
  //   )
  // ];

  @override
  void initState() {
    final int id = context.router.current.pathParams.getInt('id', 1);
    layoutCubit = LayoutCubit.get(context)..getCourse(id: widget.id ?? id);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  //
  // void onGooglePayResult( paymentResult) {
  //   // Send the resulting Google Pay token to your server or PSP
  //  print( paymentResult.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is CourseErrorState,
      buildWhen: (context, state) => state is CourseSuccessState,
      listener: (context, state) {
        if (state is CourseErrorState) {
          internetAlert(() {
            layoutCubit.getCourse(id: widget.id!);
          });
        }
      },
      builder: (context, state) {
        return state is CourseLoadingState
            ? spinkit
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  //   appBar: buildAppBar(context, 'برنامج العناية بالبشرة'),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            layoutCubit.courseModel!.data!.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black),
                          ),
                          // CourseHeader(course: layoutCubit.courseModel!.data!),
                          Container(
                              // margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                              height: 150,
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: PhotoWidget(
                                  photoLink:
                                      layoutCubit.courseModel!.data!.image,
                                  canOpen: false)),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: RatingBar.builder(
                                              initialRating: 4.5,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ignoreGestures: true,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemSize: 15,
                                              onRatingUpdate: (v) {
                                                // CustomerCubit.get(context).rate(
                                                //     v, 'CartItem', widget.product.id);
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            '4.6',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'السعر ' +
                                            layoutCubit.courseModel!.data!.price
                                                .toString() +
                                            ' ريال',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                                color: Colors.black,
                                                fontSize: 13),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 2),
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ImageIcon(AssetImage(
                                                    getAssetImage(
                                                        ImagePathName.clock))),
                                                Text(
                                                  layoutCubit.courseModel!.data!
                                                      .duration
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                              ],
                                            ),
                                            buildVerticalDivider,
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ImageIcon(AssetImage(
                                                    getAssetImage(
                                                        ImagePathName.book))),
                                                Text(
                                                  layoutCubit.courseModel!.data!
                                                      .lectures
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                              ],
                                            ),
                                            buildVerticalDivider,
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ImageIcon(AssetImage(
                                                    getAssetImage(
                                                        ImagePathName.sand))),
                                                Text(
                                                  '3 أسابيع',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultButton(
                                    width: 170,
                                    height: 35,
                                    function: () => scrollController.animateTo(
                                        scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn),
                                    text: 'أحجز الآن',
                                    textSize: 14,
                                    radius: 5,
                                    background: mainColor,
                                    textColor: Colors.white),
                                BlocConsumer<LayoutCubit, LayoutStates>(
                                  listener: (context, state) {
                                    if (state is FavouriteErrorState) {
                                      setState(() {
                                        layoutCubit.courseModel!.data!.is_fav =
                                            !layoutCubit
                                                .courseModel!.data!.is_fav!;
                                      });
                                    }
                                  },
                                  builder: (context, state) {
                                    return TextButton.icon(
                                      style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.transparent)),
                                      onPressed: () {
                                        toggleFav(context);
                                      },
                                      icon: Icon(
                                        layoutCubit.courseModel!.data!.is_fav!
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: mainColor,
                                      ),
                                      label: AnimatedCrossFade(
                                        firstCurve: Curves.easeOut,
                                        sizeCurve: Curves.easeIn,
                                        secondCurve: Curves.easeIn,
                                        crossFadeState: layoutCubit
                                                .courseModel!.data!.is_fav!
                                            ? CrossFadeState.showSecond
                                            : CrossFadeState.showFirst,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        secondChild: const Text(''),
                                        firstChild: Text(
                                          'أضف إلي المفضلة',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(fontSize: 14),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          // GooglePayButton(
                          //   paymentConfigurationAsset:
                          //       'payment/sample_payment_configuration.json',
                          //   height: 50,
                          //   width: 100,
                          //   paymentItems: _paymentItems,
                          //   style: GooglePayButtonStyle.black,
                          //   type: GooglePayButtonType.pay,
                          //   onPaymentResult: onGooglePayResult,
                          // ),
                          Html(
                              data: layoutCubit.courseModel!.data!.description),
                          Html(data: layoutCubit.courseModel!.data!.list),
                          Html(
                              data: layoutCubit
                                  .courseModel!.data!.fullDescription),
                          CourseReservation(
                            categoryId: layoutCubit
                                .courseModel!.data!.categories_id!
                                .toInt(),
                            courseId:
                                layoutCubit.courseModel!.data!.id!.toInt(),
                          ),
                          const SizedBox(height: 10),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 15.0),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'محاور دورة التجميل للسيدات',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .headline5!
                          //             .copyWith(fontSize: 16),
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         textDirection: TextDirection.rtl,
                          //       ),
                          //       Text(
                          //         'الجلد وطبقاته ووظائفها المختلفة –  انواع البشرة وتشخيصها – اجراءات السلامة  –  التدليك ( المساج ) –  ازالة البثور والكتل الدهنية –  التقشير والقناع تفتيح البشرة –  الحالات التي تطرأ على البشرة',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .headline3!
                          //             .copyWith(
                          //                 fontWeight: FontWeight.normal,
                          //                 fontSize: 12),
                          //         textDirection: TextDirection.rtl,
                          //       ),
                          //       const SizedBox(height: 5),
                          //       const LineWithMark(
                          //           text:
                          //               'مدة دورة العناية بالبشرة : مكثقة لمدة 3 شهور'),
                          //       const SizedBox(height: 5),
                          //       const LineWithMark(
                          //         text:
                          //             'الفئة المستهدفة لـ دورة العناية بالبشرة : الطالبات من مختلف الاعمار من 16 عام فما فوق',
                          //       ),
                          //       const SizedBox(height: 5),
                          //       Text(
                          //         'اهداف دورة العناية بالبشرة ان تعرف المتدربة',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .headline5!
                          //             .copyWith(fontSize: 16),
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         textDirection: TextDirection.rtl,
                          //       ),
                          //       ListView.builder(
                          //           shrinkWrap: true,
                          //           physics:
                          //               const NeverScrollableScrollPhysics(),
                          //           itemCount: courseGoals.length,
                          //           itemBuilder: (context, i) => Row(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(
                          //                     (i + 1).toString() + ' ',
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .headline3!
                          //                         .copyWith(
                          //                             fontWeight:
                          //                                 FontWeight.bold,
                          //                             fontSize: 12),
                          //                     textDirection: TextDirection.rtl,
                          //                   ),
                          //                   Flexible(
                          //                     child: Text(
                          //                       courseGoals[i],
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .headline3!
                          //                           .copyWith(
                          //                               fontWeight:
                          //                                   FontWeight.normal,
                          //                               fontSize: 12),
                          //                       textDirection:
                          //                           TextDirection.rtl,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               )),
                          //       const SizedBox(height: 5),
                          //       Text(
                          //         'مزايا دوراتنا',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .headline5!
                          //             .copyWith(fontSize: 16),
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         textDirection: TextDirection.rtl,
                          //       ),
                          //       ListView.builder(
                          //           shrinkWrap: true,
                          //           physics:
                          //               const NeverScrollableScrollPhysics(),
                          //           itemCount: courseGoals.length,
                          //           itemBuilder: (context, i) =>
                          //               LineWithMark(text: courseGoals[i])),
                          //       const SizedBox(height: 10),
                          //       defaultButton(
                          //           width: 170,
                          //           height: 35,
                          //           function: () {},
                          //           text: 'أحجز الآن',
                          //           textSize: 14,
                          //           radius: 5,
                          //           background: mainColor,
                          //           textColor: Colors.white),
                          //       const SizedBox(height: 10),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  void toggleFav(BuildContext context) {
    if (userToken != '') {
      setState(() {
        layoutCubit.courseModel!.data!.is_fav =
            !layoutCubit.courseModel!.data!.is_fav!;
      });
      LayoutCubit.get(context)
          .toggleFav(course: layoutCubit.courseModel!.data!);
    } else {
      showLoginDialog(context);
    }
  }
}

class LineWithMark extends StatelessWidget {
  final String text;
  const LineWithMark({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '○' ' ',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
          textDirection: TextDirection.rtl,
        ),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }
}
