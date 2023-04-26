import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/page/navigationpage/bottomnavigation.dart';

class ErrPage extends StatelessWidget {
  const ErrPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'images/404.png',
              width: 378,
              height: 231,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Ops nothin's here",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const Spacer(flex: 1),
          SizedBox(
            width: w - 84,
            height: 62,
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bottomNavigationBar(),
                  ),
                );
              },
              child: Text(
                "Lets Go Home",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
