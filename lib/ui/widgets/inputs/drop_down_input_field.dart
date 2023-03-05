import 'package:flutter/material.dart';

class DropdownInputField extends StatefulWidget {
  String? dropdownValue = '';
  final List<String>? items;
  final String? value;
  final int? flex;

  DropdownInputField(
      {Key? key, this.dropdownValue, this.items, this.value, this.flex})
      : super(key: key);

  @override
  State<DropdownInputField> createState() => _DropdownInputFieldState();
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex ?? 2,
      child: DropdownButtonFormField<String>(
        value: widget.value,
        decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
        onChanged: (String? value) {
          setState(() {
            widget.dropdownValue = value;
          });
        },
        items: widget.items!.map(
          (String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          },
        ).toList(),
      ),
    );
  }
}
