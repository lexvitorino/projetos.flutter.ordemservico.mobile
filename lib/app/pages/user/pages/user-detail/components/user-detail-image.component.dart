import 'package:flutter/widgets.dart';

class UserDetailImage extends StatelessWidget {
  final String image;

  UserDetailImage({
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
      ),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("lib/app/assets/images/profile-picture.png"),
          ),
        ),
      ),
    );
  }
}
