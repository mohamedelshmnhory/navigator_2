import 'package:beautyapp/shared/components/image_paths.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:beautyapp/widgets/trainer_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const internetErrorMsg = 'خطأ في الاتصال';

const emptyError = '\u26A0';

String userToken = '';

const completeFields = 'اكمل الحقول المطلوبة';

void launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

late final GlobalKey<NavigatorState> navState ;

const List<String> bannerImages = [
  'assets/temp/123.png',
  'https://images.unsplash.com/photo-1589210554837-d9d2ea4906a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
];

const List<String> offers = ['assets/temp/9090.png'];


final List<Trainer> trainers = [
  Trainer(
    image: 'assets/temp/Mask Group 10.png',
    jobTitle: 'خبير التجيمل',
    rate: '73.243',
    name: 'أحمد محمد',
    numOfCourses: '70',
  ),
  Trainer(
    image: 'assets/temp/Mask Group 12.png',
    jobTitle: 'خبير التجيمل',
    rate: '73.243',
    name: 'أحمد محمد',
    numOfCourses: '70',
  ),
  Trainer(
    image: 'assets/temp/Mask Group 10.png',
    jobTitle: 'خبير التجيمل',
    rate: '73.243',
    name: 'أحمد محمد',
    numOfCourses: '70',
  ),
  Trainer(
    image: 'assets/temp/Mask Group 12.png',
    jobTitle: 'خبير التجيمل',
    rate: '73.243',
    name: 'أحمد محمد',
    numOfCourses: '70',
  ),
];


final List<Category> students = [
  Category(
    image:
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=761&q=80',
    name: 'سالي',
  ),
  Category(
    image:
        'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    name: 'نوف',
  ),
  Category(
    image:
        'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    name: 'ملك',
  ),
  Category(
    image:
        'https://images.unsplash.com/photo-1598013924228-f336656b163c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',
    name: 'نوف',
  ),
];


class Social {
  final String link;
  final String icon;
  Social({required this.link, required this.icon});
}

final List<Social> socialIcons = [
  Social(
      link: 'https://www.facebook.com',
      icon: getAssetImage(ImagePathName.facebook)),
  Social(
      link: 'https://www.snapchat.com',
      icon: getAssetImage(ImagePathName.snapchat)),
  Social(
      link: 'https://www.instagram.com',
      icon: getAssetImage(ImagePathName.insta)),
  Social(
      link: 'https://www.youtube.com',
      icon: getAssetImage(ImagePathName.youtube)),
  Social(link: 'mohamedelshmnhory@icloud.com', icon: getAssetImage(ImagePathName.email)),
  Social(link: 'link', icon: getAssetImage(ImagePathName.google)),
  Social(
      link: 'https://wa.me/+201018064080',
      icon: getAssetImage(ImagePathName.whatsapp)),
];