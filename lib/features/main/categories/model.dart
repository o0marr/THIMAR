class CategoriesData {

  late final List<CategoriesModel> list;
  late final Links links;
  late final String status;
  late final String message;

  CategoriesData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>CategoriesModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']??"");
    status = json['status']??"";
    message = json['message']??"";
  }


}

class CategoriesModel {

  late final int id;
  late final String name;
  late final String description;
  late final String media;

  CategoriesModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    media = json['media'];
  }


}

class Links {

  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json){
    first = json['first'];
    last = json['last'];
    prev = null;
    next = null;
  }


}

