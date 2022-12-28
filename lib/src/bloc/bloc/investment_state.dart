part of 'investment_bloc.dart';

abstract class InvestmentState extends Equatable {
  const InvestmentState();
  
  @override
  List<Object> get props => [];
}

class InvestmentInitial extends InvestmentState {}
