import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model.dart';


class GetStudentListController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  var studentList = <Student>[].obs;
  var inProgress = false.obs;
  var isSuccess = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchStudents() async {
    try {
      inProgress.value = true;
      final response = await supabase.from('students').select();

      studentList.value =
          response.map<Student>((json) => Student.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching students: $e');
    } finally {
      inProgress.value = false;
    }
  }

}
