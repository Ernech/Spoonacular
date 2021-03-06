import 'package:flutter/material.dart';
import 'package:spoonacular/constants.dart';
import 'package:spoonacular/src/bloc/login_bloc.dart';

class CustomeInput extends StatelessWidget {
  IconData iconosTextfield;
  String textfieldText;
  String inputName;
  LoginBloc loginBloc;
  bool password;
  TextInputType keyBoardType;

  CustomeInput(
      this.inputName,
      this.iconosTextfield,
      this.textfieldText,
      this.loginBloc,
      this.password,
      this.keyBoardType); //Correo, icono_persona, dentro del hint

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
                    fontSize:  MediaQuery.of(context).size.width*0.04,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
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
          child: StreamBuilder(
            stream: password ? loginBloc.passwordStream : loginBloc.emailStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return TextField(
                keyboardType: keyBoardType,
                onChanged:
                    password ? loginBloc.changePassword : loginBloc.changeEmail,
                obscureText: password,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      iconosTextfield,
                      color: Colors.grey,
                      size:  MediaQuery.of(context).size.width*0.05,
                    ),
                    hintText: textfieldText,
                    hintStyle: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*0.04),
                    errorText: snapshot.error),
              );
            },
          ),
        ),
      ],
    );
  }
}
