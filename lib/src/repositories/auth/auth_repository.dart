import '../../models/auth_model.dart';

abstract class AuthRepository {
  //AuthModel: objeto com logins
  Future<AuthModel> login(String email, String password);
}
