part of 'bank_card_bloc.dart';

@immutable
abstract class BankCardState {}

class BankCardInitial extends BankCardState {}


class BankCardLoading extends BankCardState {}
// ignore: must_be_immutable
class LoadBankCard extends BankCardState{
  List<BankCard> bankCards;
  LoadBankCard({this.bankCards});
}