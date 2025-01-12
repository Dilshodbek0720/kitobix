import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/ui/app_routes.dart';
import 'package:kitobix/utils/size/screen_size.dart';
import 'package:kitobix/utils/theme/app_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(figmaWidth, figmaHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return AdaptiveTheme(
            light: AppTheme.lightTheme,
            dark: AppTheme.darkTheme,
            initial: AdaptiveThemeMode.system,
            builder: (theme, darkTheme){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme,
                darkTheme: darkTheme,
                initialRoute: RouteNames.splashScreen,
                onGenerateRoute: AppRoutes.generateRoute,
              );
        },
        );
      },
    );
  }
}
