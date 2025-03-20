import 'package:get/get.dart';
import 'package:supabase_app/controller/add_student_controller.dart';
import 'package:supabase_app/controller/get_student_list_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    AddStudentController();
    GetStudentListController();
  }

}