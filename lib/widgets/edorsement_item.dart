
import 'package:flutter/material.dart';

class Endorsement {
  final String image;
  final String name;
  final String num;
  Endorsement({
    required this.image,
    required this.name,
    required this.num,
  });
}

class EndorsementItem extends StatelessWidget {
  final Endorsement endorsement;
  const EndorsementItem({
    Key? key,
    required this.endorsement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130,
        child: Image.asset(endorsement.image),
      ),
    );
  }
}