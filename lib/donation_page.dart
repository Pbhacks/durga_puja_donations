import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class DonationPage extends StatefulWidget {
  DonationPage({super.key});

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController customAmountController =
      TextEditingController(); // Add this line
  Uint8List? imageBytes;

  String result = '';
  String environmentValue = 'SANDBOX';
  String appId = '';
  String merchantId = 'PGTESTPAYUAT115';
  bool enableLogging = true;
  String saltKey = 'f94f0bb9-bcfb-4077-adc0-3f8408a17bf7';
  String saltIndex = '1';
  String body = '';
  String callback = '';
  String checksum = '';
  String packageName = '';
  String apiEndPoint = "/pg/v1/pay";

  @override
  void initState() {
    super.initState();
    initPayment();
    body = getChecksum(11).toString();
  }

  void initPayment() {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLogging)
        .then((val) {
      setState(() {
        //result = 'PhonePe SDK Initialized - $val';
      });
    }).catchError((error) {
      handleError(error);
    });
  }

  void startTransaction(int amount) {
    body = getChecksum(amount).toString();
    PhonePePaymentSdk.startTransaction(body, callback, checksum, packageName)
        .then((response) {
      setState(() {
        if (response != null) {
          String status = response['status'].toString();
          // ignore: unused_local_variable
          String error = response['error'].toString();
          if (status == 'SUCCESS') {
            result = "Flow Completed - Status: Success!";
          } else {
            //result = "Flow Completed - Status: $status and Error: $error";
          }
        } else {
          //result = "Flow Incomplete";
        }
      });
    }).catchError((error) {
      handleError(error);
    });
  }

  void handleError(error) {
    setState(() {
      result = error.toString();
    });
  }

  String getChecksum(int amount) {
    final reqData = {
      "merchantId": merchantId,
      "merchantTransactionId": "MT7850590068188104",
      "merchantUserId": "MUID123",
      "amount": amount * 100,
      "callbackUrl": callback,
      "mobileNumber": "9999999999",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };
    String base64body = base64.encode(utf8.encode(json.encode(reqData)));
    checksum =
        '${sha256.convert(utf8.encode(base64body + apiEndPoint + saltKey)).toString()}###$saltIndex';

    return base64body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Donation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Enter your name'),
              ),
              TextField(
                controller: locationController,
                decoration:
                    const InputDecoration(labelText: 'Enter your location'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String name = nameController.text;
                  String location = locationController.text;
                  if (name.isNotEmpty && location.isNotEmpty) {
                    bool success = await _generateImage(name, location);
                    if (success) {
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invitation image generated."),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Failed to generate image."),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill in your details."),
                      ),
                    );
                  }
                },
                child: const Text('Generate Invitation'),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: () {
                          startTransaction(11);
                        },
                        child: const Text("Donate 11"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: () {
                          startTransaction(101);
                        },
                        child: const Text("Donate 101"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: () {
                          startTransaction(501);
                        },
                        child: const Text("Donate 501"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Center(
                        child: TextField(
                          controller: customAmountController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Custom',
                              labelStyle: TextStyle(),
                              isDense: true,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: () {
                          int customAmount =
                              int.tryParse(customAmountController.text) ?? 0;
                          if (customAmount > 0) {
                            startTransaction(customAmount);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a valid amount."),
                              ),
                            );
                          }
                        },
                        child: const Text("Donate"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '$result',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (imageBytes != null)
                Image.memory(imageBytes!)
              else
                const Text(''), //no image generated yet string
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _generateImage(String name, String location) async {
    try {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 600, 800));

      // Create a gradient background
      final gradient = ui.Gradient.linear(
        const Offset(0, 0),
        const Offset(600, 800),
        [Colors.blueAccent, Colors.purpleAccent],
      );
      final paint = Paint()..shader = gradient;
      canvas.drawRect(const Rect.fromLTWH(0, 0, 600, 800), paint);

      // Draw top image
      const imageProvider = AssetImage('assets/events.jpg');
      final image = await _loadImage(imageProvider);
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        const Rect.fromLTWH(0, 0, 600, 200),
        Paint(),
      );

      // Draw text
      final textPainter = TextPainter(
        text: TextSpan(
          text: 'Invitation to Durga Puja\n\n'
              'Dear $name,\n\n'
              'We are delighted to invite you to our Durga Puja celebrations.\n'
              'Your presence will make the event even more special.\n\n'
              'Location: $location\n\n'
              'Thank you for your support and we look forward to celebrating with you!',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily:
                'Arial', // Ensure this font is available or use the default system font
          ),
        ),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: 580);
      textPainter.paint(canvas, const Offset(10, 210));

      final picture = recorder.endRecording();
      final img = await picture.toImage(600, 800);
      final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      imageBytes = byteData!.buffer.asUint8List();

      return true;
    } catch (e) {
      print("Error generating image: $e");
      return false;
    }
  }

  Future<ui.Image> _loadImage(ImageProvider imageProvider) async {
    final completer = Completer<ui.Image>();
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final listener =
        ImageStreamListener((ImageInfo image, bool synchronousCall) {
      completer.complete(image.image);
    });
    imageStream.addListener(listener);
    return completer.future;
  }
}
