class Student {
  int? id;
  String name;
  int age;
  int salary;

  Student({
    this.id,
    required this.name,
    required this.age,
    required this.salary,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'salary': salary,
    };
  }
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      salary: json['salary'],
    );
  }
}
