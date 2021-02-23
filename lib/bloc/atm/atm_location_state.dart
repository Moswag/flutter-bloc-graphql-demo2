part of 'atm_location_bloc.dart';

@immutable
abstract class AtmLocationState {}

class AtmLocationInitial extends AtmLocationState {}


class AtmLocationLoading extends AtmLocationState {}
// ignore: must_be_immutable
class LoadAtmLocations extends AtmLocationState{
  List<AtmLocation> atmLocations;
  LoadAtmLocations({this.atmLocations});
}