import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../styles/styles.dart';

class CustomTextFieldX extends StatefulWidget {
  const CustomTextFieldX(
      {Key? key,
      this.suffixIcon,
      this.controller,
      this.prefixIcon,
      this.labelText,
      this.error = false,
      this.color,
      this.enabled = true,
      this.hint,
      this.obscureText = false,
      this.initialText,
      this.isEditable})
      : super(key: key);

  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final Color? color;
  final bool? error;
  final bool? enabled;
  final bool? isEditable;
  final String? hint;
  final bool obscureText;
  final String? initialText;

  @override
  State<CustomTextFieldX> createState() => _CustomTextFieldXState();
}

class _CustomTextFieldXState extends State<CustomTextFieldX> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;

  void onFocusChange() {
    setState(() {
      isFocused = focusNode.hasFocus ? true : false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    focusNode.addListener(onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // InputBorder _inputBorder = UnderlineInputBorder(
    //   // gapPadding: 8,
    //   borderSide: BorderSide(
    //     width: 1,
    //     color: Styles.defaultLightGreyColor,
    //   ),
    //   borderRadius: BorderRadius.circular(8),
    // );
    return AbsorbPointer(
      absorbing: widget.isEditable == true ? false : true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                  widget.labelText ??
                      '' + (widget.labelText != null ? ' *' : ''),
                  style: Responsive.isMobile(context)
                      ? labelStyle.copyWith(fontSize: 9.5)
                      : labelStyle),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Styles.defaultLightGreyColor),
                  borderRadius: BorderRadius.circular(8)),
              // margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(4),
              child: TextFormField(
                // controller: widget.controller,
                obscureText: widget.obscureText,
                focusNode: focusNode,
                enabled: widget.enabled,
                onChanged: (text) =>
                    setState(() => widget.controller!.text = text),
                initialValue: widget.initialText,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return "Please, fill this field";
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.hint,
                  // errorText: widget.error==true?'Please enter a valid email address':null,
                  // contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                  // prefix: widget.prefixIcon,
                  suffixIcon: widget.error == false
                      ? widget.suffixIcon
                      : const Icon(
                          Icons.error_outline_outlined,
                        ),
                  filled: true,
                  fillColor: widget.enabled == false
                      ? const Color(0xFFF2F4F7)
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
