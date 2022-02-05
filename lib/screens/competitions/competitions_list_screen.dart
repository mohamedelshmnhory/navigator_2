import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class CompetitionsListScreen extends StatelessWidget {
  final String title;
  const CompetitionsListScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context, title),
      body: Column(
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(15),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, i) => Row(
                children: [
                  Container(
                    height: 110,
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
                  Expanded(
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'أفضل مصممة أزياء',
                            style: Theme.of(context).textTheme.headline2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                          ),
                          const Text(
                            'مسابقة أفضل مصممة أزياء علي العالم مسابقة أفضل مصممة أزياء علي العالم',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 5),
                          defaultButton(
                              width: 120,
                              height: 25,
                              function: () => context.router.push(
                                  CompetitionDetailsScreen(
                                      title: 'أفضل مصممة أزياء')),
                              text: 'التفاصيل',
                              textSize: 10,
                              radius: 5,
                              background: mainColor,
                              textColor: Colors.white),
                        ],
                      ),

                  ),
                ],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}
