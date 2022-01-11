import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/widgets/edorsement_item.dart';
import 'package:flutter/material.dart';

class EndorsementsScreen extends StatelessWidget {
  const EndorsementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: List.generate(
        endorsements.length,
        (index) => EndorsementItem(endorsement: endorsements[index]),
      ),
    );
  }
}
