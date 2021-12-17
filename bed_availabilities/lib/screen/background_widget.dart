import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

///[BackgroundWidget] creates a widget which is used to show background
///animation widget
class BackgroundWidget extends StatefulWidget {
  final bool showTitle;
  ///`showTitle` is a boolean value,
  ///
  ///if `showTitle` is true then title will be displayed else not
  const BackgroundWidget({Key? key, this.showTitle = true}) : super(key: key);

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(),
      vsync: this,
      child: Center(
        child: Text(
          widget.showTitle ? 'Integra Micro Systems' : '',
          style:
              TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
