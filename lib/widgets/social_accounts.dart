import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: socialIcons.length,
        itemBuilder: (context, i) => GestureDetector(
            onTap: () => launchURL(socialIcons[i].link),
            child: Image.asset(socialIcons[i].icon,color: mainColor)),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 7),
      ),
    );
  }


}
