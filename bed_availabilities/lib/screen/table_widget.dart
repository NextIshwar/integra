import 'package:bed_availabilities/model/covid_data_model.dart';
import 'package:bed_availabilities/services/size_config.dart';
import 'package:flutter/material.dart';

///[DataWidget] is creates a table widget to display the data
class DataWidget extends StatelessWidget {
  final CovidDataModel covidDataModel;
  const DataWidget({Key? key, required this.covidDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.toFont,
          fontWeight: FontWeight.w500),
      dataTextStyle:
          TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
      headingRowColor: MaterialStateProperty.all(Colors.teal[700]),
      sortColumnIndex: 0,
      columns: covidDataModel.fields!
          .map((e) => DataColumn(label: Text(e)))
          .toList(),
      rows: List.generate(
        covidDataModel.dataValues!.length,
        (index) {
          return DataRow(
            cells: List.generate(
              12,
              (indi) => DataCell(
                Text(
                  covidDataModel.dataValues![index][indi],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
