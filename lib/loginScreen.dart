import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  bool isHiddenPassword = true;
  final formKey = GlobalKey<FormState>();

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: const Icon(
              Icons.email,
              color: Color(0xff0d4a78),
            ),
            hintText: 'Email',
            hintStyle: const TextStyle(
              color: Colors.black38,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Name cannot be empty";
            } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              return "Name cannot contain numbers";
            } else {
              return null;
            }
          },
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            obscureText: isHiddenPassword,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color(0xff0d4a78),
              ),
              suffixIcon: InkWell(
                onTap: _tooglePasswordView,
                child: const Icon(
                  Icons.visibility,
                ),
              ),
              hintText: 'Password',
              hintStyle: const TextStyle(
                color: Colors.black38,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                return "Enter correct password";
              } else {
                return null;
              }
            },
          ),
        )
      ],
    );
  }

  Widget buildForgetPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed: () => print("Forget Password Pressed"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forget Password',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: MaterialButton(
        elevation: 5,
        onPressed: () {
          formKey.currentState!.validate();
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xff0d4a78),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x660d4a78),
                    // Color(0x990d4a78),
                    // Color(0xcc0d4a78),
                    Color(0xff0d4a78),
                  ],
                )),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 150,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        buildEmail(),
                        SizedBox(height: 10),
                        buildPassword(),
                        buildForgetPassBtn(),
                        buildRememberCb(),
                        buildLoginBtn(),
                        buildSignUpBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
