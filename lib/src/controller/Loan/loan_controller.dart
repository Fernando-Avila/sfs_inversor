import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/services/Functions.dart';

class LoanController {
  late BuildContext context;
  final valueinvested = TextEditingController();
  late double value = 1.00;
  var Loan;
  late double max = 2;
  late double min = 1.00;
  late double earning = 0;
  onchange(String? valueS) {
    print(valueS);
    if (double.tryParse(valueS!) == null) {
      return 'error';
    }
    var val = double.parse(valueS);
    if (val < min) {
      value = min;
      return valueinvested.text = min.toStringAsFixed(2);
    } else if (val > max) {
      value = max;
      return valueinvested.text = max.toStringAsFixed(2);
    } else {
      value = val;
      String valS =
          (val + calctir(val, Loan.tir, Loan.months)).toStringAsFixed(2);
      earning = double.parse(valS);
    }
  }

  onchangecircular(double? valueC) {
    valueinvested.text = valueC!.toStringAsFixed(2).toString();
    String valS =
        (valueC + calctir(valueC, Loan.tir, Loan.months)).toStringAsFixed(2);
    earning = double.parse(valS);
    value = valueC;
  }

  onchangeStart() {}
}
