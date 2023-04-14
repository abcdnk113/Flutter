import 'package:flutter/material.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/bottomnavigation.dart';
import 'package:weather/page/login.dart';
import '../services/auth_services.dart';

class LetsPage extends StatefulWidget {
  const LetsPage({super.key});

  @override
  State<LetsPage> createState() => _LetsPageState();
}

class _LetsPageState extends State<LetsPage> {
  Future signout() async {
    await AuthService().signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyLoginPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          Positioned(
            // because it is beyond width
            left: constraints.maxWidth * .4,
            right: -constraints.maxWidth * .4,
            top: -constraints.maxHeight * .2, // you may need to change value
            child: Image.asset(
              "images/icons/star-4.png",
              // width: constraints.maxWidth * 1.2, // because it is beyond width
              fit: BoxFit.fitWidth,
              width: 343,
              height: 343,
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
            child: Column(children: [
              const Spacer(
                flex: 4,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Let's See",
                        style: GoogleFonts.poppins(
                            fontSize: 42.16,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(12, 18, 26, 1))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('The ',
                            style: GoogleFonts.poppins(
                                fontSize: 42.16, fontWeight: FontWeight.w700)),
                        //Image.asset("images/icons/star.png",width: 49,height: 49,fit: BoxFit.cover,),
                        ImageGradient(
                            image: Image.asset(
                              'images/icons/star.png',
                              width: 36,
                              height: 39,
                            ),
                            gradient: const LinearGradient(
                                colors: [Colors.white, Colors.yellow],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter))
                      ],
                    ),
                    Text('Weather',
                        style: GoogleFonts.poppins(
                            fontSize: 42.16, fontWeight: FontWeight.w700)),
                    Text('Around you',
                        style: GoogleFonts.poppins(
                            fontSize: 42.16, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                width: w - 84,
                height: 62,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(12, 24, 35, 1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const bottomNavigationBar()));
                  },
                  child: Text(
                    "Let's Check",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {signout();}, child: Text("Back")),
              const Spacer(
                flex: 1,
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
