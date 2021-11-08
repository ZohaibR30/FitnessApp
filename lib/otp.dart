import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  const Color(0xFF001D4B),
//          title: const Center(child: Text('Login Page')),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0,left: 20,right: 20),
                child: Text(
                  "Verification",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize:35,
                    color: Color(0xFF001D4B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Enter 4 Digit Code",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                style:
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF001D4B),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF001D4B),

                    ),
                    borderRadius: BorderRadius.circular(10),

                  ),
                prefix: const Padding(padding: EdgeInsets.symmetric(horizontal: 5),

                  ),),

                ),

                ),


              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: MaterialButton(onPressed: () {

                },
                  height: 60,
                  minWidth: 250,
                  color: const Color(0xFF001D4B),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),

                  child: const Text("Verify",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


