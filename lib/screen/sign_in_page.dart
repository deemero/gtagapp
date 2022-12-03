// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
// import 'package:godriver_app/screen/menu_page.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:gtag_app/provider/auth_provider.dart';
import 'package:gtagapp/provider/auth_provider.dart';

// import 'package:gtag_app/widget/loading_view.dart';
import 'package:gtagapp/widget/loading_view.dart';

// import 'package:gtag_app/widget/primary_button.dart';
import 'package:gtagapp/widget/primary_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final TextEditingController emailC = TextEditingController();
final TextEditingController passwordC = TextEditingController();
final GlobalKey<FormState> keyForm = GlobalKey();

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Form(
        key: keyForm,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset('assets/images/gtag.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          "Welcome Back",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Sign in to continue",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      controller: emailC,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 97, 79, 79),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 188, 91, 91),
                          ),
                        ),
                        label: Text(
                          "Email ID",
                          style: GoogleFonts.aBeeZee(),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: false,
                      controller: passwordC,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 97, 79, 79),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 26, 236, 229),
                          ),
                        ),
                        label: Text(
                          "Password",
                          style: GoogleFonts.aBeeZee(),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 200),
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 105, 103, 103),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Consumer<AuthProvider>(
                      builder: (context, bloc, _) {
                        return bloc.isLoading
                            ? const LoadingView()
                            : PrimaryButton(
                                child: "SIGN IN",
                                onTap: () async {
                                  bool isValid =
                                      keyForm.currentState!.validate();
                                  if (isValid) {
                                    await bloc.login(context,
                                        email: emailC.text,
                                        password: passwordC.text);
                                  }
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:gtagapp/screen/main_menu.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final formKey = GlobalKey<FormState>();
//   void validate() {
//     if (formKey.currentState!.validate()) {
//       print("valid");
//     } else {
//       print("not valid");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Form(
//         key: formKey,
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: 200,
//                   child: Image.asset('assets/images/gtag.jpg'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 100),
//                   child: Center(
//                       child: Text("Welcome Back",
//                           style: GoogleFonts.aBeeZee(
//                               fontSize: 40, fontWeight: FontWeight.bold))),
//                 ),
//                 Center(
//                     child: Text(
//                   "Sign in to continue",
//                   style: GoogleFonts.aBeeZee(
//                       color: Colors.grey,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Cannot Be Empty';
//                     }
//                     return "Verified Your Email ";
//                   },
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: const TextStyle(
//                           color: Color.fromARGB(255, 97, 79, 79)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 188, 91, 91))),
//                       label: Text(
//                         "Email ID",
//                         style: GoogleFonts.aBeeZee(),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                           borderSide: BorderSide(color: Colors.transparent))),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Cannot Be Empty';
//                     }
//                     return "Verified Your Password ";
//                   },
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelStyle: const TextStyle(
//                           color: Color.fromARGB(255, 97, 79, 79)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 26, 236, 229))),
//                       label: Text(
//                         "Password",
//                         style: GoogleFonts.aBeeZee(),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(22),
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Center(
//                       child: Padding(
//                     padding: const EdgeInsets.only(left: 200),
//                     child: Text(
//                       "Forgot Password?",
//                       style: GoogleFonts.aBeeZee(
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 105, 103, 103)),
//                     ),
//                   )),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                     height: 55.0,
//                     child: MaterialButton(
//                         onPressed: () async {
//                           if (formKey.currentState!.validate())
//                             await MainMenuPage();

//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (_) => MainMenuPage()));
//                         },
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(80.0)),
//                         padding: EdgeInsets.all(0.0),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(255, 95, 95, 218),
//                                   Color.fromARGB(255, 41, 146, 238)
//                                 ],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(20.0)),
//                           child: Container(
//                             constraints: BoxConstraints(
//                                 maxWidth: 700.0, minHeight: 50.0),
//                             alignment: Alignment.center,
//                             child: Text(
//                               "User Login",
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 20),
//                 Container(
//                     height: 55.0,
//                     child: MaterialButton(
//                         onPressed: () async {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (_) => MainMenuPage()));
//                         },
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(80.0)),
//                         padding: EdgeInsets.all(0.0),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(255, 95, 218, 114),
//                                   Color.fromARGB(255, 115, 236, 91)
//                                 ],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(20.0)),
//                           child: Container(
//                             constraints: BoxConstraints(
//                                 maxWidth: 700.0, minHeight: 50.0),
//                             alignment: Alignment.center,
//                             child: Text(
//                               "Guest Login",
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 100),
//                 GestureDetector(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => MainMenuPage())),
//                   child: Center(
//                     child: RichText(
//                         text: TextSpan(children: [
//                       TextSpan(
//                           text: "Visit our websites ",
//                           style: GoogleFonts.aBeeZee(color: Colors.black)),
//                       TextSpan(
//                           text: "Click Here",
//                           style: GoogleFonts.aBeeZee(color: Colors.pinkAccent))
//                     ])),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
