import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

class FormInput extends StatelessWidget {
  final String? iLabel;
  final TextEditingController? iController;
  final TextInputType iType;
  final bool? isLight;
  final bool? isEnabled;
  final bool? executeValueChange;
  final FormFieldValidator<String>? iValidator;
  final Function(String)? onChanged;
  final Function()? onValueChanged;
  final List<String>? iOptions;
  final Icon? prefix;
  final bool? isActive;
  final bool? isMultiline;
  final double bdRadius;

  const FormInput({
    Key? key,
    this.iLabel = "",
    this.iType = TextInputType.text,
    this.iController,
    this.isLight = false,
    this.isEnabled = true,
    this.executeValueChange = false,
    this.iValidator,
    this.onChanged,
    this.onValueChanged,
    this.prefix,
    this.isActive = true,
    this.isMultiline = false,
    this.bdRadius = 5,
    required this.iOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color foreColor = isLight! ? Colors.white : ThemeColors.primary;

    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: iController,
        keyboardType: iType,
        autovalidateMode: isMultiline! ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
        validator: iValidator,
        minLines: isMultiline! ? 15 : 1,
        maxLines: isMultiline! ? 30 : 1,
        enabled: isEnabled,
        readOnly: iOptions!.isNotEmpty ? true : false,
        onTap: () {
          if (iOptions!.isNotEmpty) {
            /*showModalBottomSheet(
              context: context,
              builder: (context) {
                return showModalDropdown(context);
              },
            );*/
          }
        },
        decoration: InputDecoration(
          labelText: iLabel,
          prefixIcon: prefix,
          labelStyle: TextStyle(fontSize: 16, color: foreColor),
          isDense: isMultiline! ? true : false,
          contentPadding: isMultiline! ? null : const EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
        ),
        style: TextStyle(
          fontSize: 18,
          color: foreColor,
        ),
        textInputAction: isMultiline! ? TextInputAction.newline : TextInputAction.next,
        onChanged: onChanged,
      ),
    );
  }

  Widget showModalDropdown(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: iOptions!
            .map(
              (listItem) => ListTile(
                onTap: () {
                  iController!.text = listItem;
                  Navigator.pop(context);
                  if (executeValueChange!) onValueChanged!();
                },
                title: Column(
                  children: [
                    Text(
                      listItem,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    const Divider(height: 1)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// ignore: must_be_immutable
class PasswordInput extends StatelessWidget {
  final TextEditingController? iController;
  final TextInputType? iType;
  final String? iLabel;
  final bool? isLight;
  final bool? isEnabled;
  final bool? isPassword;
  final FormFieldValidator<String>? iValidator;
  final Function()? onSuffixTap;
  final IconData? suffix;
  final double bdRadius;

  const PasswordInput({
    Key? key,
    this.iLabel = 'Password',
    this.iType = TextInputType.text,
    this.iController,
    this.isLight = false,
    this.isEnabled = true,
    this.isPassword = true,
    this.iValidator,
    this.onSuffixTap,
    this.suffix,
    this.bdRadius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color foreColor = isLight! ? Colors.white : ThemeColors.primary;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: iController,
        obscureText: isPassword!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: iValidator,
        decoration: InputDecoration(
          labelText: iLabel,
          prefixIcon: const Icon(Icons.lock_outline),
          labelStyle: TextStyle(fontSize: 16, color: foreColor),
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          suffixIcon: InkWell(
            onTap: onSuffixTap,
            child: Icon(suffix, color: Colors.grey),
          ),
        ),
        style: TextStyle(
          fontSize: 16,
          color: foreColor,
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
