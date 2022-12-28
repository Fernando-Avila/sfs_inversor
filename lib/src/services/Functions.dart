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

String? doublevalidator(String value, context, max, min) {
  if (value.isEmpty) return 'Campo obligatorio';
  if (double.tryParse(value) == null) {
    return S.of(context).invalidvalue;
  }
  var val = double.parse(value);
  if (val < 1.0 || val > max) {
    return S.of(context).outofrange;
  }
  return null;
}

double percent(max, value) {
  double val = (value / max) * 100;
  String valS = val.toStringAsFixed(2);
  double valD = double.parse(valS);
  return valD;
}

double diference(max, value) {
  double val = max - value + 0.0;
  return val;
}

double calctir(double monto, double tasaAnual, int meses) {
  // Convertir la tasa de interés anual a una tasa mensual
  double tasaMensual = tasaAnual / 100 / 12;
  // Calcular el interés mensual
  double interesMensual = monto * tasaMensual;
  // Calcular el interés total a pagar
  return interesMensual * meses;
}
