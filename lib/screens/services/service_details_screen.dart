import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:beautyapp/widgets/service_item.dart';
import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final Service service;
  const ServiceDetailsScreen({Key? key, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context, service.name),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                service.name,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                shape: BoxShape.rectangle,
              ),
              child: PhotoWidget(photoLink: service.image, canOpen: false),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      width: 170,
                      height: 40,
                      function: () {},
                      text: 'أحجز الآن',
                      textSize: 16,
                      radius: 5,
                      background: mainColor,
                      textColor: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
