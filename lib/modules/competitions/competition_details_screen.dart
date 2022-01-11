import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:flutter/material.dart';

class CompetitionDetailsScreen extends StatelessWidget {
  final String title;
  const CompetitionDetailsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: buildAppBar(context, title),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const PhotoWidget(
                            photoLink:
                                'https://images.unsplash.com/photo-1567345492986-12e7f1dead72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            canOpen: false),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('أفضل مصممة أزياء',
                            style: Theme.of(context).textTheme.headline2),
                        const Text('مسابقة أفضل مصممة أزياء علي العالم '),
                        const Text('مسابقة أفضل مصممة أزياء علي العالم '),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'يعني أيه براند ؟',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  'البراند أو صناعة الهوية هي عملية تسويقية معقدة جدا الهدفمنها هو صناعة شخصية وهوية للمنتج اللي انت بتقدمه كلام مجعلص مش كده نبسطها شوية ،عارف لما بيكون ليك صديق انت عارفه من زمان لدرجة أنك بمجرد ما بتسمع صوته في التليفون او في الشارع بتعرفه أو مثلا شفته ماشي من بعيد هتتعرف عليه و أحاينالدرجة أنك ممكن أحيانا تعرفة من ريحه البرفان الخاص بيه أهو ده بقي البراند زي كده بمعني انك لو شفت كانزاية لونها أحمر وأزرق من غير لوجو هتعرف أنها بيبسي أو لو شفت علامه صح علي تي تيشرت هتعرف أنها نايك  أو علامه حرف M علي محل لونه أصفر في أحمر هتعرف أنه ماكدونالدز ',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 15),
                defaultButton(
                    width: 150,
                    height: 30,
                    function: () {},
                    text: 'للمزيد والإشتراك',
                    textSize: 14,
                    radius: 5,
                    background: mainColor,
                    textColor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
