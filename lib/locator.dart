import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:voip/app/vm/forgot_password_vm.dart';
import 'package:voip/app/vm/home_vm.dart';
import 'package:voip/app/vm/inactivity_vm.dart';
import 'package:voip/app/vm/signup_vm.dart';

import 'app/vm/base_vm.dart';
import 'app/vm/signin_vm.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseVM()),
  ChangeNotifierProvider(create: (_) => SignupVM()),
  ChangeNotifierProvider(create: (_) => SignInVM()),
  ChangeNotifierProvider(create: (_) => ForgotPasswordVM()),
  ChangeNotifierProvider(create: (_) => UserVM()),
  ChangeNotifierProvider(create: (_) => InactivityVM()),
];
