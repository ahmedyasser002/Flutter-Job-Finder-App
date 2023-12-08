import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passObsecure = true;
  var textFieldColor = const Color(0xFF3366FF);
  var passTextColor = const Color(0xFF9CA3AF);
  bool isNullFields = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      passObsecure = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back),
                  Image.asset(
                    'assets/splash_logo.png',
                    width: 81,
                    height: 19,
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 63, bottom: 16),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  )),
              const Padding(
                padding: EdgeInsets.only(bottom: 34),
                child: Text(
                  'Please create an account to find your dream job',
                  style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
                ),
              ),
              TextField(
                onChanged: (value) {
                  if (value.length < 8) {
                    setState(() {
                      textFieldColor = const Color(0xFFFF472B);
                    });
                  } else {
                    setState(() {
                      textFieldColor = const Color(0xFF3366FF);
                    });
                  }
                  if (value.length > 0) {
                    setState(() {
                      isNullFields = false;
                    });
                  } else {
                    setState(() {
                      isNullFields = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(LineIcons.user),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.black
                            : Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFFD1D5DB),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: textFieldColor),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextField(
                    onChanged: (value) {
                      if (value.length < 8) {
                        setState(() {
                          textFieldColor = const Color(0xFFFF472B);
                        });
                      } else {
                        setState(() {
                          textFieldColor = const Color(0xFF3366FF);
                        });
                      }
                      if (value.length > 0) {
                        setState(() {
                          isNullFields = false;
                        });
                      } else {
                        setState(() {
                          isNullFields = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(LineIcons.envelope),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? Colors.black
                                : Colors.grey),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFFD1D5DB),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: textFieldColor),
                        ))),
              ),
              TextField(
                onChanged: (value) {
                  if (value.length < 8) {
                    setState(() {
                      textFieldColor = const Color(0xFFFF472B);
                      passTextColor = const Color(0xFFFF472B);
                    });
                  } else {
                    setState(() {
                      textFieldColor = const Color(0xFF3366FF);
                      passTextColor = const Color(0xFF60C631);
                    });
                  }
                  if (value.length > 0) {
                    setState(() {
                      isNullFields = false;
                    });
                  } else {
                    setState(() {
                      isNullFields = true;
                    });
                  }
                },
                obscureText: passObsecure,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(LineIcons.lock),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.black
                            : Colors.grey),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passObsecure = !passObsecure;
                          });
                        },
                        icon: Icon(passObsecure
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    suffixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.black
                            : Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFFD1D5DB),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: textFieldColor),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Password must be at least 8 characters',
                  style: TextStyle(color: passTextColor, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 126),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xFF3366FF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  // width: 317,
                  height: 48,
                  decoration: BoxDecoration(
                      color: isNullFields
                          ? const Color(0xFFD1D5DB)
                          : const Color(0xFF3366FF),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1000))),
                  child: Center(
                      child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: isNullFields
                            ? const Color(0xFF6B7280)
                            : const Color(0xFFFFFFFF),
                        fontSize: 16),
                  )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 35),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Color(0xFFD1D5DB),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or Sign up With Account",
                      style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Color(0xFFD1D5DB),
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 33),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(width: 1, color:const Color(0xFFD1D5DB))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LineIcons.googlePlus , color: Colors.red,),
                            SizedBox(width: 10,),
                            Text('Google' , style: TextStyle(color: Color(0xFF363F5E),fontSize: 14),)
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(width: 1, color: const Color(0xFFD1D5DB))),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LineIcons.facebook , color: Colors.blue,),
                            SizedBox(width: 10,),
                            Text('Facebook' , style: TextStyle(color: Color(0xFF363F5E),fontSize: 14),)
                          ],
                        ),
                    )),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
