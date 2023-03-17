import 'package:flutter/material.dart';

class LetsPage extends StatelessWidget {
  const LetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(      
      body: Container(
        padding: EdgeInsets.symmetric(vertical: w*.12,horizontal: h*.04),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Let's See",style: TextStyle(fontSize: 42.16),textAlign: TextAlign.left,),         
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text('The ',style: TextStyle(fontSize: 42.16),),
                    Icon(Icons.star),
                  ],
                ),
                const Text('Weather',style: TextStyle(fontSize: 42.16),textAlign: TextAlign.left,),
                const Text('Around you',style: TextStyle(fontSize: 42.16),textAlign: TextAlign.left,),
              ],
            ),
          ),

          const SizedBox(height: 100,),
          SizedBox(                 
            width: w-84,
            height: 62,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:const MaterialStatePropertyAll<Color>(Color.fromRGBO(12, 18, 26, 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  )
                )            
              ),
              onPressed: (){                                               
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const LetsPage()));                      
              }, child: const Text("Let's Check",style: TextStyle(color: Colors.white,fontSize: 20),),              
            ),
          ),
        ]),),
        
    );
  }
}
