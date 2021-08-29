import '../entities/_index.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String uid);
  Future<List<UserEntity>> getAllUsers();
}