class Avatar {
  String url;
  int id;
  String path;

  Avatar({this.url, this.id, this.path});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}
