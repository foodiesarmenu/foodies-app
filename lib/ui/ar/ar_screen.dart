import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
        ),
        child: Scaffold(
          key: _scaffoldKey,
      appBar: AppBar(
            elevation: 0.0,
            title: Text('AR View',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w400)),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
                size: 28.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
      body: SafeArea(
        bottom: false,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: UnityWidget(
                fullscreen: false,
                onUnityCreated: onUnityCreated,
              ),
        ),
      ),
        ));
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }
}