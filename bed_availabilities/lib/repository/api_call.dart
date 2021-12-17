import 'dart:convert';

import 'package:bed_availabilities/model/covid_data_model.dart';
import 'package:flutter/services.dart';

///[APICall] singleton class contains below method
///
/// - `getData` 
class APICall {
  APICall._();
  static final APICall _instance = APICall._();
  factory APICall() => _instance;
  ///[getData] method gets the json data from assets and convert that data into
  ///dart data model return an object of `CovidDataModel`
  Future<CovidDataModel> getData() async {
    final String _response = await rootBundle.loadString('assets/data.json');
    final _data = await json.decode(_response);
    return CovidDataModel.fromJson(_data);
  }
}
