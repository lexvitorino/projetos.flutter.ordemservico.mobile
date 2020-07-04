import 'package:osmobile/app/shared/models/avatar.model.dart';

class UserModel {
  int id;
  int subscriberId;
  String name;
  String email;
  int avatarId;
  String permission;
  Avatar avatar;

  UserModel(
      {this.id,
      this.subscriberId,
      this.name,
      this.email,
      this.avatarId,
      this.permission,
      this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriberId = json['subscriber_id'];
    name = json['name'];
    email = json['email'];
    avatarId = json['avatar_id'];
    permission = json['permission'];
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subscriber_id'] = this.subscriberId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar_id'] = this.avatarId;
    data['permission'] = this.permission;
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    return data;
  }

  dynamic toMap() {
    return {
      'id': id,
      'subscriber_id': subscriberId,
      'name': name,
      'email': email,
      'avatar_id': avatarId,
      'permission': permission
    };
  }
}
