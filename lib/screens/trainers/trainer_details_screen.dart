import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:flutter/material.dart';

class TrainerDetailsScreen extends StatelessWidget {
  final Category category;
  const TrainerDetailsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: buildAppBar(context, 'صفحة المدرب'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 130,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 1,
                          //     offset: const Offset(0, 0), // changes position of shadow
                          //   ),
                          // ],
                          // image: DecorationImage(
                          //     image: AssetImage(category.image), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: PhotoWidget(
                            photoLink: category.image, canOpen: false),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.name??'',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  'خبيرة في أدوات التجميل',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () => launchURL(socialIcons[1].link),
                          child: Image.asset(socialIcons[1].icon,
                              color: mainColor)),
                      GestureDetector(
                          onTap: () => launchURL(socialIcons[2].link),
                          child: Image.asset(socialIcons[2].icon,
                              color: mainColor)),
                    ],
                  ),
                ),
                Text(
                  'نبذة مختصرة عن المدرب',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  'يتمتع معالجو التجميل المؤهلون بعدد لا يحصى من الفرص. بصرف النظر عن كونها مهنة مجزية من الناحية المالية ،هناك رضا شخصي في مساعدة الآخرين على الشعور والمظهربشكل أفضل. يمكنك أيضًا توسيع الشبكة الاجتماعية عندماتقابل عملاء من مختلف الصناعات ومناحي الحياة.',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
