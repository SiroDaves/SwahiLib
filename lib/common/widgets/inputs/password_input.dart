import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/theme_colors.dart';

class PasswordInput extends StatefulWidget {
  final String? iLabel;
  final TextEditingController? iController;
  final TextInputType iType;
  final AutovalidateMode? validationMode;
  final bool? isReadOnly;
  final bool? isLight;
  final bool? isEnabled;
  final bool? executeValueChange;
  final FormFieldValidator<String>? iValidator;
  final Function(String)? onChanged;
  final Function()? onValueChanged;
  final Function()? onTap;
  final IconData? prefix;
  final bool? isActive;
  final double bdRadius;
  final int maxInput;

  const PasswordInput({
    Key? key,
    this.iLabel = 'Password',
    this.iType = TextInputType.text,
    this.iController,
    this.validationMode = AutovalidateMode.disabled,
    this.isReadOnly = false,
    this.isLight = false,
    this.isEnabled = true,
    this.executeValueChange = false,
    this.iValidator,
    this.onChanged,
    this.onValueChanged,
    this.onTap,
    this.prefix = Icons.lock_outline,
    this.isActive = true,
    this.bdRadius = 5,
    this.maxInput = 10,
  }) : super(key: key);

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    Color foreColor = widget.isLight! ? Colors.white : ThemeColors.primary;

    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.iController,
        keyboardType: widget.iType,
        autovalidateMode: widget.validationMode,
        validator: widget.iValidator,
        enabled: widget.isEnabled,
        readOnly: widget.isReadOnly!,
        onTap: widget.onTap,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxInput),
        ],
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: widget.iLabel,
          prefixIcon: Icon(widget.prefix, color: foreColor),
          suffixIcon: Container(
            width: 70,
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => widget.iController!.clear(),
                  child: Icon(Icons.clear, color: foreColor),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => setState(() => isPassword = !isPassword),
                  child: Icon(
                    isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: foreColor,
                  ),
                ),
              ],
            ),
          ),
          labelStyle: TextStyle(fontSize: 16, color: foreColor),
          contentPadding: const EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
        ),
        style: TextStyle(fontSize: 18, color: foreColor),
        onChanged: widget.onChanged,
      ),
    );
  }
}
