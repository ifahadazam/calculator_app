import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: Image.asset('lib/images/splash_image.png')),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Need Assistance',
                style: GoogleFonts.lobster(
                    letterSpacing: 2.5,
                    color: Color(0xff306688),
                    fontWeight: FontWeight.w800,
                    fontSize: 35),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'By Engr. FAHAD',
                style: GoogleFonts.ibmPlexMono(
                    color: Color(0xff306688),
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff306688))),
                  child: Text(
                    'Lets Calculate!',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
