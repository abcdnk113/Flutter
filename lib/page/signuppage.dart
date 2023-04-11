import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/auth_services.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController repassController = TextEditingController();

    bool showPass = false;
    bool showRePass = false;
    bool isEmailValidate = true;
    bool isPassValidate = true;
    bool isRePassValidate = true;

    final _formKey = GlobalKey<FormState>();
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
                  height: 30,
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
                                hintText: "Email",
                                hintStyle: GoogleFonts.poppins(
                                    color: Colors.grey[500], fontSize: 16)),
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                isEmailValidate = false;
                              }
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          style: GoogleFonts.poppins(fontSize: 16),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          obscureText: !showPass,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
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
                              hintText: "Password",
                              errorText: !isPassValidate
                                  ? "Please enter your password!"
                                  : null,
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey[500],
                                fontSize: 16,
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          style: GoogleFonts.poppins(fontSize: 16),
                          controller: repassController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          obscureText: !showRePass,
                          decoration: InputDecoration(
                              errorText: !isRePassValidate
                                  ? "Please enter your confirm password!"
                                  : null,
                              suffixIcon: InkWell(
                                  child: !showRePass
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
                              hintText: "Confirm Password",
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey[500], fontSize: 16)),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 30,
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
                const SizedBox(height: 26),
                Center(
                    child: Text(
                  'Sign up with',
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
                          onTap: () {},
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
                  height: 40,
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
                      onPressed: () async{
                        await authService.createUserWithEmailAndPassword(
                            emailController.text, passwordController.text);
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
              ]),
        ),
      ),
    );
  }
}
