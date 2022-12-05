part of 'terms_bloc.dart';

@immutable
abstract class TermsState {
  final bool status;
  final bool opened;

  const TermsState({this.status = false, this.opened = false});
}

class TermsInitial extends TermsState {
  const TermsInitial() : super(status: false, opened: false);
}

class TermsSetState extends TermsState {

  final bool status;
  final bool opened;
  @override
  const TermsSetState({required this.status, required this.opened})
      : super(status: status, opened: opened);
}
