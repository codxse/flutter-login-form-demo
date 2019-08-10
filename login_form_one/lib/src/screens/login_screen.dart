import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart' as validation_mixin;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with validation_mixin.ValidationMixin{
  final dynamic formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: this.formKey,
        child: Column(
          children: <Widget>[
            this.emailField(),
            this.passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            this.submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: this.validateEmail,
      onSaved: (String value) {
        this.email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      ),
      validator: this.validatePassword,
      onSaved: (String value) {
        this.password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.yellow,
      child: Text('Submit'),
      onPressed: () {
        if (this.formKey.currentState.validate()) {
          this.formKey.currentState.save();
          print('Email: ${this.email}, Password: ${this.password}');
        }
      },
    );
  }
}
