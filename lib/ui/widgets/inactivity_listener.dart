import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voip/app/vm/inactivity_vm.dart';

class InActivityListener extends StatefulWidget {
  final Widget child;
  final Duration timeDuration;
  const InActivityListener(
      {Key? key, required this.child, required this.timeDuration})
      : super(key: key);

  @override
  State<InActivityListener> createState() => _InActivityListenerState();
}

class _InActivityListenerState extends State<InActivityListener>
    with WidgetsBindingObserver {
  late InactivityVM inactivityViewModel;

  final GlobalKey _gestureDetectorKey =
      GlobalKey(debugLabel: 'GestureDetector');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    inactivityViewModel = Provider.of<InactivityVM>(context, listen: false);
    inactivityViewModel.resetValues();
    inactivityViewModel.timeDuration = widget.timeDuration;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      inactivityViewModel.onActivity();
    } else if (state == AppLifecycleState.resumed) {
      inactivityViewModel.isActive();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InactivityVM>(
      builder: (context, model, child) => Listener(
        key: _gestureDetectorKey,
        behavior: HitTestBehavior.opaque,
        onPointerDown: (_) => model.onActivity(),
        onPointerMove: (_) => model.onActivity(),
        onPointerUp: (_) => model.onActivity(),
        child: widget.child,
      ),
    );
  }
}
