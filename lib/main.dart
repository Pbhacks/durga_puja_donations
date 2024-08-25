import 'dart:ui';

import 'package:flutter/material.dart';
import 'donation_page.dart';
import 'gallery_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Durga Puja Donations',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Durga Puja Donations'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Durga Puja Association',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.deepPurple),
              title:
                  Text('Donations', style: TextStyle(color: Colors.deepPurple)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonationPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.deepPurple),
              title:
                  Text('About Us', style: TextStyle(color: Colors.deepPurple)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album, color: Colors.deepPurple),
              title:
                  Text('Gallery', style: TextStyle(color: Colors.deepPurple)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Durga Puja Donation App!',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'The Durga Puja Association has been celebrating the vibrant and auspicious festival of Durga Puja since 1988. Over the years, we have organized numerous grand events, cultural programs, and community services. Our dedication to preserving and promoting the rich traditions of Durga Puja has earned us many accolades and the love and respect of our community. Join us in our ongoing efforts to celebrate this festival with the spirit and devotion it deserves.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 20),
              Text(
                'The Durga Puja Association has been a beacon of cultural celebration and community service since 1988. Our journey has been marked by several milestones, including the organization of grand Durga Puja celebrations, cultural events, and charitable activities. We are committed to preserving the traditions of Durga Puja and contributing positively to the community.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              Text(
                'Our Achievements:',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 10),
              Text(
                '1. **Grand Celebrations**: We have hosted some of the largest Durga Puja celebrations in the region, attracting thousands of devotees and visitors each year.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 10),
              Text(
                '2. **Cultural Events**: Our association organizes numerous cultural programs, including traditional dance performances, music concerts, and drama plays that showcase the rich cultural heritage of the festival.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 10),
              Text(
                '3. **Community Services**: We engage in various community service activities, including food drives, educational workshops, and healthcare camps, aiming to support and uplift the community.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              Text(
                'Gallery of Past Events:',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 10),
              Image.network(
                'https://example.com/durga_puja_event_1.jpg',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Image.network(
                'https://example.com/durga_puja_event_2.jpg',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Image.network(
                'https://example.com/durga_puja_event_3.jpg',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Join Us:',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 10),
              Text(
                'We invite you to be a part of our celebrations and community activities. Whether you wish to participate in our events, volunteer for our community services, or make a donation, your support is greatly valued. Together, let us continue to celebrate Durga Puja with fervor and devotion!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
