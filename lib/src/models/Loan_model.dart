class Loan {
  dynamic id;
  dynamic code;
  dynamic date;
  dynamic tir;
  dynamic months;
  dynamic invested;
  dynamic required;
  dynamic timeremaining;
  Loan(
      {this.id,
      this.code,
      this.date,
      this.invested,
      this.required,
      this.tir,
      this.months,
      this.timeremaining});
}

final loans = [
  Loan(
      id: 1,
      code: '12312',
      date: DateTime.now(),
      invested: 4500,
      required: 6000,
      tir: 12.9,
      months: 12,
      timeremaining: '0 m 5d'),
  Loan(
      id: 2,
      code: 'asdr231',
      date: DateTime.now(),
      invested: 399,
      required: 2500,
      tir: 13.98,
      months: 6,
      timeremaining: '0 m 5d '),
  Loan(
      id: 2,
      code: '12312',
      date: DateTime.now(),
      invested: 6700,
      required: 10000,
      tir: 10.0,
      months: 18,
      timeremaining: '0 m 5d '),
  Loan(
      id: 3,
      code: '12312',
      date: DateTime.now(),
      invested: 500,
      required: 800,
      tir: 12.9,
      months: 9,
      timeremaining: '0 m 5d '),
  Loan(
      id: 4,
      code: 'tgh12w',
      date: DateTime.now(),
      invested: 3000,
      required: 5000,
      tir: 16.9,
      months: 3,
      timeremaining: '0 m 5d '),
  Loan(
      id: 2,
      code: '12312',
      date: DateTime.now(),
      invested: 2500,
      required: 10000,
      tir: 10.0,
      months: 36,
      timeremaining: '0 m 5d '),
  Loan(
      id: 3,
      code: '12312',
      date: DateTime.now(),
      invested: 500,
      required: 800,
      tir: 12.9,
      months: 24,
      timeremaining: '0 m 5d '),
  Loan(
      id: 4,
      code: 'tgh12w',
      date: DateTime.now(),
      invested: 3000,
      required: 5000,
      tir: 16.9,
      months: 6,
      timeremaining: '0 m 5d '),
];
