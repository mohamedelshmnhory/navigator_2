import 'package:beautyapp/models/services_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'photo_widget.dart';


class ServiceItem extends StatelessWidget {
  final Service service;

  const ServiceItem({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 4,
        //     blurRadius: 4,
        //     offset: const Offset(0, 0), // changes position of shadow
        //   ),
        // ],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 140,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 1,
              //     offset: const Offset(0, 0), // changes position of shadow
              //   ),
              // ],
              // image: DecorationImage(
              //     image: AssetImage(service.image!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
              child: PhotoWidget(photoLink: service.image, canOpen: false)),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            service.name!,
            style: const TextStyle(
                fontSize: 30,
                fontFamily: 'jozoor',
                color: CupertinoColors.white,
                fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
