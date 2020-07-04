import 'package:osmobile/app/shared/models/avatar.model.dart';

class SessionModel {
  String token;
  int subscriberId;
  String subscriberEmail;
  int id;
  String name;
  String email;
  Avatar avatar;
  String permission;
  int iat;
  int exp;

  SessionModel(
      {this.token,
      this.subscriberId,
      this.subscriberEmail,
      this.id,
      this.name,
      this.email,
      this.avatar,
      this.permission,
      this.iat,
      this.exp});

  SessionModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    subscriberId = json['subscriber_id'];
    subscriberEmail = json['subscriber_email'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    permission = json['permission'];
    iat = json['iat'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['subscriber_id'] = this.subscriberId;
    data['subscriber_email'] = this.subscriberEmail;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    data['permission'] = this.permission;
    data['iat'] = this.iat;
    data['exp'] = this.exp;
    return data;
  }
}
