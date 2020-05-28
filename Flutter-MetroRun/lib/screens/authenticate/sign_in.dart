import 'package:flutter/material.dart';
import 'package:metrorun/screens/authenticate/register.dart';
import 'package:metrorun/screens/services/auth.dart';
import 'package:metrorun/screens/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[900],
          elevation: 5.0,
          title: Text('Sign in to Metro Run'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[

                SizedBox(height: 80.0),

                TextFormField(
                    validator: (val) =>
                    val.isEmpty ? 'Enter a valid email id' : null,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'JohnDoe@example.com',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[900],
                          width: 3.0,
                        ),
                      ),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                    ),
                    onChanged: (val) {
                      setState(() => email = val);
                    }),

                SizedBox(height: 40.0),

                TextFormField(
                    validator: (val) =>
                    val.length < 6 ? 'Enter password' : null,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText:
                      'Password must contain alphabets and numbers',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[900],
                          width: 3.0,
                        )
                      ),
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => password = val);
                    }),

                SizedBox(height: 50.0),

                Center(
                  child: Text(
                    error,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                ),

                SizedBox(height: 130.0),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                        color: Colors.orange,
                        splashColor: Colors.yellowAccent,
                        child: Text('Create an Account',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[900],
                            )),
                        onPressed: () {
                          widget.toggleView();
                        }),
                  ),
                ),

                SizedBox(height: 50.0),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                        color: Colors.orange,
                        splashColor: Colors.yellowAccent,
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue[900],
                            )),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            loading = true;
                            dynamic result =
                            await _auth.signInEmailPass(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Invalid email or password';
                                loading = false;
                              });
                            }
                          }
                        }),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}