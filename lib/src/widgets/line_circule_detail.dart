import 'package:flutter/material.dart';

import '../../constants.dart';

class LineCirculeDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
          margin: const EdgeInsets.only(left: 30.0, right: 10.0),
          child: Divider(
            color: primaryGreen,
            height: 36,
            thickness: 1.5,
          ),
        ),
      ),
      Container(
        width: 7.5,
        height: 7.5,
        decoration: BoxDecoration(
          color: primaryGreen,
          shape: BoxShape.circle,
        ),
      ),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 30.0),
            child: Divider(
              color: primaryGreen,
              height: 36,
              thickness: 1.5,
            )),
      ),
    ]);
  }
}
