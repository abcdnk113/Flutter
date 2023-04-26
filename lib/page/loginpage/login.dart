import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/page/navigationpage/bottomnavigation.dart';
import 'package:weather/page/signuppage/signup.dart';
import 'package:weather/page/loginpage/login_provider.dart';
import '../../components/textfield.dart';
import '../../components/widget.dart';
import '../../services/auth_services.dart';

// ignore: must_be_immutable
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();

  late LoginState? loginState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      layoutComplete();
    });
  }

  void layoutComplete() {
    loginState?.passwordController.clear();
    loginState?.emailController.clear();
  }

  Future loginbyGoogle() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await AuthService().signOut();
    }
    await AuthService().signInWithGoogle();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => bottomNavigationBar(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    loginState = Provider.of<LoginState>(context);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h,
        padding: EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.white,Colors.black]
        //   )
        // ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(12, 24, 35, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Enter your account details to login.',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(12, 24, 35, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextField(
                      controller: loginState?.emailController,
                      hintText: "stephen@gmail.com",
                      onChanged: () {
                        loginState?.changeEmailValidate();
                      },
                    ),
                    const SizedBox(height: 10),
                    MyPasswordTextField(
                      controller: loginState?.passwordController,
                      hintText: "",
                      obscureText: loginState!.showPass,
                      onChanged: () {
                        loginState?.changePassValidate();
                      },
                      onTav: () {
                        loginState?.changePassValidate();
                      },
                      onTap: () {
                        loginState?.changeVisiblity();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              //--------or-------
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromRGBO(12, 24, 35, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromRGBO(12, 24, 35, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Sign in with',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: const Color.fromRGBO(12, 24, 35, 1),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: loginbyGoogle,
                        //() => AuthService().signInWithGoogle(),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(41),
                            color: const Color.fromRGBO(12, 24, 35, 1),
                          ),
                          padding: const EdgeInsets.all(25),
                          child: Image.asset(
                            'images/google.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Google',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color.fromRGBO(12, 24, 35, 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // final credential =
                          //     await SignInWithApple.getAppleIDCredential(
                          //   scopes: [
                          //     AppleIDAuthorizationScopes.email,
                          //     AppleIDAuthorizationScopes.fullName,
                          //   ],
                          // );
                          // // ignore: use_build_context_synchronously
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const LetsPage(),
                          //   ),
                          // );
                          // // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
                          // // after they have been validated with Apple (see `Integration` section for more information on how to do this)
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(41),
                            color: const Color.fromRGBO(12, 24, 35, 1),
                          ),
                          padding: const EdgeInsets.all(25),
                          child: Image.asset(
                            'images/apple.png',
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Apple',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color.fromRGBO(12, 24, 35, 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 62,
                  width: w - 84,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(12, 24, 35, 1),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    child: Text(
                      "I'm new here",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        color: const Color.fromRGBO(12, 24, 35, 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(12, 24, 35, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    if (loginState!.isEmailValidate && loginState!.isPassValidate) {
      if (_formKey.currentState!.validate()) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: loginState!.emailController.text,
              password: loginState!.passwordController.text);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => bottomNavigationBar()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            showSnackBar(context, "User not found", Colors.red);
          } else if (e.code == 'wrong-password') {
            showSnackBar(context, "Wrong password", Colors.red);
          }
        }
      }
    } else {
      showSnackBar(context, "Invalid mail or password", Colors.red);
    }
  }
}
