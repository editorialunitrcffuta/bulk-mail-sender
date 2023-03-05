import 'package:flutter/material.dart';

import '../responsive.dart';
import '../styles/styles.dart';

class DropDownField extends StatefulWidget {
  final List<String> values;
  final void Function(int) onChanged;
  final String? labelText;
  final String? hint;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool? isEditable;
  final bool enabled;
  final String? selection;

  const DropDownField(
      {Key? key,
      required this.values,
      required this.onChanged,
      this.labelText,
      this.decoration,
      this.style,
      this.selection,
      this.enabled = true,
      this.hint, this.isEditable})
      : super(key: key);

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? selection;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        selection = widget.selection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // selection ??= widget.values.isNotEmpty ? widget.values[0] : "";
    return AbsorbPointer(
      absorbing: widget.isEditable == true ? false : true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(widget.labelText! + " *",
                    style: Responsive.isMobile(context)
                        ? labelStyle.copyWith(fontSize: 9.5)
                        : labelStyle),
              ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Styles.defaultLightGreyColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.expand_more),
                        decoration: widget.decoration ??
                            InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                        style: widget.style,
                        hint: Text(widget.hint ?? "Select"),
                        value: selection,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return "Please, fill this field";
                          return null;
                        },
                        onChanged: widget.enabled
                            ? (value) {
                                if (value != null) {
                                  setState(() {
                                    selection = value;
                                  });
                                  widget.onChanged(widget.values.indexOf(value));
                                }
                              }
                            : null,
                        items: widget.values
                            .map((String type) => DropdownMenuItem<String>(
                                  child: Text(type),
                                  value: type,
                                ))
                            .toList()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
