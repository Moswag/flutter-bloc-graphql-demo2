import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_demo_bloc_grahpql/models/bank_card.dart';

import 'bank_card_repository.dart';

part 'bank_card_event.dart';
part 'bank_card_state.dart';


class BankCardBloc extends Bloc<BankCardEvent, BankCardState> {
  BankCardRepository repository;
  BankCardBloc({this.repository});
  @override
  BankCardState get initialState => BankCardInitial();

  @override
  Stream<BankCardState> mapEventToState(
      BankCardEvent event,
      ) async* {

    if(event is BankCardFetched)
    {
      yield BankCardLoading();
      var bankCards = await repository.fetchAllBankCards();
      yield LoadBankCard(bankCards:bankCards);
    }

  }
}
