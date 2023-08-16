import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:voip/ui/utils/space.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          Visibility(
            visible: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected,
            child: Column(
              children: [
                VSpace(60.h),
                //const InternetNotAvailableWidget(),
              ],
            ),
          ),
          //  InternetNotAvailable(),
          // Expanded(child: child),
          // PersistentWsidget(),
        ],
      ),
    );
  }
}
