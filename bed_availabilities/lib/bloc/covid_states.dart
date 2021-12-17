import 'package:bed_availabilities/model/covid_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class CovidStates extends Equatable {}

///[InitialState] initial state of the Bloc
class InitialState extends CovidStates {
  InitialState();
  @override
  List<Object> get props => [];
}

///[LoadingState] state which is yielded to show loading screen
class LoadingState extends CovidStates {
  @override
  List<Object> get props => [];
}

///[SuccessState] state is yielded when data is ready to be displayed
///
///It stores `covidDataModel` of type CovidDataModel
class SuccessState extends CovidStates {
  final CovidDataModel covidDataModel;
  SuccessState(this.covidDataModel);

  @override
  List<Object> get props => [covidDataModel];
}

