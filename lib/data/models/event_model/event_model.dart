class EventModel{

  late int id;
  late String createdAt;
  late String topic;
  late String img;
  late String name;
  late String time;
  late String date;
  late String description;
  late String fees;
  late String location;



  //named constructor to get data from apis
  EventModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    createdAt = json['created_at'];
    topic = json['topic'];
    img = json['img'];
    name = json['name'];
    time = json['time'];
    date = json['date'];
    description = json['description'];
    fees = json['fees'];
    location = json['location'];
  }

}