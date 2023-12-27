import 'package:agri/app/app.dart';
import 'package:agri/bootstrap.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() {
  bootstrap(() async {
    final authenticationRepository = AuthenticationRepository();
    await authenticationRepository.user.first;
    return App(authenticationRepository: authenticationRepository);
  });
}
