import 'dart:ui';

import 'package:bed_availabilities/bloc/covid_bloc.dart';
import 'package:bed_availabilities/bloc/covid_events.dart';
import 'package:bed_availabilities/bloc/covid_states.dart';
import 'package:bed_availabilities/screen/background_widget.dart';
import 'package:bed_availabilities/screen/table_widget.dart';
import 'package:bed_availabilities/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[HomePage] is creates a widget that displays home widget
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      appBar: AppBar(
        title: const Text("Bed Availabilities"),
      ),
      body: BlocBuilder<CovidBloc, CovidStates>(builder: (context, state) {
        return Stack(
          children: [
            BackgroundWidget(
              showTitle: state is! SuccessState,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 100,
              padding: EdgeInsets.all(20.toHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50.toHeight,
                    width: 150.toWidth,
                    margin: EdgeInsets.symmetric(vertical: 50.toHeight),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        //if data is not loaded then LoadDataEvent will be
                        //raised and this event is responsible for getting the
                        //data else CloseEvent is raised which is responsible
                        //for hiding the table
                        if (state is! SuccessState) {
                          BlocProvider.of<CovidBloc>(context)
                              .add(LoadDataEvent());
                        } else {
                          BlocProvider.of<CovidBloc>(context).add(CloseEvent());
                        }
                      },
                      child: Text(
                          state is SuccessState ? "Hide Data" : "Show Data"),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AnimatedContainer(
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.5),
                          ),
                          height: state is SuccessState ? 400.toHeight : 0,
                          duration: const Duration(milliseconds: 500),
                          child: _getMainContainer(state)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

///[_getMainContainer] method returns a widget to display based on the 
///CovidState
Widget _getMainContainer(CovidStates state) {
  return state is LoadingState
      ? SizedBox(
          height: 20.toHeight,
          width: 20.toHeight,
          child: CircularProgressIndicator(
            color: Colors.amber[900],
          ),
        )
      : state is SuccessState
          ? SingleChildScrollView(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
                child: DataWidget(
                  covidDataModel: state.covidDataModel,
                ),
              ),
            )
          : const SizedBox();
}
