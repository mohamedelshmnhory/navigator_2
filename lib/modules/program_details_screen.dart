import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:flutter/material.dart';

class ProgramDetailsScreen extends StatefulWidget {
  const ProgramDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(context, 'برنامج العناية بالبشرة'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
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
                      border: Border.all(color: blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const PhotoWidget(photoLink: 'https://images.unsplash.com/photo-1487412947147-5cebf100ffc2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80', canOpen: false),
                  ),
                ),
                const SizedBox(height: 3),
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
                          // width: 170,
                          height: 35,
                          function: () {},
                          text: 'التسجيل',
                          textSize: 14,
                          radius: 5,
                          background: mainColor,
                          textColor: Colors.white),
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
