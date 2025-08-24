import 'dart:io';

class Person {
  int id;
  String name;
  int age;
  String gender;
  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  int grade;
  double score;
  Student(
    super.id,
    super.name,
    super.age,
    super.gender,
    this.grade,
    this.score,
  );
}

class Teacher extends Person {
  String subject;
  double salary;
  Teacher(
    super.id,
    super.name,
    super.age,
    super.gender,
    this.subject,
    this.salary,
  );
}

class Classroom {
  int id;
  String name;
  List<Student> students;
  Teacher teacher;
  Classroom(this.id, this.name, this.students, this.teacher);
}

void main(List<String> args) {
  List<Student> allStudents = [];
  List<Teacher> allTeachers = [];
  List<Classroom> classrooms = [];

  int choice = -1;
  while (choice != 0) {
    print("\n=== Quản Lý Trường Học ===");
    print("1. Thêm học sinh");
    print("2. Thêm giáo viên");
    print("3. Gán học sinh và giáo viên vào lớp");
    print("4. Tính điểm trung bình học sinh");
    print("5. Hiển thị báo cáo lớp học");
    print("6. Thoát");
    stdout.write("Nhập lựa chọn: ");
    choice = int.parse(stdin.readLineSync() ?? "0");

    if (choice == 1) {
      stdout.write("Nhập ID học sinh: ");
      int id = int.parse(stdin.readLineSync() ?? "0");
      stdout.write("Nhập tên học sinh: ");
      String name = stdin.readLineSync() ?? "";
      stdout.write("Nhập tuổi: ");
      int age = int.parse(stdin.readLineSync() ?? "0");
      stdout.write("Nhập giới tính: ");
      String gender = stdin.readLineSync() ?? "";
      stdout.write("Nhập lớp: ");
      int grade = int.parse(stdin.readLineSync() ?? "0");
      stdout.write("Nhập điểm: ");
      double score = double.parse(stdin.readLineSync() ?? "0");
      allStudents.add(Student(id, name, age, gender, grade, score));
      print("Thêm học sinh thành công!");
    } else if (choice == 2) {
      stdout.write("Nhập ID giáo viên: ");
      int id = int.parse(stdin.readLineSync() ?? "0");
      stdout.write("Nhập tên giáo viên: ");
      String name = stdin.readLineSync() ?? "";
      stdout.write("Nhập tuổi: ");
      int age = int.parse(stdin.readLineSync() ?? "0");
      stdout.write("Nhập giới tính: ");
      String gender = stdin.readLineSync() ?? "";
      stdout.write("Nhập môn học: ");
      String subject = stdin.readLineSync() ?? "";
      stdout.write("Nhập lương: ");
      double salary = double.parse(stdin.readLineSync() ?? "0");
      allTeachers.add(Teacher(id, name, age, gender, subject, salary));
      print("Thêm giáo viên thành công!");
    } else if (choice == 3) {
      if (allStudents.isEmpty || allTeachers.isEmpty) {
        print("Vui lòng thêm học sinh hoặc giáo viên trước!");
        continue;
      }
      stdout.write("Nhập ID lớp: ");
      int id = int.parse(stdin.readLineSync() ?? "0");
      stdout.write("Nhập tên lớp: ");
      String name = stdin.readLineSync() ?? "";
      stdout.write("Nhập ID giáo viên: ");
      int teacherId = int.parse(stdin.readLineSync() ?? "0");
      Teacher? teacher = allTeachers.firstWhere(
        (t) => t.id == teacherId,
        orElse: () => throw Exception("Không tìm thấy giáo viên!"),
      );
      stdout.write("Nhập số lượng học sinh: ");
      int numStudents = int.parse(stdin.readLineSync() ?? "0");
      List<Student> classStudents = [];
      for (int i = 0; i < numStudents && i < allStudents.length; i++) {
        classStudents.add(allStudents[i]);
      }
      classrooms.add(Classroom(id, name, classStudents, teacher));
      print("Gán lớp học thành công!");
    } else if (choice == 4) {
      if (allStudents.isEmpty) {
        print("Không có học sinh để tính điểm!");
        continue;
      }
      for (var student in allStudents) {
        print("Học sinh: ${student.name}, Điểm trung bình: ${student.score}");
      }
    } else if (choice == 5) {
      if (classrooms.isEmpty) {
        print("Không có lớp học để hiển thị!");
        continue;
      }
      for (var classroom in classrooms) {
        print("\nLớp: ${classroom.name}");
        print(
          "Giáo viên: ${classroom.teacher.name}, Môn: ${classroom.teacher.subject}",
        );
        for (var student in classroom.students) {
          print(
            "  - Học sinh: ${student.name}, Lớp: ${student.grade}, Điểm: ${student.score}",
          );
        }
      }
    }
  }
}
