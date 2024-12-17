import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/theme_colors.dart';

class FormInput extends StatefulWidget {
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
  final Widget? prefix;
  final bool? isActive;
  final bool? isMultiline;
  final double bdRadius;
  final int maxInput;

  const FormInput({
    Key? key,
    this.iLabel = "",
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
    this.prefix,
    this.isActive = true,
    this.isMultiline = false,
    this.bdRadius = 5,
    this.maxInput = 20000,
  }) : super(key: key);

  @override
  FormInputState createState() => FormInputState();
}

class FormInputState extends State<FormInput> {
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
        minLines: widget.isMultiline! ? 50 : 1,
        maxLines: widget.isMultiline! ? null : 1,
        enabled: widget.isEnabled,
        readOnly: widget.isReadOnly!,
        onTap: widget.onTap,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxInput),
        ],
        decoration: InputDecoration(
          labelText: widget.iLabel,
          prefixIcon: widget.prefix,
          suffixIcon: InkWell(
            onTap: () => widget.iController!.clear(),
            child: Icon(Icons.clear, color: foreColor),
          ),
          labelStyle: TextStyle(fontSize: 16, color: foreColor),
          isDense: widget.isMultiline! ? true : false,
          contentPadding: widget.isMultiline! ? null : const EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
        ),
        style: TextStyle(
          fontSize: 18,
          color: foreColor,
        ),
        //textInputAction: widget.isMultiline! ? TextInputAction.newline : TextInputAction.next,
        onChanged: widget.onChanged,
      ),
    );
  }
}
