import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:metrorun/screens/authenticate/sign_in.dart';
import 'package:metrorun/screens/services/auth.dart';
import 'package:metrorun/screens/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String name = '';
  String email = '';
  String initialPassword = '';
  String confirmPassword = '';
  String username = '';
  String phoneNumber = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.cyan[100],
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
              backgroundColor: Colors.blue[900],
              title: Text('Create an account with Metro Run'),
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter name' : null,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              hintText: 'Enter full name',
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
                              setState(() => name = val);
                            }),
                        SizedBox(height: 25.0),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter username' : null,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Create a username',
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
                              setState(() => username = val);
                            }),
                        SizedBox(height: 25.0),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter phone number' : null,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(10),
                              WhitelistingTextInputFormatter.digitsOnly,
                              BlacklistingTextInputFormatter
                                  .singleLineFormatter,
                            ],
                            decoration: InputDecoration(
                              labelText: 'Phone number',
                              hintText: 'Enter your 10 digit number',
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
                              setState(() => phoneNumber = val);
                            }),
                        SizedBox(height: 25.0),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter email' : null,
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
                        SizedBox(height: 25.0),
                        TextFormField(
                            validator: (val) =>
                                val.length < 6 ? 'Enter password' : null,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Atleast 6 characters long',
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
                              setState(() => initialPassword = val);
                            }),
                        SizedBox(height: 25.0),
                        TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'Re-enter password'
                                : val != initialPassword
                                    ? 'Passwords do not match'
                                    : null,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Re-enter your password',
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
                              setState(() => confirmPassword = val);
                            }),
                        SizedBox(height: 100.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: ButtonTheme(
                            height: 60.0,
                            child: RaisedButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                ),
                                splashColor: Colors.yellowAccent,
                                color: Colors.orange,
                                child: Text('Register',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue[900],
                                    )),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    widget.toggleView();
                                    loading = true;
                                    dynamic result = await _auth.regEmailPass(
                                        email: email,
                                        confirmPassword: confirmPassword,
                                        name: name,
                                        username: username,
                                        phoneNum: phoneNumber);
                                    print("result is$result");
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Please re-register with valid details';
                                        loading = false;
                                        print("name is $name");
                                        // AuthService(
                                        //     name: name,
                                        //     username: username,
                                        //     phoneNumber: phoneNumber);
                                        print("result is null");
                                      });
                                    }
                                  }
                                }),
                          ),
                        ),
                        Center(
                          child: Text(error,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    ))));
  }
}
