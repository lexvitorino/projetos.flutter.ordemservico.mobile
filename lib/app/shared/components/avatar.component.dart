import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';

class AvatarComponent extends StatelessWidget {
  String url;

  AvatarComponent({this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageBuilder(
      url: url,
      builder: (image) {
        return Image.file(image);
      },
      errorWidget: Image.asset("lib/app/assets/images/profile-picture.png"),
    );
  }
}
