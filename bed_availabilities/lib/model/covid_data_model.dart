import 'package:bed_availabilities/model/error_model.dart';

///[CovidDataModel] is the data model class that is used while converting json
///to dart model
class CovidDataModel {
  List<String>? fields;
  List<List<dynamic>>? dataValues;
  CovidDataModel({
    this.fields,
    this.dataValues,
  });

  CovidDataModel.fromJson(Map<String, dynamic> json) {
    fields = [];
    json['fields'].forEach((e) {
      fields!.add(e['label'] ?? "-");
    });
    dataValues = [];
    json['data'].forEach((e) {
      dataValues!.add(e);
    });
  }
}
