import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/controller/get_student_list_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fduzclzcqdgmagosqwwg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkdXpjbHpjcWRnbWFnb3Nxd3dnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDEwOTQ0MzgsImV4cCI6MjA1NjY3MDQzOH0.kxy36-JbDtAy4FnoBpfadO7E5zz3rn-dUdQL6Ji5sjo',
  );
  Get.lazyPut(() => GetStudentListController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeScreen());
  }
}
