import 'package:flutter/cupertino.dart';

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }
}
