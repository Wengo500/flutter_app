import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/auth/bloc.dart';
import '../bloc/auth/event.dart';
import '../domain/models/task.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  bool showLogin = true;

  AuthRepository _authService = AuthRepository();

  @override

  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child:
            Text("First app", style: Theme
                .of(context)
                .textTheme
                .headline6),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: const TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(data: const IconThemeData(color: Colors.white),
                    child: icon),
              )
          ),
        ),
      );
    }

    Widget _button(String text, void fanc()) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(36, 84, 133, 0.6431372549019608),
        ),
        onPressed: () => fanc(),
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: _input(
                  const Icon(Icons.email), "EMAIL", _emailController, false)
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _input(
                const Icon(Icons.password), "PASSWORD", _passwordController,
                true),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: _button(label, func),
              ))
        ]),
      );
    }
    void _signInWithEmailAndPassword(context) {
      if (_formKey.currentState!.validate()) {
        // If email is valid adding new event [SignUpRequested].
        BlocProvider.of<AuthBloc>(context).add(
          SignUpRequested(_emailController.text, _passwordController.text),
        );
      }
    }
    void _signUpWithEmailAndPassword(context) {
      if (_formKey.currentState!.validate()) {
        // If email is valid adding new event [SignUpRequested].
        BlocProvider.of<AuthBloc>(context).add(
          SignUpRequested(_emailController.text, _passwordController.text),
        );
      }
    }
    void _loginButtonAction() {

      _email = _emailController.text;
      _password = _passwordController.text;
      _emailController.clear();
      _passwordController.clear();
    }

    void _registerButtonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          const SizedBox(height: 60,),
          (
            showLogin
            ? Column(
              children: <Widget>[
                _form('LOGIN', _loginButtonAction),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    child: const Text('Not registered yet? Register',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      setState(() {
                        showLogin = false;
                      });
                    },
                  ),
                )
              ],
            )
           : Column(
              children: <Widget>[
                _form('REGISTER', _registerButtonAction),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    child: const Text('Already registered? Login',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      setState(() {
                        showLogin = true;
                      });
                    },
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
