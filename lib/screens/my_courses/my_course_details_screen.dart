import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:flutter/material.dart';

class MyCourseDetailsScreen extends StatefulWidget {
  const MyCourseDetailsScreen({Key? key, required String courseId})
      : super(key: key);

  @override
  _MyCourseDetailsScreenState createState() => _MyCourseDetailsScreenState();
}

class _MyCourseDetailsScreenState extends State<MyCourseDetailsScreen> {
  int currentIndex = 0;
  late List<Widget> bottomScreens = [
    More(onPress: (i) {
      setState(() {
        currentIndex = i;
      });
    }),
    const AboutCourse(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: buildAppBar(context, 'برنامج العناية بالبشرة'),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                'برنامج العناية بالبشرة',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black),
              ),
              Container(
                height: 200,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  shape: BoxShape.rectangle,
                ),
                child: const PhotoWidget(
                    photoLink: 'assets/temp/Group 19.png', canOpen: false),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth! * .4,
                              child: TabBar(
                                onTap: (i) {
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                },
                                physics: const NeverScrollableScrollPhysics(),
                                unselectedLabelColor: Colors.black,
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                indicatorColor: mainColor,
                                labelColor: Colors.black,
                                labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairo'),
                                // indicator:
                                // BoxDecoration(shape: BoxShape.rectangle, color: ),
                                tabs: const [
                                  Tab(
                                    text: 'الدروس',
                                    height: 30,
                                  ),
                                  Tab(
                                    text: 'المزيد',
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset('assets/images/pdf.png', height: 40),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ListView.separated(
                                  padding: const EdgeInsets.all(10),
                                  itemBuilder: (context, i) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'الدرس' ' ' + (i + 1).toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: Text(
                                              'تعريف عن البرنامج',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: Text(
                                              'الأدوات المستخدمة',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                  separatorBuilder: (context, i) =>
                                      const SizedBox(height: 5),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 6),
                              bottomScreens[currentIndex],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutCourse extends StatelessWidget {
  const AboutCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'تعريف عن البرنامج',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'يتمتع معالجو التجميل المؤهلون بعدد لا يحصى من الفرص. بصرف النظر عن كونها مهنة مجزية من الناحية المالية ،هناك رضا شخصي في مساعدة الآخرين على الشعور والمظهر بشكل أفضل. يمكنك أيضًا توسيع الشبكة الاجتماعية عندماتقابل عملاء من مختلف الصناعات ومناحي الحياة.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class More extends StatelessWidget {
  const More({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowMoreButton(
              item: 'عن البرنامج',
              onTap: () {
                onPress(1);
              },
              icon: Icons.more_horiz),
          ShowMoreButton(
              item: 'ملاحظات',
              onTap: () {
                onPress(2);
              },
              icon: Icons.notes),
          ShowMoreButton(
              item: 'إضافة إلي المفضلة',
              onTap: () {
                onPress(3);
              },
              icon: Icons.star_border),
          ShowMoreButton(
              item: 'الإبلاغ عن مشكلة',
              onTap: () {
                onPress(4);
              },
              icon: Icons.bug_report),
          ShowMoreButton(
              item: 'مصادر البرنامج',
              onTap: () {
                onPress(5);
              },
              icon: Icons.layers_outlined),
        ],
      ),
    );
  }
}

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    Key? key,
    required this.item,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String item;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // if (userToken != '' || !token) {
        //   LayoutCubit.get(context).openCloseDrawer(context);
        onTap();
        // } else {
        //   showLoginDialog(context);
        // }
      },
      icon: Icon(
        icon,
        color: mainColor,
        size: 20,
      ),
      label: Text(
        item,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontSize: 12, color: Colors.black),
      ),
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)),
    );
  }
}
