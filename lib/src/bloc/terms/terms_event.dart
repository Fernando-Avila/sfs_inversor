part of 'terms_bloc.dart';

abstract class TermsEvent {
  const TermsEvent();
}

class TermsChangeEvent extends TermsEvent {
  final bool status;
  TermsChangeEvent({required this.status});
}

class TermsOpenChangeEvent extends TermsEvent {
  final bool opened;
  TermsOpenChangeEvent({required this.opened});
}
class TermClearEvent extends TermsEvent {
  
  TermClearEvent();
}