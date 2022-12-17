import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class ChatBubble extends StatelessWidget {
  String message;
  Radius? bottomLeft = const Radius.circular(0);
  Radius? bottomRight = const Radius.circular(0);
  Color color;
  AlignmentGeometry alignment;
  ChatBubble(
      {Key? key,
        required this.alignment,
      required this.message,
        this.bottomLeft,
       this.bottomRight,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
          margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 15),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: bottomRight!,
                bottomRight: const Radius.circular(20),
                bottomLeft: bottomLeft!,
              )),
          child: Text(
            message,
            style: const TextStyle(color: AppColors.kWhiteColor, height: 1.5),
          )),
    );
  }
}
