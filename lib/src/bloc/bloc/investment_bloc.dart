import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'investment_event.dart';
part 'investment_state.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  InvestmentBloc() : super(InvestmentInitial()) {
    on<InvestmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
