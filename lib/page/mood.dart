import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; 
import 'package:iconify_flutter/icons/material_symbols.dart'; 

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: w*.12,horizontal: h*.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const Iconify(MaterialSymbols.dashboard_outline,size: 32,color: Colors.black54,)              
              ],
            ),
            const SizedBox(height: 44,),
            Text('How You feel Today ?',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 24),),        
          ]
        )
      )
    );
  }
}