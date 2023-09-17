import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowImage extends StatelessWidget {
  final String imagePath;
  final int index;
  const ShowImage({super.key, required this.imagePath, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 189, 189),
      body: Container(
          child: Column(
        children: [
          Expanded(
            // -----------------------Full Image Container ---------------
            child: Hero(
              tag: "logo$index",
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      // ----------------------- Image to be Opened ---------------
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high),
                ),
                // -----------------------Back Button on Image ---------------
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      "Back",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
