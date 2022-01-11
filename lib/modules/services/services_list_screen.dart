import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        itemCount: services.length,
        itemBuilder: (context, i) => InkWell(
            onTap: () {
              context.router.push(ServiceDetailsScreen(service: services[i]));
            },
            child: ServiceItem(service: services[i])));
  }
}
