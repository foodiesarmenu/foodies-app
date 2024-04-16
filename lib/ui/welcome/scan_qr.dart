import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

class ScanQR extends StatefulWidget {
  static const String routeName="ScanQR";
  const ScanQR({super.key});

  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "Not Yet Scanned";
  final Map<String, String> restaurantMenus = {}; // Initially empty

  Future<void> fetchRestaurantMenu(String restaurantId) async {
    final String baseUrl = 'https://your-api-endpoint.com/restaurants'; // Replace with your API base URL
    final String apiKey = 'your_api_key'; // Replace with your actual API key (if applicable)

    try {
      final Uri url = Uri.parse('$baseUrl/$restaurantId/menu');
      final response = await http.get(url, headers: {'Authorization': 'Bearer $apiKey'});

      if (response.statusCode == 200) {
        // Check response content type before decoding
        if (response.headers['content-type']?.startsWith('application/json') == true) {
          final Map<String, dynamic> menuData = jsonDecode(response.body);
          // Extract menu details from menuData (replace with your actual logic)
          final String menuRoute = '/${menuData['id']}_menu'; // Example menu route based on ID
          setState(() { // Update state after successful menu data fetch
            restaurantMenus[restaurantId] = menuRoute;
          });
        } else {
          print('Unexpected response format: ${response.headers['content-type']}');
        }
      } else {
        // Handle API error
        print('Error fetching menu data: ${response.statusCode}');
      }
    } on Exception catch (error) {
      // Handle other potential errors (e.g., network issues)
      print('Error fetching menu data: $error');
    }
  }


  Future<void> scanQR() async {
    try {
      final String scannedCode = await FlutterBarcodeScanner.scanBarcode(
        '#2A99CF',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (!mounted) return;

      // Fetch menu data outside setState
      await fetchRestaurantMenu(scannedCode);

      setState(() {
        qrCodeResult = scannedCode;
        final menuRoute = restaurantMenus[scannedCode];
        if (menuRoute != null) {
          Navigator.of(context).pushNamed(menuRoute);
        } else {
          // Restaurant not found or API error (handled in fetchRestaurantMenu)
          qrCodeResult = 'Restaurant not found.';
        }
      });
    } on PlatformException {
      setState(() {
        qrCodeResult = "Failed to read QR Code";
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              '$qrCodeResult',
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: scanQR,
                child: Text(
                  "Open Scanner",
                  style: TextStyle(color: Colors.indigo[900]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}