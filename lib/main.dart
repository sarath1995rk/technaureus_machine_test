import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:technaures_machine_test/features/cart/view_model/cart_view_model.dart';
import 'package:technaures_machine_test/features/customer/view_model/customer_view_model.dart';
import 'package:technaures_machine_test/features/home/view_model/home_view_model.dart';
import 'package:technaures_machine_test/features/product/view_model/product_view_model.dart';
import 'package:technaures_machine_test/features/splash/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:technaures_machine_test/models/hive_models/customer_model.dart';
import 'package:technaures_machine_test/models/hive_models/product_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ProductModelAdapter().typeId)) {
    Hive.registerAdapter(ProductModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CustomerModelAdapter().typeId)) {
    Hive.registerAdapter(CustomerModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CustomerViewModel(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: false,
        builder: (context, child) {
          return child!;
        },
        child: MaterialApp(
          title: 'Technaureus',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}


