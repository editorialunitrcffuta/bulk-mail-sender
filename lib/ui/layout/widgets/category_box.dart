import 'package:flutter/material.dart';
import '../../styles/styles.dart';

class CategoryBox extends StatelessWidget {
  final List<Widget> children;
  final Widget suffix;
  final String title;
  final bool isAppBar;

  const CategoryBox({
    Key? key,
    required this.suffix,
    required this.children,
    required this.title,
    required this.isAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // isAppBar==true?const TopAppBar():const SizedBox.shrink(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: Styles.defaultBorderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(Styles.defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      suffix
                    ],
                  ),
                ),
                ...children,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
