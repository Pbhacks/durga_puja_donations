import 'dart:ui';
import 'package:durga_puja_donations/events.dart';
import 'package:durga_puja_donations/playlist_page.dart';
import 'package:durga_puja_donations/trivia.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'DurgaPujaApp.dart';
import 'donation_page.dart';
import 'gallery_page.dart';
import 'initial_page.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Durga Puja Donations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.copyWith(
                displayLarge: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                displayMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
        ),
      ),
      home: BallBounceIndex(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToInitialPage();
  }

  _navigateToInitialPage() async {
    // Delay for 3 seconds (or however long you want the splash screen to display)
    await Future.delayed(const Duration(seconds: 3), () {});

    // Navigate to the initial page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => InitialPage(
                title: 'abc',
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
// Continue with the rest of your code...

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: FadeInDown(
          child: Text(
            'Durga Puja Donations',
            style: Theme.of(context).textTheme.displayMedium,
            selectionColor: Colors.lightBlue,
          ),
        ),
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Replace with your background image asset
              fit: BoxFit.cover,
            ),
          ),
          // Blurred Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElasticIn(
                    child: Text(
                      'Welcome to the Durga Puja Donation App!',
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    child: Text(
                      'The Durga Puja Association has been celebrating the vibrant and auspicious festival of Durga Puja since 1988. Over the years, we have organized numerous grand events, cultural programs, and community services. Our dedication to preserving and promoting the rich traditions of Durga Puja has earned us many accolades and the love and respect of our community. Join us in our ongoing efforts to celebrate this festival with the spirit and devotion it deserves.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.monetization_on,
                          color: Colors.white),
                      label: const Text(
                        'Make a Donation',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonationPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.photo_album, color: Colors.white),
                      label: const Text(
                        'View Gallery',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upcoming Events',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Community Service Day',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Join us for a day of community service and make a difference in our neighborhood.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '2. Cultural Dance Workshop',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Participate in our workshop to learn traditional dance forms and celebrate our culture.',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          child: Text(
                            'Contact Us',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email: contact@durga_puja.com',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Phone: +1 234 567 890',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Address: 123 Festival Lane, Puja City, PC 12345',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Durga Puja Information',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(height: 600, child: DurgaPujaApp()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return const AnimatedDrawer();
  }
}

class AnimatedDrawer extends StatefulWidget {
  const AnimatedDrawer({super.key});

  @override
  _AnimatedDrawerState createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  final List<Color> _colors = [
    Colors.deepPurple,
    Colors.purpleAccent,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: _colors[0], end: _colors[1]),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: _colors[1], end: _colors[0]),
        weight: 1.0,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _colorAnimation.value!,
                  _colorAnimation.value!.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Drawer Header
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          'assets/logo.png', // Replace with your logo image asset
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Durga Puja Association',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Drawer Items
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItem(
                        context,
                        icon: Icons.home,
                        title: 'Home',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.video_collection,
                        title: 'Playlists',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlaylistsPage()),
                          );
                        },
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.monetization_on,
                        title: 'Donations',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonationPage()),
                          );
                        },
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.info,
                        title: 'About Us',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUsPage()),
                          );
                        },
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.photo_album,
                        title: 'Gallery',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryPage()),
                          );
                        },
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.quiz,
                        title: 'Trivia Quiz',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TriviaPage()),
                          );
                        },
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.event,
                        title: 'Events Page',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventsPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Footer
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '© 2023 Durga Puja Association',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.purpleAccent, size: 28),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}

class AboutUsPage extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'Durga Puja 2023',
      'description': 'Grand celebration with cultural events and rituals.',
      'image': 'assets/events.jpg' // Replace with your event image assets
    },
    {
      'title': 'Community Service 2022',
      'description':
          'Helping the community with various charitable activities.',
      'image': 'assets/event2.jpg' // Replace with your event image assets
    },
    {
      'title': 'Cultural Fest 2021',
      'description': 'A showcase of traditional dance and music.',
      'image': 'assets/event3.jpg' // Replace with your event image assets
    },
  ];

  AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Features and Events',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'The Durga Puja Association takes pride in its rich heritage and the numerous events it organizes each year. Our key features include:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.star, color: Colors.purpleAccent),
              title: Text('Grand Durga Puja Celebrations'),
              subtitle: Text(
                  'Join us for the most vibrant and grand Durga Puja celebrations.'),
            ),
            const ListTile(
              leading: Icon(Icons.star, color: Colors.purpleAccent),
              title: Text('Cultural Programs'),
              subtitle: Text(
                  'Experience traditional dance, music, and art from various cultures.'),
            ),
            const ListTile(
              leading: Icon(Icons.star, color: Colors.purpleAccent),
              title: Text('Community Services'),
              subtitle: Text(
                  'We actively participate in charitable activities and community services.'),
            ),
            const SizedBox(height: 20),
            Text(
              'Recent Events',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            Column(
              children: events.map((event) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        event['image']!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          event['title']!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          event['description']!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
