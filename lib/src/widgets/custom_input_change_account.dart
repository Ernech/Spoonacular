import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/register_bloc.dart';

class CustomeInputChangeAccount extends StatelessWidget {
  IconData iconosTextfield;
  String textfieldText;
  String inputName;
  Stream stream;
  Function(String) changed;

  CustomeInputChangeAccount(
      this.inputName,
      this.iconosTextfield,
      this.textfieldText,
      this.stream,
      this.changed); //Correo, icono_persona, dentro del hint

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Text(
                inputName,
                style: TextStyle(
                    color: primaryGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: TextFormField(
              onChanged: changed,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  iconosTextfield,
                  color: Colors.grey,
                ),
                hintText: textfieldText,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )),
      ],
    );
  }
}
