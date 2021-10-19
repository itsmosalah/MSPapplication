class ProjectModel{
  late int id;
  late String createdAt;
  late String name;
  late String photo;
  late String link;
  late String team;
  late String description;


  ProjectModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    photo = json['photo'];
    link = json['link'];
    team = json['team'];
    description = json['description'];
  }

}