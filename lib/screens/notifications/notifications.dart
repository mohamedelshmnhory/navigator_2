import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 7,
      itemBuilder: (context, i) => const NotificationTile(
          text: 'تم قبول الملف الشخصي للاشتراك في البرامج التدريبية '),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 12),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String text;
  const NotificationTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      // margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(.1, .2),
              blurRadius: 3,
              spreadRadius: .1,
              color: Colors.grey.withOpacity(.5))
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/Group 89.png',
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
