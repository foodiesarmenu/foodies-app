import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ARScreen extends StatefulWidget {
  static const routeName = '/ar_screen';
  const ARScreen({super.key});

  @override
  State<ARScreen> createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  late UnityWidgetController _unityWidgetController;
  TextEditingController _textController = TextEditingController();
  String _unityResponse = "";

  void onUnityMessage(message) {
    setState(() {
      _unityResponse = message.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter to Unity Example'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: UnityWidget(
              onUnityCreated: onUnityCreated,
              onUnityMessage: onUnityMessage,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Send message to Unity',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_unityWidgetController != null) {
                      _unityWidgetController.postMessage(
                        'MealModelManager',
                        'RecieveFromFoodies',
                        _textController.text,
                      );
                    }
                  },
                  child: Text('Send to Unity'),
                ),
                Text('Response from Unity: $_unityResponse'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }
}
