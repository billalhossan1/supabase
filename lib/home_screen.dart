import 'package:flutter/material.dart';
import 'package:supabase_app/show_input_dialog.dart' show InputDialog;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          InputDialog.show(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
