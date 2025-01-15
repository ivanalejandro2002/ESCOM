class Teacher {
  String teacherID;
  String firstName;
  String lastName;
  String curp;
  String academyName;

  Teacher({
    required this.teacherID,
    required this.firstName,
    required this.lastName,
    required this.curp,
    required this.academyName,
  });

  // Método para convertir JSON en un objeto Teacher
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      teacherID: json['TeacherID'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      curp: json['CURP'],
      academyName: json['AcademyName'],
    );
  }

  // Método para convertir un objeto Teacher a JSON
  Map<String, dynamic> toJson() {
    return {
      'TeacherID': teacherID,
      'FirstName': firstName,
      'LastName': lastName,
      'CURP': curp,
      'AcademyName': academyName,
    };
  }
}

class AssignedTeacher {
  String teacherID;
  String firstName;
  String lastName;
  String curp;
  String academyName;
  String group;
  String subject;

  AssignedTeacher({
    required this.teacherID,
    required this.firstName,
    required this.lastName,
    required this.curp,
    required this.academyName,
    required this.group,
    required this.subject,
  });

  // Método para convertir JSON en un objeto AssignedTeacher
  factory AssignedTeacher.fromJson(Map<String, dynamic> json) {
    return AssignedTeacher(
      teacherID: json['TeacherID'].toString(),
      firstName: json['FirstName'],
      lastName: json['LastName'],
      curp: json['CURP'],
      academyName: json['AcademyName'],
      group: json['GroupCode'],
      subject: json['Subject'],
    );
  }

  // Método para convertir un objeto AssignedTeacher a JSON
  Map<String, dynamic> toJson() {
    return {
      'TeacherID': teacherID,
      'FirstName': firstName,
      'LastName': lastName,
      'CURP': curp,
      'AcademyName': academyName,
      'Group': group,
      'Subject': subject,
    };
  }
}
