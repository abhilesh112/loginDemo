import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/UI/home_screen.dart';
import 'package:testproject/api/network.dart';
import 'package:testproject/widgets/social_login.dart';

import '../widgets/login_Button.dart';

class LogINScreen extends StatefulWidget {
  const LogINScreen({super.key});

  @override
  State<LogINScreen> createState() => _LogINScreenState();
}

class _LogINScreenState extends State<LogINScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  late bool checkvalue = false;
NetworkUtil networkUtil = NetworkUtil(); 
  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackbar = SnackBar(
      content: Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState;
    
    networkUtil.getCoinData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xff002c7b)));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        key: scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildText("Login".toUpperCase(), 18,
                          Alignment.centerLeft, Color(0xff464646)),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildText(
                          "Email", 18, Alignment.centerLeft, Color(0xff464646)),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.grey)),
                              labelText: ""),
                          validator: (value) =>
                              !value!.contains('@') ? "Invalid Email" : null,
                          onSaved: (newValue) => _email = newValue!,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildText("Password", 18, Alignment.centerLeft,
                          const Color(0xff464646)),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                          ],
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.grey)),
                              labelText: ""),
                          validator: (val) =>
                              val!.length > 6 ? 'Password less then 6' : null,
                          onSaved: (val) => _password = val!,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: CheckboxListTile(
                          title: Text("Remember me ?",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xff464646))),
                          value: checkvalue,
                          onChanged: (newValue) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              checkvalue = newValue!;
                              print(newValue);
                            });
                          },
                          activeColor: Color(0xffa5a4a4),
                          checkColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.only(left: 0, top: 0),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      LoginButton(
                        centerText: "Login".toUpperCase(),
                        actionButton: () => _submit(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _buildText(
                        "Forgot Password",
                        18,
                        Alignment.bottomRight,
                        const Color(0xffa5a4a4),
                      ),
                      const SocialLogin(),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Need an account?  ",
                              style: const TextStyle(
                                  color: Color(0xff585858), fontSize: 18),
                              children: [
                            TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(
                                    height: 1.5,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff585858),
                                    decorationColor: Color(0xff585858),
                                    decorationThickness: 3,
                                    fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {})
                          ]))
                    ],
                  ))),
        ),
      ),
    );
  }

  Widget _buildText(
      String title, double fontSize, Alignment alignment, Color color) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Text(
          title,
          style: GoogleFonts.lato(
              fontSize: fontSize, fontWeight: FontWeight.w600, color: color),
        ),
      ),
    );
  }
}
