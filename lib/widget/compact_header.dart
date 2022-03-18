import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:territoriei/widget/spaces.dart';

/// Compact version of [Header]
class CompactHeader extends StatelessWidget implements PreferredSizeWidget {
  /// Optional tile of header
  final String? title;

  /// Show optional divider on bottom
  final bool showDivider;

  /// On tap back callback, if null back button is hidden
  final GestureTapCallback? onBack;

  /// Default constructor
  const CompactHeader({
    Key? key,
    this.title,
    this.onBack,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: const Color(0xff3E434C),
          height: spaces[12]!,
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: onBack != null
                      ? IconButton(
                          onPressed: onBack,
                          iconSize: 30,
                          splashRadius: spaces[3],
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xffFFC000),
                          ),
                        )
                      : Container(),
                ),
                Expanded(
                  flex: 4,
                  child: title != null
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            title!,
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Color(0xffFFFFFF),
                                // letterSpacing: .5,
                                fontSize: 28,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 0,
            thickness: 1,
            color: Color(0xffFFC000),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(spaces[12]!);
}
