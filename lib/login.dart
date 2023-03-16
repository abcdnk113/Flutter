import 'package:flutter/material.dart';
import 'components/textfield.dart';

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
    return Scaffold(      
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Colors.white,Colors.black
            ]
          )
        ),
        padding: const EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Login',textAlign: TextAlign.left,style: TextStyle(color:Colors.black,fontSize: 36),),
            const SizedBox(height: 5,),
            const Text('Enter your account details to login',textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 16),),
            const SizedBox(height: 30,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(controller: usernameController, hintText: 'stephen@gmail.com', obscureText: false),
                  const SizedBox(height: 20,),
                  MyPasswordTextField(controller: passwordController,hintText: '',obscureText: false,)
                ],
              )
            ),
            const SizedBox(height: 10,),
            const Align(alignment: Alignment.topRight,child: Text('Forgot password?',),),
            const SizedBox(height: 20,),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0),
                    child: Text('or',style: TextStyle(color: Colors.black, fontSize: 16),),
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
            const SizedBox(height: 20),
            const Center(child: Text('Sign in with',style: TextStyle(fontSize: 28,color: Colors.white),)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Tap');
                      },
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
                    const SizedBox(height: 10,),
                    const Text('Google',style: TextStyle(fontSize: 16,color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Tap');
                      },
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
                    const SizedBox(height: 10,),
                    const Text('Apple',style: TextStyle(fontSize: 16,color: Colors.white),)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30,),
            SizedBox(
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
                  if (_formKey.currentState!.validate()) {                          
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const Page()));
                  }
                }, child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 28),),              
              ),
            ),
            const Expanded(child: SizedBox(height: 5,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Text("I'm new here",style: TextStyle(fontSize: 20,decoration: TextDecoration.underline,color: Colors.white),),                
                Icon(Icons.arrow_forward,color: Colors.white,)
              ],
            ),
          ]
        ), 
      ),
    );
  }
}