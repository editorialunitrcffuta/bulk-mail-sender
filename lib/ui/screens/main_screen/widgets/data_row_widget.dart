import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class DataRowWidget extends StatelessWidget {
  final String? desc1;
  final String? desc2;
  final String title1;
  final String title2;

  const DataRowWidget(
      {Key? key,
        this.desc1,
        this.desc2,
        required this.title1,
        required this.title2})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: databaseStyle2,
              ),
              Text(desc1 ?? 'No $title1'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: databaseStyle2,
              ),
              Text(desc2 ?? 'No $title2'),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),
    ],
  );
}
