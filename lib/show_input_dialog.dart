import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/controller/add_student_controller.dart';
import 'package:supabase_app/custom_snackbar.dart';

class InputDialog {
  static Future<void> show(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController salaryController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final AddStudentController controller = Get.put(AddStudentController());

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Student Details'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    } else if (value.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Age is required';
                    }
                    final int? age = int.tryParse(value);
                    if (age == null || age < 1 || age > 120) {
                      return 'Enter a valid age (1-120)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: salaryController,
                  decoration: const InputDecoration(labelText: 'Salary'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Salary is required';
                    }
                    final int? salary = int.tryParse(value);
                    if (salary == null || salary < 0) {
                      return 'Enter a valid salary (positive number)';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            GetBuilder<AddStudentController>(
              builder: (controller) {
                return Visibility(
                  visible: !controller.inProgress,
                  replacement: const CircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String name = nameController.text;
                        int age = int.parse(ageController.text);
                        int salary = int.parse(salaryController.text);

                        await controller.addStudent(name, age, salary);

                        if (controller.isSuccess) {
                          CustomSnackbar.show(
                            title: 'Success',
                            message: 'Student Added Successfully',
                          );
                          Navigator.pop(context);
                        // } else if (controller.errorMessage != null) {
                        //   CustomSnackbar.show(
                        //     title: 'Error',
                        //     message: controller.errorMessage!,
                        //     isSuccess: false,
                        //   );
                         }
                      }
                    },
                    child: const Text('Add'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
