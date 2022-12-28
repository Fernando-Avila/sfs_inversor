part of 'loan_bloc.dart';

abstract class LoanEvent extends Equatable {
  const LoanEvent();
  @override
  List<Object> get props => [];
}

class LoanSelectEvent extends Equatable {
  final Loan loan;
  LoanSelectEvent({required this.loan});

  @override
  List<Object> get props => [loan];
}

class LoanChangeIndexEvent extends Equatable {
  final int pageindex;
  LoanChangeIndexEvent({required this.pageindex});

  @override
  // TODO: implement props
  List<Object> get props => [pageindex];
}
