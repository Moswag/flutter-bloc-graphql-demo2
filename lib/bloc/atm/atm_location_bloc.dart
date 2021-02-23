import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_demo_bloc_grahpql/models/atm_location.dart';

import 'atm_location_repository.dart';
part 'atm_location_event.dart';
part 'atm_location_state.dart';


class AtmLocationBloc extends Bloc<AtmLocationEvent, AtmLocationState> {
  AtmLocationRepository repository;
  AtmLocationBloc({this.repository});
  @override
  AtmLocationState get initialState =>AtmLocationInitial();

  @override
  Stream<AtmLocationState> mapEventToState(
      AtmLocationEvent event,
      ) async* {

    if(event is AtmLocationFetched)
    {
      yield AtmLocationLoading();
      var atmLocations = await repository.fetchAllATMLocationsByCity();
      yield LoadAtmLocations(atmLocations:atmLocations);
    }

  }
}
