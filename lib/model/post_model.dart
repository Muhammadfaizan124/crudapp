class PostModel {
  String? sId;
  String? name;
  String? description;

  PostModel({
    this.sId,
    required this.name,
    required this.description,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
