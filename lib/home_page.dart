import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'show_image.dart';

// --------------------------------------------------------------------------------------------------------------
// --------------------------------------------- Image Paths -----------------------------------
// --------------------------------------------------------------------------------------------------------------

List<ImageDetails> _images = [
  ImageDetails(imagePath: 'images/1.jpg'),
  ImageDetails(imagePath: 'images/7.png'),
  ImageDetails(imagePath: 'images/6.png'),
  ImageDetails(imagePath: 'images/2.png'),
  ImageDetails(imagePath: 'images/3.jpg'),
  ImageDetails(imagePath: 'images/4.png'),
  ImageDetails(imagePath: 'images/5.png'),
  ImageDetails(imagePath: 'images/9.jpg'),
  ImageDetails(imagePath: 'images/10.jpg'),
  ImageDetails(imagePath: 'images/11.png'),
  ImageDetails(imagePath: 'images/12.jpg'),
  ImageDetails(imagePath: 'images/13.jpg'),
  ImageDetails(imagePath: 'images/14.jpg'),
  ImageDetails(imagePath: 'images/15.jpg'),
  ImageDetails(imagePath: 'images/16.jpg'),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --------------------------------------------- Header Container -----------------------------------
      backgroundColor: const Color.fromARGB(255, 87, 166, 232),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "Gallery",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),

          // --------------------------------------------------------------------------------------------------------------
          // -------------------------------------------- Main Thumbnail Container -----------------------------------
          // --------------------------------------------------------------------------------------------------------------

          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 232, 229, 229),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            // --------------------------------------------------------------------------------------------------------------
            // -------------------------------------------- Thumbnails -----------------------------------
            // --------------------------------------------------------------------------------------------------------------
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return RawMaterialButton(
                  onPressed: () {
                    // ----------------------- Opening Images in ShowImage ---------------
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // ----------------------- Sending Path For Opening Images in ShowImage ---------------
                            ShowImage(
                          imagePath: _images[index].imagePath,
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "logo$index",
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(

                            // ----------------------- Path For Thumbnails here ---------------

                            image: AssetImage(_images[index].imagePath),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                );
              },
              // ------ Containers to be created ----
              itemCount: _images.length,
            ),
          ))
        ],
      )),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------
// ------------------------------------- Varibales for storing Image Details ----------------------------------
// --------------------------------------------------------------------------------------------------------------

class ImageDetails {
  final String imagePath;
  ImageDetails({required this.imagePath});
}
