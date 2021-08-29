import 'dart:async';

import 'package:meditation/domain/entities/_index.dart';
import 'package:meditation/domain/repositories/_index.dart';
import 'package:meditation/domain/usecase/base/base_usecase.dart';

class UserUseCase extends BaseUseCase<UserUseCaseResponse, UserUseCaseParams> {
  final UserRepository _userRepository;
  UserUseCase(this._userRepository);

  @override
  Future<Stream<UserUseCaseResponse?>> buildUseCaseStream(UserUseCaseParams? params) async {
    final controller = StreamController<UserUseCaseResponse>();
    try {
      // get user
      final user = await _userRepository.getUser(params!.uid);
      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the reponse inside a respose object.
      controller.add(UserUseCaseResponse(user));
      logger.finest('UserUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('UserUseCase unsuccessful.');
      // Trigger .onError
      controller.addError(e);
    }
    return controller.stream;
  }


}

/// Wrapping params inside an object makes it easier to change later
class UserUseCaseParams {
  final String uid;
  UserUseCaseParams(this.uid);
}

/// Wrapping response inside an object makes it easier to change later
class UserUseCaseResponse {
  final UserEntity userEntity;
  UserUseCaseResponse(this.userEntity);
}