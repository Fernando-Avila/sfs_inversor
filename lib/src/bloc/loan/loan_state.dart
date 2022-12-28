part of 'loan_bloc.dart';

abstract class LoanState extends Equatable {
  final Loan? loan;
  final int? pageindex;
  final List<Loan>? loanlist;
  final int? loanlistlength;
  LoanState({this.loan, this.pageindex, this.loanlist, this.loanlistlength});
  @override
  List<Object?> get props => [loan, pageindex, loanlist, loanlistlength];
}

class LoanInitial extends LoanState {
  final Loan? loan;
  final int? pageindex;
  final List<Loan>? loanlist;
  final int? loanlistlength;
  LoanInitial({this.loan, this.pageindex, this.loanlist, this.loanlistlength})
      : super(loan: null, loanlist: loans, loanlistlength: 1, pageindex: 0);
}

class LoanChange extends LoanState {
  final Loan? loan;
  final int? pageindex;
  final List<Loan>? loanlist;
  final int? loanlistlength;
  LoanChange({this.loan, this.pageindex, this.loanlist, this.loanlistlength})
      : super(
            loan: loan,
            loanlist: loanlist,
            loanlistlength: loanlistlength,
            pageindex: pageindex);
}
