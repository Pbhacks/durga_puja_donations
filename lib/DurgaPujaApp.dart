import 'package:flutter/material.dart';

void main() {
  runApp(DurgaPujaApp());
}

class DurgaPujaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF121212),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Updated from bodyText2 to bodyMedium
        ),
      ),
      home: DurgaPujaWebsite(),
    );
  }
}

class DurgaPujaWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          buildSection(
            context,
            'Durga Puja: A Celebration of Divine Power and Cultural Heritage',
            'Durga Puja, a vibrant and deeply rooted festival celebrated primarily in West Bengal, India, is a time for joyous festivities, spiritual reflection, and community bonding. This festival pays homage to Goddess Durga, the embodiment of strength, power, and the triumph of good over evil.',
            'assets/images/durga_mata_image.jpg',
            animationType: AnimationType.slideInLeft,
          ),
          buildSection(
            context,
            'Origin and History of Durga Puja',
            'The roots of Durga Puja can be traced back to ancient Hindu scriptures, particularly the Devi Bhagavata Purana, which narrates the tale of Goddess Durga\'s victory over the demon Mahishasura. The festival is believed to have originated in the 16th century with the introduction of the \'Daker Saaj\' (traveling idols) during the reign of the Mughal Emperor Akbar.',
            'assets/images/history_image.png',
            animationType: AnimationType.fadeIn,
          ),
          buildSection(
            context,
            'Significance of Goddess Durga',
            'Goddess Durga, also known as Mahishasuramardini, represents the ultimate feminine power, strength, and resilience. She is depicted with ten arms wielding various weapons and riding a lion, symbolizing her courage and prowess.',
            'assets/images/durga_maa_significance.png',
            animationType: AnimationType.slideInRight,
          ),
          buildSection(
            context,
            'Preparation and Celebration',
            'The preparations for Durga Puja begin weeks in advance. People engage in cleaning their homes, decorating their pandals, and creating elaborate idols of Goddess Durga. The festival officially commences with the \'Mahalaya\' (ancestral worship) and culminates with the \'Vijaya Dashami\' (victory day).',
            'assets/images/preparation_celebration.png',
            animationType: AnimationType.fadeIn,
          ),
          buildSection(
            context,
            'Rituals and Customs',
            'The core ritual of Durga Puja involves the daily worship of Goddess Durga known as \'puja\'. This includes offerings of flowers, incense, and prasad (blessed food). \'Arati\', a ceremony where lamps are waved before the deity, is an essential part of the puja.',
            'assets/images/rituals_customs.png',
            animationType: AnimationType.slideInLeft,
          ),
          buildSection(
            context,
            'Durga Puja Pandals and Idols',
            'Durga Puja pandals are temporary structures erected across the city, serving as the focal point for the festival. They are elaborately decorated with lights, flowers, and traditional artwork showcasing the creativity and artistry of local artisans.',
            'assets/images/pandals_idols.png',
            animationType: AnimationType.slideInRight,
          ),
          buildSection(
            context,
            'Durga Puja Processions and Immersion',
            'On the last day of the festival, the idols of Goddess Durga are carried in grand processions through the streets, accompanied by music, dancing, and jubilant crowds. This signifies the return of Durga to her heavenly abode. The immersion ceremony is a poignant and emotional event marking the end of the festivities.',
            'assets/images/procession_immersion.png',
            animationType: AnimationType.fadeIn,
          ),
          buildSection(
            context,
            'Durga Puja and Bengali Culture',
            'Durga Puja fosters a strong sense of community spirit. People from all walks of life come together, regardless of their social status or religious beliefs, to celebrate the festival. It strengthens social bonds and promotes harmony.',
            'assets/images/bengali_culture.png',
            animationType: AnimationType.slideInLeft,
          ),
          buildSection(
            context,
            'Conclusion: Celebrating the Triumph of Good Over Evil',
            'Durga Puja is not just a religious festival; it is a powerful cultural expression of hope, resilience, and the triumph of good over evil. Through its rituals, customs, and vibrant celebrations, Durga Puja reinforces the values of strength, righteousness, and unity, inspiring individuals to stand against adversity and embrace the power of the divine feminine.',
            'assets/images/conclusion.png',
            animationType: AnimationType.slideInRight,
          ),
        ],
      ),
    );
  }

  Widget buildSection(BuildContext context, String title, String description, String imagePath,
      {AnimationType animationType = AnimationType.fadeIn}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedText(
            text: title,
            animationType: animationType,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 20),
          ParallaxImage(imagePath: imagePath),
          SizedBox(height: 20),
          AnimatedText(
            text: description,
            animationType: animationType,
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey[300], // Light grey for readability
            ),
          ),
        ],
      ),
    );
  }
}

enum AnimationType { fadeIn, slideInLeft, slideInRight }

class AnimatedText extends StatelessWidget {
  final String text;
  final AnimationType animationType;
  final TextStyle textStyle;

  AnimatedText({required this.text, required this.animationType, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        switch (animationType) {
          case AnimationType.slideInLeft:
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(animation),
              child: child,
            );
          case AnimationType.slideInRight:
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation),
              child: child,
            );
          case AnimationType.fadeIn:
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
      child: Text(
        text,
        key: ValueKey<String>(text),
        style: textStyle,
      ),
    );
  }
}

class ParallaxImage extends StatelessWidget {
  final String imagePath;

  ParallaxImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }
}