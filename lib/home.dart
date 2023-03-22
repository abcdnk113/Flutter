import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; 
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/network/request.dart'; 



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<WeatherClass> futureWeather;

  @override

  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

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
                const Iconify(MaterialSymbols.dashboard_outline,size: 32,color: Colors.black38,) // widget               
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
            // LayoutBuilder(
            //   builder: (context, constraints) => Stack(
            //     children: [ 
            //       Image.asset('images/weather.png',width: 400,height: 400,fit: BoxFit.cover,),
            //       Positioned(
            //         left: 100,
            //         top: 155,                    
            //         child: Text('25°',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 44,color: Colors.white),)
            //       ),
            //     ],
            //   )
            // ),

            Center(
            child: FutureBuilder<WeatherClass>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return 
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children:[
                        Image.asset('images/circle.png',width: 420,height: 420,fit: BoxFit.cover,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${snapshot.data?.main?.temp?.round().toString()}°C",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 44,color: Colors.white),),
                            Image.network("https://openweathermap.org/img/w/${snapshot.data?.weather![0].icon}.png",width: 100,height: 100,fit: BoxFit.cover,)
                          ],
                        ),
                      ]
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }  
              // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),            
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