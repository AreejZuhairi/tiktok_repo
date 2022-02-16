import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok_tut/models/video.dart';

class HomeSlideBar extends StatefulWidget {
  const HomeSlideBar({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  State<HomeSlideBar> createState() => _HomeSlideBarState();
}

class _HomeSlideBarState extends State<HomeSlideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: Colors.white, fontSize: 13);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.video.postedBy.profileImageUrl),
          _sideBarItem('heart', widget.video.likes, style),
          _sideBarItem('comment', widget.video.comments, style),
          _sideBarItem('share', 'Share', style),
          AnimatedBuilder(
              animation: _animationController,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset("assets/disc.svg"),
                  ),
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/250?image=9"),
                  )
                ],
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: 2 * pi * _animationController.value,
                  child: child,
                );
              })
        ],
      ),
    );
  }

  _sideBarItem(String iconName, String label, TextStyle style) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/$iconName.svg',
          height: 20,
          width: 20,
          color: Colors.white,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          label,
          style: style,
        )
      ],
    );
  }

  _profileImageButton(String image) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(image))),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ))
      ],
    );
  }
}
