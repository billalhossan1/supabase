import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_app/model.dart';

class AddStudentController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  Future<void> addStudent(String name, int age, int salary) async {
    _inProgress = true;
    _isSuccess = false;
    _errorMessage = null;
    update();

    try {
      final student = {
        'name': name,
        'age': age,
        'salary': salary,
      };

      await Supabase.instance.client.from('students').insert(student);
      _isSuccess = true;
      print("✅ Student added successfully");
    } catch (e) {
      _errorMessage = "Failed to add student: $e";
      print("❌ Error: $_errorMessage");
    }

    _inProgress = false;
    update();
  }
}
