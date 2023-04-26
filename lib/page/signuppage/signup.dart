import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/components/textfield.dart';
import 'package:weather/components/widget.dart';
import 'package:weather/page/loginpage/login.dart';
import 'package:weather/services/auth_services.dart';
import 'signup_provider.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();

  // bool showPass = false;

  // bool showRePass = false;

  // bool isEmailValidate = true;

  // bool isPassValidate = true;

  // bool isRePassValidate = true;

  final _formKey = GlobalKey<FormState>();

  late SignupState? signupState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      layoutComplete();
    });
  }

  void layoutComplete() {
    signupState?.emailController.clear();
    signupState?.passwordController.clear();
    signupState?.repassController.clear();
  }

  @override
  Widget build(BuildContext context) {
    signupState = Provider.of<SignupState>(context);
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
                'Sign Up',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(12, 24, 35, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Create your account to login.',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(12, 24, 35, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                        controller: signupState?.emailController,
                        hintText: "stephen@gmail.com",
                        onChanged: () {
                          signupState?.changeEmailValidate();
                        },
                      ),
                      const SizedBox(height: 15),
                      MyPasswordTextField(
                        controller: signupState?.passwordController,
                        hintText: "",
                        obscureText: signupState!.showPass,
                        onChanged: () {
                          signupState?.changePassValidate();
                        },
                        onTav: () {
                          signupState?.changePassValidate();
                        },
                        onTap: () {
                          signupState?.changePass();
                        },
                      ),
                      const SizedBox(height: 15),
                      MyPasswordTextField(
                        controller: signupState?.repassController,
                        hintText: "",
                        obscureText: signupState!.showRePass,
                        onChanged: () {
                          signupState?.changeRePassValidate();
                        },
                        onTav: () {
                          signupState?.changeRePassValidate();
                        },
                        onTap: () {
                          signupState?.changeRePass();
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 18,
              ),
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
              const SizedBox(height: 18),
              Center(
                child: Text(
                  'Sign up with',
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
                        onTap: () => AuthService().signInWithGoogle(),
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
                        onTap: () {},
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
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 62,
                  width: w - 84,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(12, 24, 35, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      signUp();
                    },
                    child: Text(
                      'Sign Up with Email',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    if (signupState!.isEmailValidate &&
        signupState!.isRePassValidate &&
        signupState!.isPassValidate) {
      if (signupState?.repassController.text ==
          signupState?.passwordController.text) {
        if (_formKey.currentState!.validate()) {
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: signupState!.emailController.text,
                password: signupState!.passwordController.text);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyLoginPage()));
            // ignore: use_build_context_synchronously
            showSnackBar(context, 'Successfully', Colors.green);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The pass provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }          
        } 
        }else {
          showSnackBar(context, "Password is not available", Colors.red);
      }
    } else {
      showSnackBar(context, "Invalid email or password", Colors.red);
    }
  }
}
