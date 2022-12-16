import 'package:sfs_inversor/generated/l10n.dart';

String? civalidator(String value) {
  bool email = value.contains('@');
  bool point = value.contains('.');
  if (value.isEmpty) return 'Campo obligatorio';
  if (value.length < 4) return 'Email no valid';
  if (!email) return 'Email invalid';
  if (!point) return 'point invalid';
  return null;
}

String? emailvalidator(String value, context) {
  bool email = value.contains('@');
  bool point = value.contains('.');
  if (value.isEmpty) return S.of(context).fieldrequired;
  if (value.length < 4 || !email || !point) return S.of(context).invalidmail;
//  if (!email||!point) return S.of(context).invalidmail;
  //if (!point) return S.of(context).invalidmail;
  return null;
}

String? passconfirm(String value, context, String pass, String passverify) {
  if (value.length < 8) return S.of(context).minimumpassword;
  if (pass != passverify) return S.of(context).passworddontmatch;

//  if (!email||!point) return S.of(context).invalidmail;
  //if (!point) return S.of(context).invalidmail;
  return null;
}

double percent(max, value) {
  double val = (value / max) * 100;
  return val * 0.01;
}

double diference(max, value) {
  double val = max - value + 0.0;
  return val;
}
