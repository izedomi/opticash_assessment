import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:voip/ui/screens/auth/signin_screen.dart';
import 'package:voip/ui/screens/auth/signup_screen.dart';
import 'package:voip/ui/screens/welcome/intro_screen.dart';
import 'package:voip/ui/utils/app_color.dart';
import 'package:voip/ui/widgets/inactivity_listener.dart';
import 'app/routes/router.dart';
import 'app/routes/routes.dart';
import 'app/services/app_init_service.dart';
import 'app/utils/app_text.dart';
import 'base_widget.dart';
import 'locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  init() async {}

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     // const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    //     );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return StreamProvider<InternetConnectionStatus>(
          initialData: InternetConnectionStatus.connected,
          create: (_) {
            return InternetConnectionChecker().onStatusChange;
          },
          child: MultiProvider(
            providers: allProviders,
            child: InActivityListener(
              timeDuration: const Duration(minutes: 10),
              child: MaterialApp(
                title: AppText.appName,
                builder: (context, child) {
                  final MediaQueryData data = MediaQuery.of(context);
                  return MediaQuery(
                      data: data.copyWith(
                        textScaleFactor: 1,
                      ),
                      child: BaseWidget(
                        child: child!,
                      ));
                },
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.green,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  primaryColor: AppColor.kayGreen,
                  fontFamily: "Rogerex",
                ),
                //home: MainScreen(),
                //home: const IncomingCallScreen(),
                //  home: const IntroScreen(),
                // home: SignInScreen(),
                //  home: HomeScreen(),
                // home: const SignupScreen(),
                //home: LockScreen(),
                initialRoute: WelcomeRoute.splash,
                onGenerateRoute: AppRouter.generateRoute,
              ),
            ),
          ),
        );
      },
    );
  }
}
