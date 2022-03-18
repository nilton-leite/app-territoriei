// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class CardReport extends StatelessWidget {
  final Color colorCard;
  final Color colorTooltip;
  final String messageTooltip;
  final String title;
  final String subtitle;
  final String? textBold;
  final String? thirdText;

  const CardReport(
      {Key? key,
      required this.colorCard,
      required this.colorTooltip,
      required this.messageTooltip,
      required this.title,
      required this.subtitle,
      this.textBold,
      this.thirdText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: colorCard,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Tooltip(
                message: messageTooltip,
                child: Icon(
                  Icons.fiber_manual_record,
                  color: colorTooltip,
                ),
              ),
              isThreeLine: true,
              trailing: const SizedBox(
                height: double.infinity,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
              ),
              title: Text(title),
              subtitle: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: textBold,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: thirdText! != null
                          ? subtitle + '\n' + thirdText!
                          : subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
