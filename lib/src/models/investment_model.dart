class Investment {
  dynamic id;
  dynamic code;
  dynamic date;
  dynamic tir;
  dynamic invested;
  dynamic required;
  dynamic timeremaining;
  Investment(
      {this.id,
      this.code,
      this.date,
      this.invested,
      this.required,
      this.tir,
      this.timeremaining});
}

final investments = [
  Investment(
      id: 1,
      code: '12312',
      date: DateTime.now(),
      invested: 4500,
      required: 6000,
      tir: 12.9,
      timeremaining: '0 m 5d '),
  Investment(
      id: 2,
      code: 'asdr231',
      date: DateTime.now(),
      invested: 399,
      required: 2500,
      tir: 10.9,
      timeremaining: '0 m 5d '),
  Investment(
      id: 2,
      code: '12312',
      date: DateTime.now(),
      invested: 2500,
      required: 10000,
      tir: 10.0,
      timeremaining: '0 m 5d '),
  Investment(
      id: 3,
      code: '12312',
      date: DateTime.now(),
      invested: 500,
      required: 800,
      tir: 12.9,
      timeremaining: '0 m 5d '),
  Investment(
      id: 4,
      code: 'tgh12w',
      date: DateTime.now(),
      invested: 3000,
      required: 5000.00,
      tir: 16.9,
      timeremaining: '0 m 5d '),
  Investment(
      id: 2,
      code: '12312',
      date: DateTime.now(),
      invested: 2500,
      required: 10000,
      tir: 10.0,
      timeremaining: '0 m 5d '),
  Investment(
      id: 3,
      code: '12312',
      date: DateTime.now(),
      invested: 500,
      required: 800,
      tir: 12.9,
      timeremaining: '0 m 5d '),
  Investment(
      id: 4,
      code: 'tgh12w',
      date: DateTime.now(),
      invested: 3000,
      required: 5000,
      tir: 16.9,
      timeremaining: '0 m 5d '),
];
