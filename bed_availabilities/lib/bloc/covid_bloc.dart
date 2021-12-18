import 'package:bed_availabilities/bloc/covid_events.dart';
import 'package:bed_availabilities/bloc/covid_states.dart';
import 'package:bed_availabilities/model/covid_data_model.dart';
import 'package:bed_availabilities/repository/api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvents, CovidStates> {
  CovidBloc(CovidStates initialState) : super(InitialState()) {
    on<CovidEvents>((event, emit) async {
      if (event is LoadDataEvent) {
        emit(LoadingState());
        CovidDataModel _covidDataModel = await APICall()
            .getData(); //Calling getData method to load json data
        emit(SuccessState(_covidDataModel));
      } else if (event is CloseEvent) {
        emit(InitialState());
      }
    });
  }
}
