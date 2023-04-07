import 'package:flutter/material.dart';

class InformationItemRow extends StatelessWidget {
  final String keyString;
  final String? value;

  InformationItemRow(this.keyString, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$keyString: ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            value ?? '',
            maxLines: 1,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
