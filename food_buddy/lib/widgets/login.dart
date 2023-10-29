import 'package:flutter/material.dart';
import 'package:food_buddy/widgets/inventory.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String apiUrl = "";
  var _isLogin = true;

  var _enteredEmail = '';
  var _enteredPass = '';

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": _enteredEmail, "password": _enteredPass}));

    const yourSnackBarSuccess =
        SnackBar(content: Text('API created sucessfully.'));
    const yourSnackBarFailure = SnackBar(content: Text('API creation failed.'));

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(yourSnackBarSuccess);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(yourSnackBarFailure);
    }
  }

  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Inventory(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 600,
                    height: 250,
                    /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/food_buddy.jpeg'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredEmail = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return 'Password must be atleast 6 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredPass = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child: Text(_isLogin ? 'Login' : 'Signup'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(_isLogin
                    ? 'Create an account'
                    : 'I already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
