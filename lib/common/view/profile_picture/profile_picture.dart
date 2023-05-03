import 'package:flutter/material.dart';
import 'package:wedding_back_office/common/view/profile_picture/avatar.dart';
import 'package:wedding_back_office/common/view/profile_picture/tooltip.dart';

class ProfilePicture extends StatelessWidget {
  final String name;

  // role is optional
  // it will be displayed under name
  final String? role;
  final double radius;
  final double fontsize;

  // tooltip is optional
  // if "true", the tooltip will appear when the user clicks on the image
  final bool tooltip;

  // random is optional
  // if "true", background color will be random
  final bool random;

  // count is optional
  // to limit how many prefix names are displayed.

  final int? count;
  // img is optional
  // if "not empty", the background color and initial name will change to image.

  final Color? color;

  final String? img;
  const ProfilePicture({
    Key? key,
    required this.name,
    required this.radius,
    required this.fontsize,
    this.role,
    this.tooltip = false,
    this.random = false,
    this.color,
    this.count,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check tooltip
    if (tooltip == true) {
      // if "true" return tooptip
      return MyTooltip(
        // when the user clicks on the profile picture, a message will appear
        // check if role is empty or not
        // if not add \n to create a break row
        message: role == '' || role == null ? name : name + '\n' + role!,
        //  thrown into the avatar class.
        child: Avatar(
          radius: radius,
          name: name,
          fontsize: fontsize,
          random: random,
          count: count,
          color: color,
          img: img,
        ),
      );
    } else {
      // if "false" directly return to the avatar class
      return Avatar(
        radius: radius,
        name: name,
        fontsize: fontsize,
        color: color,
        random: random,
        count: count,
        img: img,
      );
    }
  }
}
