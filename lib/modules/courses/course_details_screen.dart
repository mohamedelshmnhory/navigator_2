import 'package:auto_route/annotations.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/course_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String courseId;
  const CourseDetailsScreen({Key? key, @PathParam() required this.courseId})
      : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isFav = false;
//   Widget html = Html(
//     style: {
//       // tables will have the below background color
//       "table": Style(
//         backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
//       ),
//       // some other granular customizations are also possible
//       "tr": Style(
//         border: const Border(bottom: BorderSide(color: Colors.grey)),
//       ),
//       "th": Style(
//         padding: const EdgeInsets.all(6),
//         backgroundColor: Colors.grey,
//       ),
//       "td": Style(
//         padding: const EdgeInsets.all(6),
//         alignment: Alignment.topLeft,
//       ),
//       // text that renders h1 elements will be red
//       "h1": Style(color: Colors.red),
//       "ol": Style(color: Colors.red),
//       "li": Style(color: Colors.green),
//     },
//     data: """
// <ol><li><span style="font-size: 13.3.3px;color:red">s a as v ashd d sadl sadlkj asl dlaskj dlaks dlkjasjldk laskjd lkasjd laskjd</span><span style="font-size: 13.3px;">s a as&nbsp;</span><span style="font-size: 13.3px;">s a as&nbsp;&nbsp;</span><span style="font-size: 13.3px;">s a as&nbsp;</span><span style="font-size: 13.3px;">s a as&nbsp;</span><span style="font-family: &quot;Courier New&quot;;"></span></li><li><span style="font-family: &quot;Courier New&quot;;">sad sa sa</span></li><li><span style="font-family: &quot;Courier New&quot;;"><br></span></li><li><span style="font-family: &quot;Courier New&quot;;">sa</span></li><li><span style="font-family: &quot;Courier New&quot;;">&nbsp;sas ds&nbsp;<br></span><br></li></ol>""",
//   );
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //   appBar: buildAppBar(context, 'برنامج العناية بالبشرة'),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'برنامج العناية بالبشرة',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
                CourseHeader(image: bannerImages[0]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultButton(
                          width: 170,
                          height: 35,
                          function: () {},
                          text: 'أحجز الآن',
                          textSize: 14,
                          radius: 5,
                          background: mainColor,
                          textColor: Colors.white),
                      TextButton.icon(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent)),
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: mainColor,
                        ),
                        label: AnimatedCrossFade(
                          firstCurve: Curves.easeOut,
                          sizeCurve: Curves.easeIn,
                          secondCurve: Curves.easeIn,
                          crossFadeState: isFav
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                          secondChild: const Text(''),
                          firstChild: Text(
                            'أضف إلي المفضلة',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // html,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'محاور دورة التجميل للسيدات',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        'الجلد وطبقاته ووظائفها المختلفة –  انواع البشرة وتشخيصها – اجراءات السلامة  –  التدليك ( المساج ) –  ازالة البثور والكتل الدهنية –  التقشير والقناع تفتيح البشرة –  الحالات التي تطرأ على البشرة',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 12),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 5),
                      const LineWithMark(
                          text: 'مدة دورة العناية بالبشرة : مكثقة لمدة 3 شهور'),
                      const SizedBox(height: 5),
                      const LineWithMark(
                        text:
                            'الفئة المستهدفة لـ دورة العناية بالبشرة : الطالبات من مختلف الاعمار من 16 عام فما فوق',
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'اهداف دورة العناية بالبشرة ان تعرف المتدربة',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: courseGoals.length,
                          itemBuilder: (context, i) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (i + 1).toString() + ' ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Flexible(
                                    child: Text(
                                      courseGoals[i],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ],
                              )),
                      const SizedBox(height: 5),
                      Text(
                        'مزايا دوراتنا',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: courseGoals.length,
                          itemBuilder: (context, i) =>
                              LineWithMark(text: courseGoals[i])),
                      const SizedBox(height: 10),
                      defaultButton(
                          width: 170,
                          height: 35,
                          function: () {},
                          text: 'أحجز الآن',
                          textSize: 14,
                          radius: 5,
                          background: mainColor,
                          textColor: Colors.white),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
