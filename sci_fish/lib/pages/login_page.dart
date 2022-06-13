import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sci_fish/constants.dart';
import 'package:sci_fish/pages/control_page.dart';
import 'package:sci_fish/pages/signup_page.dart';

final _formKey = GlobalKey<FormState>();


class LoginPage  extends StatefulWidget {
  static const String id = 'login_page';
  const LoginPage ({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State <LoginPage> {

  //form key
  //editing controller
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController =  TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    //email field
    final emailField =TextFormField(
        autofocus: false ,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if(value!.isEmpty){
            return ("Please Enter Your Email");
          }
          //reg expression for email validation
          if(!RegExp("^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value))
          {
            return("Please Enter Valid Email");
          }
          return null;

        },
        onSaved: (value)
        {
          emailController.text = value!;

        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
              borderRadius : BorderRadius.circular(10)
          ),
        ));


    //password field
    final passwordField = TextFormField(
        autofocus: false ,
        controller: passwordController,
        obscureText: true,
        validator: (value){
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty)
          {
            return ("Password is required for login ");
          }
          if(!regex.hasMatch(value))
          {
            return("Enter Valid Password(Min 6 Characters)");
          }
        },
        onSaved: (value)
        {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius : BorderRadius.circular(10)
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: activeCardColor,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailController.text, passwordController.text);
          Navigator.pushNamed(context, ControlPage.id);
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style:TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    SizedBox(
                        height: 200 ,
                        child: Image.asset("assets/images/logo.png",fit: BoxFit.contain,),
                    ),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account ? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SignupPage.id);
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,fontSize: 15),
                            ),),
                        ]),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login function
  void signIn(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ControlPage())),
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });

    }
  }
}


