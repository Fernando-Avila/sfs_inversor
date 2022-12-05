import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'terms_event.dart';
part 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  TermsBloc() : super(TermsInitial()) {
    on<TermsChangeEvent>((event, emit) {
      emit(TermsSetState(status: event.status, opened: state.opened));
    });
    on<TermsOpenChangeEvent>((event, emit) {
      emit(TermsSetState(status: state.status, opened: event.opened));
    });
    on<TermClearEvent>((event, emit) {
      emit(TermsInitial());
    });
  }
}
