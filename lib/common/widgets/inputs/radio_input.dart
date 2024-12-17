import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';

class RadioInput extends StatefulWidget {
  final List<String> options;
  final String? label;
  final String? initValue;
  final bool? vertical;
  final bool? isReadOnly;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ValueChanged<String>? onChanged;

  const RadioInput({
    super.key,
    required this.options,
    required this.initValue,
    this.onChanged,
    this.label = '',
    this.vertical = true,
    this.isReadOnly = false,
    this.padding,
    this.margin,
  });

  @override
  RadioInputState createState() => RadioInputState();
}

class RadioInputState extends State<RadioInput> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initValue!;
  }

  @override
  Widget build(BuildContext context) {
    var labelWidget = Padding(
      padding:
          widget.padding ?? const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Text(
        widget.label!,
        style: const TextStyle(
          color: ThemeColors.blackText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    if (widget.vertical!) {
      return Container(
        margin: widget.margin ??
            const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.label!.isNotEmpty) ...[labelWidget],
            Column(
              children: widget.options.map((option) {
                return Row(
                  children: <Widget>[
                    Radio(
                      value: option,
                      groupValue: _selectedOption,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        if (!widget.isReadOnly!) {
                          setState(() {
                            _selectedOption = value.toString();
                            widget.onChanged!(_selectedOption);
                          });
                        }
                      },
                    ),
                    Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: widget.margin ??
            const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.label!.isNotEmpty) ...[labelWidget],
            Row(
              children: widget.options.map((option) {
                return Row(
                  children: <Widget>[
                    Radio(
                      value: option,
                      groupValue: _selectedOption,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        if (!widget.isReadOnly!) {
                          setState(() {
                            _selectedOption = value.toString();
                            widget.onChanged!(_selectedOption);
                          });
                        }
                      },
                    ),
                    Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      );
    }
  }
}
