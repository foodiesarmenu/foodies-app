import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../menu/menu_screen.dart';

class MenuScannerScreen extends StatefulWidget {
  const MenuScannerScreen({super.key});

  static const String routeName = 'MenuScannerSc';

  @override
  State<MenuScannerScreen> createState() => _MenuScannerScreenState();
}

class _MenuScannerScreenState extends State<MenuScannerScreen> {
  bool isFlashOn = false;
  bool isFrontCamera = false;
  bool isScanCompleted = false;
  MobileScannerController cameraController = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).primaryColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("QR Scanner",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w400, color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFlashOn = !isFlashOn;
                });
                cameraController.toggleTorch();
              },
              icon: Icon(
                Icons.flash_on,
                size: 26.sp,
                color: isFlashOn ? Colors.black : Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isFrontCamera = !isFrontCamera;
                  });
                  cameraController.switchCamera();
                },
                icon: Icon(
                  Icons.flip_camera_android,
                  size: 26.sp,
                  color: isFrontCamera ? Colors.black : Colors.white,
                )),
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR code in designated area",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 16,
              ),
              Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      MobileScanner(
                        controller: cameraController,
                        allowDuplicates: true,
                        onDetect: (barcode, args) {
                          if (!isScanCompleted) {
                            isScanCompleted = true;
                            String code = barcode.rawValue ?? "---";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuScreen(
                                  restaurantId: code,
                                  isScanner: true,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      QRScannerOverlay(
                        overlayColor: Colors.black26,
                        borderColor: Theme.of(context).primaryColor,
                        borderRadius: 20,
                        borderStrokeWidth: 10,
                        scanAreaWidth: 250,
                        scanAreaHeight: 250,
                      )
                    ],
                  )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Scan properly to see the menu",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}