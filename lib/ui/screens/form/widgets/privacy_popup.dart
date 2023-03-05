import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class PrivacyPopup extends StatelessWidget {
  const PrivacyPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17),
      color: const Color(0xffF0F2F4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.lock, color: Color(0xFF79808F)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'We take privacy issues seriously. You can be sure that your personal data is securely protected.',
                      style: subBodyStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.clear,
            color: Color(0xFF79808F),
          ),
        ],
      ),
    );
  }
}
