import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/cubits/auth/auth_cubit.dart';
import 'package:kitobix/cubits/book/book_cubit.dart';
import 'package:kitobix/cubits/order/order_cubit.dart';
import 'package:kitobix/cubits/tab/tab_cubit.dart';
import 'package:kitobix/data/local/storage_repository.dart';
import 'package:kitobix/data/repositories/auth_repository.dart';
import 'package:kitobix/data/repositories/book_repository.dart';
import 'package:kitobix/data/repositories/order_repository.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/utils/size/screen_size.dart';
import 'package:kitobix/utils/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://xsbnwnqbhwirgvwnhngh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzYm53bnFiaHdpcmd2d25obmdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYzNjMzNzQsImV4cCI6MjA2MTkzOTM3NH0.rZT-8xkiwG98ognhpAr4mK2Il3nfUzn9ADkL75ddpfo',
  );
  await StorageRepository.getInstance();
  runApp(const App());
}

final supabase = Supabase.instance.client;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => BookRepository()),
        RepositoryProvider(create: (context) => OrderRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(context.read<AuthRepository>()),
          ),
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(
            create: (context) => BookCubit(
              bookRepository: context.read<BookRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => OrderCubit(
              orderRepository: context.read<OrderRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
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
      builder: (context, child) {
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.darkTheme,
          initial: AdaptiveThemeMode.system,
          builder: (theme, darkTheme) {
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
