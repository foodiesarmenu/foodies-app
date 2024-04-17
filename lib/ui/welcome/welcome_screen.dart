import 'package:flutter/material.dart';
import 'package:foodies_app/ui/welcome/scan_qr.dart';
import '../home/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeName = 'WelcomeSc';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Image.asset('assets/images/app_logo.png')),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  const Text(
                    'Welcome Back , Yehya Gamal',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                      'How would you like to order \n your favorite meals today ?',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pushNamed(ScanQR.routeName);
                          });
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.store, size: 40),
                            Text(
                              'Onsite',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.book_online, size: 40),
                            Text(
                              'Online',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
