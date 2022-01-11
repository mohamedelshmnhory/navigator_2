import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:flutter/material.dart';

class Category {
  final String? image;
  final String? name;

  Category({
    this.image,
    this.name,
  });
}

class CategoryItem extends StatelessWidget {
  final Category? category;
  final String? image;
  final String? text;
  final double size;
  const CategoryItem({
    Key? key,
    this.category,
    this.size = 140,
    this.image,
    this.text,
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
      height: size + 30,
      width: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size,
            width: size,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 1,
              //     offset: const Offset(0, 0), // changes position of shadow
              //   ),
              // ],
              // image: DecorationImage(
              //     image: AssetImage(category.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
            child: PhotoWidget(
                photoLink: category == null ? image : category!.image,
                canOpen: false),
          ),
          const SizedBox(height: 3),
          Flexible(
            child: Text(
              category == null ? text! : category!.name!,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: 14, color: mainColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
