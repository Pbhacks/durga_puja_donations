import 'package:flutter/material.dart';
import 'dart:ui'; // Import for ImageFilter
import 'main.dart'; // Import your main app file

class StarterScreen extends StatefulWidget {
  const StarterScreen({super.key});

  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _page1Color1;
  late Animation<Color?> _page1Color2;

  late Animation<Color?> _page2Color1;
  late Animation<Color?> _page2Color2;

  late Animation<Color?> _page3Color1;
  late Animation<Color?> _page3Color2;

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    // Main animated gradient controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // Page 1 Gradient Colors
    _page1Color1 = ColorTween(
      begin: Colors.deepPurple,
      end: Colors.orange,
    ).animate(_controller);

    _page1Color2 = ColorTween(
      begin: Colors.pink,
      end: Colors.yellow,
    ).animate(_controller);

    // Page 2 Gradient Colors
    _page2Color1 = ColorTween(
      begin: const Color.fromARGB(255, 16, 2, 79),
      end: const Color.fromARGB(255, 59, 5, 117),
    ).animate(_controller);

    _page2Color2 = ColorTween(
      begin: Colors.indigo.shade900,
      end: Colors.black,
    ).animate(_controller);

    // Page 3 Gradient Colors
    _page3Color1 = ColorTween(
      begin: Colors.black,
      end: const Color.fromARGB(255, 3, 86, 9),
    ).animate(_controller);

    _page3Color2 = ColorTween(
      begin: const Color.fromARGB(255, 113, 7, 7),
      end: Colors.black,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Widget child,
    List<Animation<Color?>>? gradientColors,
    bool isFirstPage = false,
    bool isSecondPage = false,
  }) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          // Swiped Left
          int nextPage = _pageController.page!.toInt() + 1;
          if (nextPage < 3) {
            _pageController.animateToPage(
              nextPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      onVerticalDragEnd: (details) {
        if (!isFirstPage && !isSecondPage && details.primaryVelocity! < 0) {
          // Swiped Up
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
      child: Stack(
        children: [
          // Blurred Background Image or Animated Gradient
          Positioned.fill(
            child: isFirstPage
                ? ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Image.asset(
                      'assets/starter_background.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
                : AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors != null
                                ? [
                                    gradientColors[0].value!,
                                    gradientColors[1].value!,
                                  ]
                                : [Colors.transparent, Colors.transparent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Main Content
          Center(
            child: child,
          ),
          // Arrow for navigating to the next page
          if (isFirstPage || isSecondPage)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 36,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Swipe left to next screen 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // Arrow for navigating to HomePage
          if (!isFirstPage && !isSecondPage)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 36,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          // First page with animated title and blurred background image
          buildPage(
            gradientColors: [_page1Color1, _page1Color2],
            isFirstPage: true,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [_page1Color1.value!, _page1Color2.value!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Durga Puja Donations',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.6),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Second page with dark animated gradient background
          buildPage(
            gradientColors: [_page2Color1, _page2Color2],
            isSecondPage: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Page 2: Add your own text here about the app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(1.0),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Third page with black and red animated gradient background
          buildPage(
            gradientColors: [_page3Color1, _page3Color2],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Page 3: Add more details about the features or usage.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
