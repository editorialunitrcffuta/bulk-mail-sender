import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../../../styles/styles.dart';

class TermsOfUseWidget extends StatelessWidget {
  const TermsOfUseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
            activeColor: Styles.defaultDesignColor,
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 8.0, left: 17),
            child: Text(
              'I agree with',
              style: TextStyle(
                fontSize: Responsive.isMobile(context)
                    ? 10
                    : 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            'Terms of use',
            style: TextStyle(
              fontSize: Responsive.isMobile(context)
                  ? 10
                  : 16,
              fontWeight: FontWeight.w400,
              color: Styles.defaultDesignColor,
            ),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
