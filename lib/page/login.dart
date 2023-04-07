import 'package:flutter/material.dart';
import 'package:weather/page/signuppage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/services/auth_services.dart';
import '../components/validate.dart';
import '../components/widget.dart';
import 'letspage.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // text editing controllers
  bool isEmailValidate = true;
  bool showPass = false;
  bool isPassValidate = true;

  //final controller = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future loGinbyGoogle() async {
    await AuthServices().signInWithGoogle();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LetsPage()));
  }

  Future loGin() async {
    if (isEmailValidate && isPassValidate) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LetsPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackBar(context, "User not found", Colors.red);
        } else if (e.code == 'wrong-password') {
          showSnackBar(context, "Wrong password", Colors.red);
        }
      }
    } else {
      showSnackBar(context, "Invalid mail or password", Colors.red);
    }
  }

  // sign user in method
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  height: 15,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                            style: GoogleFonts.poppins(fontSize: 16),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(18)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                errorText: !isEmailValidate
                                    ? "Please enter your email"
                                    : null,
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: "stephen@gmail.com",
                                hintStyle: GoogleFonts.poppins(
                                    color: Colors.grey[500], fontSize: 16)),
                            onChanged: (text) {
                              setState(() {
                                isEmailValidate =
                                    validateEmail(emailController.text);
                              });
                            },
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                isEmailValidate = false;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: GoogleFonts.poppins(fontSize: 16),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          obscureText: !showPass,
                          onChanged: (text) {
                            setState(() {
                              if (passwordController.text.length < 6) {
                                isPassValidate = false;
                              } else {
                                isPassValidate = true;
                              }
                            });
                          },
                          onTap: () {
                            setState(() {
                              if (passwordController.text.length < 6) {
                                isPassValidate = false;
                              } else {
                                isPassValidate = true;
                              }
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "",
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  child: !showPass
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(18)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              //hintText: "Password",
                              errorText: !isPassValidate
                                  ? "Please enter your password!"
                                  : null,
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[500],
                                fontSize: 16,
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(height: 20),
                Center(
                    child: Text(
                  'Sign in with',
                  style: GoogleFonts.poppins(
                      fontSize: 28, color: const Color.fromRGBO(12, 24, 35, 1)),
                )),
                const SizedBox(height: 35),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            loGinbyGoogle();
                          },
                          //() => AuthServices().signInWithGoogle(),//controller.login(),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(41),
                                color: const Color.fromRGBO(12, 24, 35, 1)),
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
                        Text('Google',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color.fromRGBO(12, 24, 35, 1)))
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
                                color: const Color.fromRGBO(12, 24, 35, 1)),
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
                              color: const Color.fromRGBO(12, 24, 35, 1)),
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
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color.fromRGBO(12, 24, 35, 1)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)))),
                      onPressed: () {
                        loGin();
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
                      child: Text("I'm new here",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              color: const Color.fromRGBO(12, 24, 35, 1))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(12, 24, 35, 1),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
