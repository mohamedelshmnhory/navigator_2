import 'package:beautyapp/shared/components/image_paths.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'photo_widget.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          height: 200,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: mainColor, width: 1),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(.1, .1), blurRadius: 5, spreadRadius: .1)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 115,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(9),
                          topLeft: Radius.circular(9))),
                  child: PhotoWidget(photoLink: image, canOpen: false)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'السعر',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              '100 SR',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black, fontSize: 13),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '4.6',
                                  style: Theme.of(context).textTheme.headline3,
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
                                    ignoreGestures: true,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
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
                              ],
                            ),
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
                                          getAssetImage(ImagePathName.clock))),
                                      Text(
                                        '20',
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
                                          getAssetImage(ImagePathName.book))),
                                      Text(
                                        '100',
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
                                          getAssetImage(ImagePathName.sand))),
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
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: primary)),
        ),
      ],
    );
  }

  VerticalDivider get buildVerticalDivider {
    return const VerticalDivider(
      color: mainColor,
      thickness: 1.5,
      indent: 5,
      endIndent: 5,
    );
  }
}
