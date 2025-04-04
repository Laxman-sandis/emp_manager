import 'package:emp_manager/core/constants.dart';
import 'package:emp_manager/core/theme/theme_config.dart';
import 'package:emp_manager/logic/cubit/employee_cubit.dart';
import 'package:emp_manager/logic/cubit/theme_cubit.dart';
import 'package:emp_manager/presentation/screens/emp_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await LocalDB.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF0E8AD7), // Desired color
      statusBarIconBrightness: Brightness.light, // White icons
      statusBarBrightness: Brightness.dark, // iOS
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmployeeCubit()..loadEmployees()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkTheme) {
          return ScreenUtilInit(
            designSize: const Size(430, 930),
            minTextAdapt: true,
            splitScreenMode: false,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppConstants.appTitle,
                theme: ThemeConfig.instance.buildThemeData(isDarkTheme),
                home: const EmployeeListScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
