abstract class ISession {
  Future logIn(String email, String password);
  Future logOut();
  // Future lock;
  // Future unlock;
}
