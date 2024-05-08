import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
class ARScreen extends StatefulWidget {
  static const routeName = '/ar_screen';
  const ARScreen({super.key});

  @override
  State<ARScreen> createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {

  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('AR View'),
      ),
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () async {
            // Pop the category page if Android back button is pressed.
            return true;
          },
          child: Container(
            color: Theme.of(context).primaryColor,
            child: UnityWidget(
              fullscreen: false,
              onUnityCreated: onUnityCreated,
            ),
          ),
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
  }
}
