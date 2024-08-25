import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DonationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Donation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Enter your location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String location = locationController.text;
                if (name.isNotEmpty && location.isNotEmpty) {
                  _launchURL();
                  await _generatePDF(name, location);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Donation successful! Invitation PDF generated."),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please fill in your details."),
                    ),
                  );
                }
              },
              child: Text('Donate and Get Invitation'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    const url =
        'https://www.buymeacoffee.com/yourprofile'; // Replace with your actual donation URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _generatePDF(String name, String location) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text(
              "Invitation to Durga Puja\n\nName: $name\nLocation: $location"),
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File("${directory.path}/invitation.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
