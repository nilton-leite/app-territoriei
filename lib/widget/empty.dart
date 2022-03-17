// ignore_for_file: unnecessary_const, use_full_hex_values_for_flutter_colors

import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final PackageImage? image;
  final bool button;
  final String textButton;
  final String? textState;
  final Function() function;
  const Empty(
      {Key? key,
      this.title,
      this.subtitle,
      this.image,
      required this.button,
      required this.textButton,
      this.textState,
      required this.function})
      : super(key: key);
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: EmptyWidget(
            image: null,
            packageImage: widget.image,
            title: widget.title,
            subTitle: widget.subtitle,
            hideBackgroundAnimation: true,
            titleTextStyle: const TextStyle(
              fontSize: 22,
              color: const Color(0xffcc39191),
              fontWeight: FontWeight.w500,
            ),
            subtitleTextStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFFCC39191),
            ),
          ),
        ),
        widget.button
            ? Center(
                child: ElevatedButton(
                  child: Text(widget.textButton),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFCC39191),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    widget.function();
                  },
                ),
              )
            : const Text(''),
      ],
    );
  }
}
