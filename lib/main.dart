import 'package:flutter/material.dart';
import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/presentation/screens/login_screen.dart';
import 'package:weather_forecast/src/presentation/screens/signup_screen.dart';
import 'package:weather_forecast/src/presentation/screens/weather_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signUp': (context) => SignupScreen(),
          '/weatherForecast': (context) => WeatherForecastScreen(),
        },
      ),
    );
  }
}
