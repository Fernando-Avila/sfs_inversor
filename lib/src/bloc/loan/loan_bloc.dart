import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sfs_inversor/src/models/Loan_model.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<Equatable, LoanState> {
  LoanBloc()
      : super(LoanInitial(
            loan: null, loanlist: loans, loanlistlength: 1, pageindex: 0)) {
    on<LoanSelectEvent>((event, emit) {
      emit(LoanChange(
          loan: event.loan,
          pageindex: state.pageindex,
          loanlist: state.loanlist,
          loanlistlength: 5));
    });
    on<LoanChangeIndexEvent>((event, emit) async {
      if (event.pageindex < 0) return;
      if (event.pageindex >= state.loanlistlength!) return;
      List<Loan> loansl = state.loanlist!;
      loansl.shuffle();
      emit(LoanChange(
          loan: state.loan,
          pageindex: event.pageindex,
          loanlist: loansl,
          loanlistlength: 50));
    });
  }
}
