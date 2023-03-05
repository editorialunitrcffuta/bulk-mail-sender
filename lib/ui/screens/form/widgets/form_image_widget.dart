import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../../../styles/styles.dart';

class FormTitleWidget extends StatelessWidget {
  const FormTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            'ARCP Registration Form',
            style: labelStyle.copyWith(
                fontSize: Responsive.isMobile(
                    context)
                    ? 21.71
                    : 32,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 36, top: 16),
            child: Text(
              'Please fill all fields in the form below. It will take a couple of minutes.',
              style: subBodyStyle.copyWith(
                  color:
                  Colors.grey.shade500),
            ),
          ),
        ],
      ),
    );
  }
}
