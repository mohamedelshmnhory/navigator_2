import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class TrainersListScreen extends StatefulWidget {
  const TrainersListScreen({Key? key}) : super(key: key);

  @override
  _TrainersListScreenState createState() => _TrainersListScreenState();
}

class _TrainersListScreenState extends State<TrainersListScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 100 / 125,
      children: List.generate(
        trainers.length,
        (index) => GestureDetector(
          onTap: () {
            context.pushRoute(TrainerDetailsScreen(category: students[index]));
          },
          child: CategoryItem(category: students[index], size: 100),
        ),
      ),
    );
  }
}
