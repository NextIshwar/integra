import 'package:equatable/equatable.dart';

abstract class CovidEvents extends Equatable {}

///[LoadDataEvent] is an event which is raised to get the data
class LoadDataEvent extends CovidEvents {
  @override
  List<Object> get props => [];
}

///[CloseEvent] is an event raised when Hide data button is tapped
class CloseEvent extends CovidEvents {
  @override
  List<Object> get props => [];
}
