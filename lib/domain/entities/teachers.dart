class Teachers {
  String name;
  String position;
  String contact;
  String deparment;
  String id;
  String office;
  String myImage;

  Teachers(
      {required this.id,
      required this.name,
      required this.position,
      required this.contact,
      required this.deparment,
      required this.office,
      required this.myImage});
}

class AsignedTeacher {
  String id;
  String name;
  String position;
  String contact;
  String deparment;
  String group;
  String subject;

  AsignedTeacher(
      {required this.id,
      required this.name,
      required this.position,
      required this.contact,
      required this.deparment,
      required this.group,
      required this.subject});
}
