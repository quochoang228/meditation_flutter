import 'package:meta/meta.dart';

import '../entities/_index.dart';

abstract class AuthRepository {

  Future<void> register(
         {@required String firstName,
         @required String lastName,
         @required String email,
         @required String password});

     /// Authenticates a user using his [username] and [password]
     Future<void> authenticate(
         {@required String email, @required String password});

     /// Returns whether the [User] is authenticated.
     Future<bool> isAuthenticated();

     /// Returns the current authenticated [User].
     Future<UserEntity> getCurrentUser();

     /// Resets the password of a [User]
     Future<void> forgotPassword(String email);

     /// Logs out the [User]
     Future<void> logout();
}