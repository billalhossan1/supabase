import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/controller/get_student_list_controller.dart';
import 'package:supabase_app/show_input_dialog.dart' show InputDialog;


class HomeScreen extends StatelessWidget {
  final GetStudentListController controller = Get.find<GetStudentListController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchStudents();

    return Scaffold(
      appBar: AppBar(title: const Text('Student List')),
      body: Obx(() {
        if (controller.inProgress.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.studentList.isEmpty) {
          return const Center(child: Text('No students found.'));
        }

        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final student = controller.studentList[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(student.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle:
                Text('Age: ${student.age} | Salary: \$${student.salary}'),
                trailing: Text('ID: ${student.id}'),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          InputDialog.show(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

