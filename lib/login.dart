import 'package:flutter/material.dart';
import 'components/textfield.dart';
import 'package:weather/letspage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginPage extends StatelessWidget {
  MyLoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(      
      body: Container(    
        height: h,   
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white,Colors.black]
          )
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: w*.12,horizontal: h*.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Login',textAlign: TextAlign.left,style: GoogleFonts.poppins(color:Colors.black,fontSize: 36,fontWeight: FontWeight.w400),),              
              Text('Enter your account details to login.',textAlign: TextAlign.left,style: GoogleFonts.poppins(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              const SizedBox(height: 51,),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextField(controller: usernameController, hintText: 'stephen@gmail.com', obscureText: false),
                    const SizedBox(height: 30,),
                    MyPasswordTextField(controller: passwordController,hintText: '',obscureText: false,)
                  ],
                )
              ),
              const SizedBox(height: 10,),
              Align(alignment: Alignment.topRight,child: Text('Forgot password?',style: GoogleFonts.poppins(fontSize: 16),),),
              const SizedBox(height: 30,),
              //--------or-------
              SizedBox(
                width: MediaQuery.of(context).size.width-32,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(
                        horizontal: 10.0),
                      child: Text('or',style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Center(child: Text('Sign in with',style: GoogleFonts.poppins(fontSize: 28,color: Colors.white),)),
              const SizedBox(height: 35),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(  
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(41),color: Colors.white),                                        
                          padding: const EdgeInsets.all(25),
                          child: Image.asset('images/google.png',                        
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6,),
                      Text('Google',style: GoogleFonts.poppins(fontSize: 16,color: Colors.white))
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(41),color: Colors.white),                  
                          padding: const EdgeInsets.all(25),
                          child: Image.asset('images/apple.png',                        
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6,),
                      Text('Apple',style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Center(
                child: SizedBox(
                  height: 76,
                  width: 363,
                  child: 
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:const MaterialStatePropertyAll<Color>(Color.fromRGBO(97, 97, 97, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        )
                      )            
                    ),
                    onPressed: (){                                               
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LetsPage()));                      
                    }, child: Text('Login',style: GoogleFonts.poppins(color: Colors.white,fontSize: 28),),              
                  ),
                ),
              ),
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children:[
                  Text("I'm new here",style: GoogleFonts.poppins(fontSize: 20,decoration: TextDecoration.underline,color: Colors.white),),                
                  const Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ]
          ),
        ), 
      ),
    );
  }
}