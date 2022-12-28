import 'package:flutter/material.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';
import 'package:flutter/services.dart';

class TextfieldClear extends StatelessWidget {
  final String? placeholder;
  final TextInputType? inputType;
  final TextEditingController controlador;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autovalidmode;
  final String? hintext;
  final bool? readonly;
  final bool? obscuretext;
  final Function()? ontap;
  final Function(String?)? onchange;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final String? Function(String?)? validator;

  const TextfieldClear(
      {super.key,
      this.placeholder,
      this.inputType,
      required this.controlador,
      this.textCapitalization,
      this.hintext,
      this.readonly,
      this.obscuretext,
      this.ontap,
      this.onchange,
      this.prefixicon,
      this.suffixicon,
      this.validator,
      this.autovalidmode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      textInputAction: TextInputAction.done,
      autovalidateMode: autovalidmode ?? AutovalidateMode.onUserInteraction,
      validator: validator ??
          ((value) {
            if (value == null || value.isEmpty) {
              return S.of(context).fieldrequired;
            }
            return null;
          }),
      inputFormatters: [DecimalInputFormatter()],
      onTap: ontap,
      keyboardType: inputType,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      controller: controlador,
      onChanged: onchange,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: EstiloApp.primaryblue,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          fontWeight: FontWeight.bold,
          color: EstiloApp.primaryblue),
      decoration: InputDecoration(
          suffixIcon: suffixicon ?? null,
          prefixIcon: //prefixicon ?? null
              prefixicon != null
                  ? Container(
                      padding: EdgeInsets.only(left: 20, top: 5),
                      child: prefixicon ?? SizedBox())
                  : null,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none),
    );
  }
}

class DecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regExp = RegExp(r'^\d*\.?\d{0,2}');
    final newText = regExp.stringMatch(newValue.text);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText!.length),
    );
  }
}

class Textfield extends StatelessWidget {
  final String? placeholder;
  final TextInputType? inputType;
  final TextEditingController controlador;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autovalidmode;
  final String? hintext;
  final bool? readonly;
  final bool? obscuretext;
  final Function()? ontap;
  final Function(String?)? onchange;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final String? Function(String?)? validator;

  const Textfield(
      {super.key,
      this.placeholder,
      this.inputType,
      required this.controlador,
      this.textCapitalization,
      this.hintext,
      this.readonly,
      this.obscuretext,
      this.ontap,
      this.onchange,
      this.prefixicon,
      this.suffixicon,
      this.validator,
      this.autovalidmode});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          autovalidateMode: autovalidmode ?? AutovalidateMode.onUserInteraction,
          validator: validator ??
              ((value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).fieldrequired;
                }
                return null;
              }),
          onTap: ontap,
          keyboardType: inputType,
          textCapitalization: textCapitalization ?? TextCapitalization.words,
          controller: controlador,
          autofocus: false,
          onChanged: onchange,
          readOnly: readonly ?? false,
          cursorColor: EstiloApp.primaryblue,
          obscureText: obscuretext ?? false,
          decoration: InputDecoration(
              hintText: hintext,
              label: b1(
                text: placeholder ?? '',
                color: EstiloApp.colorblack,
                //fontWeight: FontWeight.w500,
              ),
              prefixIcon: prefixicon ?? null,
              suffixIcon: suffixicon ?? null),
        ));
  }
}
