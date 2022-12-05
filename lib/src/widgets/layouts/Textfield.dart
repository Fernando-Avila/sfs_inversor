import 'package:flutter/material.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

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
