abstract class ISession {
  Future logIn(String email, String password);
  Future logOut();
  Future getToken();
  Future resetPassword(String email);
  Future changePassword(
      String email, String password, String newpassword, String repassword);
}
