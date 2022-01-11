import 'package:beautyapp/shared/components/image_paths.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:beautyapp/widgets/edorsement_item.dart';
import 'package:beautyapp/widgets/service_item.dart';
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

const List<String> courseGoals = [
  'تشخيص ومعالجة البشرة الطبيعية',
  'تشخيص ومعالجة البشرة الجافة',
  'تنفيذ اجراءات السلامة',
  'تشخيص ومعالجة البشرة المركبة “المزدوجة',
  'الحالات التي تطرأ على البشرة',
];

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

final List<Category> categories = [
  Category(
    image: 'assets/temp/1.jpeg',
    name: 'تصفيف الشعر',
  ),
  Category(
    image: 'assets/temp/2.jpeg',
    name: 'العلاج التجميلي',
  ),
  Category(
    image: 'assets/temp/3.jpeg',
    name: 'فن المكياج',
  ),
  Category(
    image: 'assets/temp/4.jpeg',
    name: 'العناية بالبشرة',
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

final List<Service> services = [
  Service(
    image: 'assets/temp/01.png',
    name: 'صناعة البراندات',
  ),
  Service(
    image: 'assets/temp/02.jpeg',
    name: 'خبيرات التجميل',
  ),
  Service(
    image: 'assets/temp/04.jpeg',
    name: 'صالونات التجميل',
  ),
  Service(
    image: 'assets/temp/03.jpeg',
    name: 'خدمة المتاجر',
  ),
];

final List<Endorsement> endorsements = [
  Endorsement(
    image: 'assets/temp/Mask Group 14.png',
    name: 'المركز الدولي',
    num: '45758',
  ),
  Endorsement(
    image: 'assets/temp/Mask Group 14.png',
    name: 'المركز الدولي',
    num: '45758',
  ),
  Endorsement(
    image: 'assets/temp/Mask Group 15.png',
    name: 'المركز الدولي',
    num: '45758',
  ),
  Endorsement(
    image: 'assets/temp/Mask Group 15.png',
    name: 'المركز الدولي',
    num: '45758',
  ),
];

class Goal {
  final String? title;
  final String? text;
  Goal({this.title, this.text});
}

final List<Goal> goals = [
  Goal(
    title: 'نحن الأفضل',
    text:
        'نحن نفخر بانفسنا علي المعايير العالية لتقديم  الدورات يتم تشغيل جميع الدورات مع مجموعات صغيرة من الطلب لكل مدرب',
  ),
  Goal(
    title: 'أفضل المدربين والخبراء',
    text:
        'نحن نفخر بانفسنا علي المعايير العالية لتقديم  الدورات يتم تشغيل جميع الدورات مع مجموعات صغيرة من الطلب لكل مدرب',
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
//  const List<String> categories = [
//   'التجميل',
//   'العناية بالبشرة',
//   'الشعر والصيحات',
//   'صناعة العطور',
//   'صناعة العطور',
// ];
