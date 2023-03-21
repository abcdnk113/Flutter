import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; 
import 'package:iconify_flutter/icons/material_symbols.dart'; 



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: w*.12,horizontal: h*.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(              
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('images/avatar.png',
                    width: 38,
                    height: 40,
                    fit: BoxFit.cover,                    
                  ),
                ),
                const SizedBox(width: 10,),
                Column(  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,                  
                  children: [
                    Text('Britney Glayers',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 12)),
                    Row(
                      children: [
                        Text('New York-USA',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 12),),
                        const Iconify(MaterialSymbols.keyboard_arrow_down_rounded)
                      ],
                    )
                  ],
                ),
                const Spacer(),
                const Iconify(MaterialSymbols.dashboard_outline) // widget               
              ],
            ),
            const SizedBox(height: 48,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Feels Like A good',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 24),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('time to ride a bike',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 24),),
                        const SizedBox(width: 20,),
                        Image.asset('images/bike.png',width: 24,height: 24,fit: BoxFit.cover,),
                      ],
                    ),
                  ],
                ),                
              ],
            ),            
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/weather.png',width: 375,height: 375,fit: BoxFit.cover,),
            ],),
            const SizedBox(height: 39,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Today's Mood",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 14),),
                    Text('Very Good',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 12),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tomorrow's Mood",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 14),),
                    Text('Excelent',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 12),)
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}