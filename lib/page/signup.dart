import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/auth_services.dart';
import '../provider/signup_provider.dart';

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

  final formKey = GlobalKey<FormState>();

  late SignupState? signupState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      layoutComplete();
    });
  }

  void layoutComplete() {    
    signupState?.passwordController.clear();
    signupState?.repassController.clear();
  }

  @override
  Widget build(BuildContext context) {
    signupState = Provider.of<SignupState>(context, listen: false);
    final authService = Provider.of<AuthService>(context);

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
                  key: formKey,
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
                            // errorText: !isEmailValidate
                            //     ? "Please enter your email"
                            //     : null,
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Email",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[500], fontSize: 16)),
                        // onTap: () {
                        //   if (emailController.text.isEmpty) {
                        //     isEmailValidate = false;
                        //   }
                        // }
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer<SignupState>(
                          builder: (context, signupstate, child) {
                        return TextFormField(
                          style: GoogleFonts.poppins(fontSize: 16),
                          controller: signupstate.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          obscureText: !signupstate.showPass,
                          // onChanged: (value) => {
                          //   signupstate.passwordController.text = value
                          // },
                          decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: InkWell(
                                onTap: () => {
                                  signupstate.changePass(),
                                },
                                child: !signupstate.showPass
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
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
                              // errorText: !isPassValidate
                              //     ? "Please enter your password!"
                              //     : null,
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[500],
                                fontSize: 16,
                              )),
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer<SignupState>(
                          builder: (context, signupstate, child) {
                        return TextFormField(
                          style: GoogleFonts.poppins(fontSize: 16),
                          controller: signupState?.repassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          obscureText: !signupState!.showRePass,
                          decoration: InputDecoration(
                            // errorText: !isRePassValidate
                            //     ? "Please enter your confirm password!"
                            //     : null,
                            suffixIcon: InkWell(
                              onTap: () => {
                                signupstate.changeRePass(),
                              },
                              child: !signupstate.showRePass
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(18)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[500], fontSize: 16),
                          ),
                        );
                      })
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
                        onTap: () => AuthServices().signInWithGoogle(),
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
                    onPressed: () async {
                      await authService.createUserWithEmailAndPassword(
                          emailController.text,
                          signupState?.passwordController.text ?? "");
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(context, "/login");
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
}
