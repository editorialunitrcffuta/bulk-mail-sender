import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class SearchItemInputField extends StatefulWidget {
  const SearchItemInputField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.controller,
      this.onChanged})
      : super(key: key);
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<SearchItemInputField> createState() => _SearchItemInputFieldState();
}

class _SearchItemInputFieldState extends State<SearchItemInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
          filled: true,
          focusColor: const Color(0xffFAF3F0),
          fillColor: const Color(0xffFAF3F0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(6)),
          suffixIcon: const Icon(Icons.search, size: 12),
          hintText: 'search name',
          hintStyle: databaseStyle11),
      onChanged: widget.onChanged,
    );
  }
}
