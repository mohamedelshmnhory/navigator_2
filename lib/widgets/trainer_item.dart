import 'package:flutter/material.dart';

class Trainer {
  final String image;
  final String name;
  final String rate;
  final String jobTitle;
  final String numOfCourses;
  Trainer({
    required this.image,
    required this.name,
    required this.rate,
    required this.jobTitle,
    required this.numOfCourses,
  });
}
class TrainerItem extends StatelessWidget {
  final Trainer trainer;
  const TrainerItem({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      // decoration: BoxDecoration(
      //   // boxShadow: [
      //   //   BoxShadow(
      //   //     color: Colors.grey.withOpacity(0.5),
      //   //     spreadRadius: 4,
      //   //     blurRadius: 4,
      //   //     offset: const Offset(0, 0), // changes position of shadow
      //   //   ),
      //   // ],
      //   borderRadius: BorderRadius.circular(10),
      // ),
      height: 110,
      width: 200,
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: CircleAvatar(
                  radius: 50, backgroundImage: AssetImage(trainer.image))),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          trainer.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          trainer.jobTitle,
                          style: Theme.of(context).textTheme.headline3,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,

                        ),
                      ),
                      // Flexible(
                      //   child: Text(
                      //     trainer.rate,
                      //     style: Theme.of(context).textTheme.headline3,
                      //     overflow: TextOverflow.ellipsis,
                      //     maxLines: 1,
                      //   ),
                      // ),
                      Flexible(
                        child: Text(
                          trainer.numOfCourses + ' برنامج تدريبي',
                          style: Theme.of(context).textTheme.headline3!.copyWith(height: 1),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}