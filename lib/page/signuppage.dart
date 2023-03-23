import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/components/widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final repasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String id = '';


  Future<void> signUp() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(    
        email: usernameController.text, 
        password: passwordController.text
      
      ).then((value) {
        setState(() {
          id = value.user!.uid;
        });
      }
      );      
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      showSnackBar(context, 'Successfully', Colors.green);
    } on FirebaseAuthException catch (e){
      print(e.toString());
    };
  }

  

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(      
      body: Container(    
        height: h, 
        padding: EdgeInsets.symmetric(vertical: w*.12,horizontal: h*.04),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.white,Colors.black]
        //   )
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Sign Up',textAlign: TextAlign.left,style: GoogleFonts.poppins(color:const Color.fromRGBO(12, 24, 35, 1),fontSize: 36,fontWeight: FontWeight.w400),),              
            Text('Create your account to login.',textAlign: TextAlign.left,style: GoogleFonts.poppins(color: const Color.fromRGBO(12, 24, 35, 1),fontSize: 16,fontWeight: FontWeight.w400),),
            const SizedBox(height: 30,),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(controller: usernameController, hintText: 'Enter your email', obscureText: false),
                  const SizedBox(height: 30,),
                  MyPasswordTextField(controller: passwordController,hintText: 'Enter your password',obscureText: true,),
                  const SizedBox(height: 30,),
                  MyPasswordTextField(controller:repasswordController, hintText: 'Enter your password again', obscureText: true)
                ],
              )
            ),
            const SizedBox(height: 30,),
            //--------or-------
            SizedBox(
              width: MediaQuery.of(context).size.width-32,
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromRGBO(12, 24, 35, 1),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(
                      horizontal: 10.0),
                    child: Text('or',style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),),
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
            Center(child: Text('Sign up with',style: GoogleFonts.poppins(fontSize: 28,color: const Color.fromRGBO(12, 24, 35, 1)),)),
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(41),color: const Color.fromRGBO(12, 24, 35, 1)),                                        
                        padding: const EdgeInsets.all(25),
                        child: Image.asset('images/google.png',                        
                        fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text('Google',style: GoogleFonts.poppins(fontSize: 16,color: const Color.fromRGBO(12, 24, 35, 1)))
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(41),color:const Color.fromRGBO(12, 24, 35, 1)),                  
                        padding: const EdgeInsets.all(25),
                        child: Image.asset('images/apple.png',color: Colors.white,                        
                        fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text('Apple',style: GoogleFonts.poppins(fontSize: 16,color: const Color.fromRGBO(12, 24, 35, 1)),)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50,),
            Center(
              child: SizedBox(
                height: 62,
                width: w-84,
                child: 
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:const MaterialStatePropertyAll<Color>(Color.fromRGBO(12, 24, 35, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    )            
                  ),
                  onPressed: (){                                               
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const LetsPage())); 
                      signUp();                     
                  }, child: Text('Sign Up with Email',style: GoogleFonts.poppins(color: Colors.white,fontSize: 20),),              
                ),
              ),
            ),            
          ]
        ), 
      ),
    );
  }
}