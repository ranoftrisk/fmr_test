import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmr_test/repo/auth_repo.dart';
import 'package:fmr_test/styles/theme_data.dart';
import 'package:fmr_test/ui/login_page/sms_login_pageview_page.dart';

class FmtTestApp extends StatelessWidget {
  const FmtTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return RepositoryProvider(
      create: (context) => AuthRepo(),
      child: MaterialApp(
        title: 'FMR test',
        theme: getThemeData(),
        home: const Directionality(
            textDirection: TextDirection.ltr,
            child: SMSLoginPageViewPage()),
      ),
    );
  }
}
