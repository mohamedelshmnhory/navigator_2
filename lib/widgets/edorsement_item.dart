import 'package:flutter_svg/flutter_svg.dart';
import 'package:beautyapp/models/certifications_model.dart';
import 'package:flutter/material.dart';



class CertificationItem extends StatelessWidget {
  final Certification certification;
  const CertificationItem({
    Key? key,
    required this.certification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      'https://upload.wikimedia.org/wikipedia/commons/1/17/Yin_yang.svg',
      semanticsLabel: 'cert',
      placeholderBuilder: (BuildContext context) => const Center(child: CircularProgressIndicator()),
    );
  }
}