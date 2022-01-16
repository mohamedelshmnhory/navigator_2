import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'badge.dart';

class NavigationIcon extends StatefulWidget {
  final LayoutCubit cubit;
  final int index;
  final String icon;
  final String filledIcon;
  final String? notification;

  const NavigationIcon({
    Key? key,
    required this.cubit,
    required this.index,
    required this.icon,
    required this.filledIcon,
    required this.navItems,
    this.notification,
  }) : super(key: key);

  final List navItems;

  @override
  State<NavigationIcon> createState() => _NavigationIconState();
}

class _NavigationIconState extends State<NavigationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: .85,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation.addListener(() => setState(() {}));
  }

  void movement() {
    animationController.forward().then((value) => animationController.reset());
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          movement();
          widget.cubit.changeBottom(widget.index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...[
              widget.notification != null
                  ? Badge(
                      color: Colors.red,
                      value: widget.notification ?? '0',
                      child: MyIcon(widget: widget, animation: animation))
                  : MyIcon(widget: widget, animation: animation),
            ],
            Visibility(
              visible: widget.cubit.tabsRouter.activeIndex == widget.index,
              child: Text(
                widget.navItems[widget.index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: widget.cubit.tabsRouter.activeIndex == widget.index
                        ? mainColor
                        : mainColor.withOpacity(.3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({
    Key? key,
    required this.widget,
    required this.animation,
  }) : super(key: key);

  final NavigationIcon widget;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ImageIcon(
        AssetImage(widget.cubit.tabsRouter.activeIndex == widget.index
            ? widget.filledIcon
            : widget.icon),
        // color: cubit.currentIndex == index
        //     ? mainColor
        //     : accent.withOpacity(.3),
        size: animation.value * 26,
        color: mainColor,
      ),
    );
  }
}
