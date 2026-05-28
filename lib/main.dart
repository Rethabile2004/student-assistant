import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_assistant/app_theme.dart';
import 'package:student_assistant/viewmodels/admin_viewmodel.dart';
import 'package:student_assistant/viewmodels/application_viewmodel.dart';
import 'package:student_assistant/viewmodels/auth_viewmodel.dart';
import 'package:student_assistant/views/admin/admin_dashboard_view.dart';
import 'package:student_assistant/views/auth/login_view.dart';
import 'package:student_assistant/views/auth/register_view.dart';
import 'package:student_assistant/views/auth/splash_view.dart';
import 'package:student_assistant/views/home/home_view.dart';
import 'package:student_assistant/views/student/profile_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const _supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const _supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (_supabaseUrl.isEmpty || _supabaseAnonKey.isEmpty) {
    runApp(const MissingConfigurationApp());
    return;
  }

  await Supabase.initialize(
    url: _supabaseUrl,
    anonKey: _supabaseAnonKey,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ApplicationViewModel()),
        ChangeNotifierProvider(create: (_) => AdminViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final hasSession = Supabase.instance.client.auth.currentUser != null;

    return MaterialApp(
      title: 'Student Assistant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: hasSession ? '/home' : '/',
      routes: {
        '/': (_) => const SplashView(),
        '/login': (_) => const LoginView(),
        '/register': (_) => const RegisterView(),
        '/home': (_) => const HomeView(),
        '/profile': (_) => const ProfileView(),
        '/admin': (_) => const AdminDashboardView(),
      },
    );
  }
}

class MissingConfigurationApp extends StatelessWidget {
  const MissingConfigurationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Assistant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Missing Supabase configuration. Run the app with SUPABASE_URL and SUPABASE_ANON_KEY dart defines.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
