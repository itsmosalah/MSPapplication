class CrewModel{
  late int id;
  late String createdAt;
  late String name;
  late String phone;
  late String position;
  late String mail;
  late int year;
  late String department;
  late String committee;
  late String img;

  CrewModel.fromJson(Map<String,dynamic>json){
    id  = json['id'];
    createdAt  = json['created_at'];
    position  = json['position'];
    name  = json['name'];
    phone  = json['phone'];
    mail  = json['mail'];
    year  = json['year'];
    department  = json['department'];
    committee  = json['Committee'];
    img  = json['img'];
  }
}