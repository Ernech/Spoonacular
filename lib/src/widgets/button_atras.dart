import 'package:flutter/material.dart';

import '../../constants.dart';
class ButtonAtras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 14),
        child: RawMaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          elevation: 5.0,
          fillColor: Colors.white,
          child: Icon(
            Icons.chevron_left,
            size: 20.0,
            color: primaryGreen,
          ),
          padding: EdgeInsets.all(12.0),
          shape: CircleBorder(),
        )
    );
  }
}
