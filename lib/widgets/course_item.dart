// import 'package:beautyapp/modules/courses/course_details_screen.dart';
// import 'package:beautyapp/shared/components/components.dart';
// import 'package:beautyapp/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// import 'photo_widget.dart';
//
// class CourseContainer extends StatelessWidget {
//   const CourseContainer({
//     Key? key,
//     required this.bannerImages,
//   }) : super(key: key);
//
//   final List<String> bannerImages;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         navigateTo(
//             context,
//             const CourseDetailsScreen(
//               courseId: '',
//             ));
//       },
//       child: Container(
//         // margin: const EdgeInsets.all(5),
//         clipBehavior: Clip.hardEdge,
//         decoration: BoxDecoration(
//             border: Border.all(color: mainColor, width: 1),
//             borderRadius: BorderRadius.circular(20)),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                   // height: 200,
//                   width: double.infinity,
//                   clipBehavior: Clip.hardEdge,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                           topLeft: Radius.circular(20))),
//                   child:
//                       PhotoWidget(photoLink: bannerImages[1], canOpen: false)),
//             ),
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Center(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           'برنامج العناية بالبشرة',
//                           style: Theme.of(context).textTheme.headline5,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           textDirection: TextDirection.rtl,
//                         ),
//                         Text(
//                           'في هذا البرنامج سوف تتعرفين علي أهمية المحافظة علي البشرة',
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline3!
//                               .copyWith(height: 1.5),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           textDirection: TextDirection.rtl,
//                         ),
//                         // IntrinsicHeight(
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         //     children: [
//                         //       Column(
//                         //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         //         children: [
//                         //           Text(
//                         //             'الساعات',
//                         //             style: Theme.of(context).textTheme.headline3,
//                         //           ),
//                         //           ImageIcon(AssetImage(
//                         //               getAssetImage(ImagePathName.clock))),
//                         //           Text(
//                         //             '20',
//                         //             style: Theme.of(context).textTheme.headline3,
//                         //           ),
//                         //         ],
//                         //       ),
//                         //       const VerticalDivider(color: mainColor, width: 1.5),
//                         //       Column(
//                         //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         //         children: [
//                         //           Text(
//                         //             'الدروس',
//                         //             style: Theme.of(context).textTheme.headline3,
//                         //           ),
//                         //           ImageIcon(AssetImage(
//                         //               getAssetImage(ImagePathName.book))),
//                         //           Text(
//                         //             '100',
//                         //             style: Theme.of(context).textTheme.headline3,
//                         //           ),
//                         //         ],
//                         //       ),
//                         //       const VerticalDivider(color: mainColor, width: 1.5),
//                         //       Column(
//                         //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         //         children: [
//                         //           Text(
//                         //             'المدة',
//                         //             style: Theme.of(context).textTheme.headline3,
//                         //           ),
//                         //           ImageIcon(AssetImage(
//                         //               getAssetImage(ImagePathName.sand))),
//                         //           Text(
//                         //             '3 أسابيع',
//                         //             style: Theme.of(context).textTheme.headline3,
//                         //           ),
//                         //         ],
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         // const SizedBox(height: 5),
//                         // const Spacer(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               '229.99 S.R',
//                               style: Theme.of(context).textTheme.headline3,
//                             ),
//                             Row(
//                               children: [
//                                 Directionality(
//                                   textDirection: TextDirection.ltr,
//                                   child: RatingBar.builder(
//                                     initialRating: 4.5,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     allowHalfRating: true,
//                                     itemCount: 5,
//                                     ignoreGestures: true,
//                                     itemPadding: const EdgeInsets.symmetric(
//                                         horizontal: 1.0),
//                                     itemBuilder: (context, _) => const Icon(
//                                       Icons.star,
//                                       color: Colors.amber,
//                                     ),
//                                     itemSize: 15,
//                                     onRatingUpdate: (v) {
//                                       // CustomerCubit.get(context).rate(
//                                       //     v, 'CartItem', widget.product.id);
//                                     },
//                                   ),
//                                 ),
//                                 const SizedBox(width: 3),
//                                 Text(
//                                   '4.6',
//                                   style: Theme.of(context).textTheme.headline3,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 5),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
