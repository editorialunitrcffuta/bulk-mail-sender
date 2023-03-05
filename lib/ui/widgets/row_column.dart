import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  final bool vertAxis;
  final List<Widget> children;
  const RowColumn({Key? key, this.vertAxis = false, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (vertAxis) {
          return Column(children: children);
        } else {
          return Row(
              children: children.map((e) => Expanded(child: e)).toList());
        }
      },
    );
  }
}
