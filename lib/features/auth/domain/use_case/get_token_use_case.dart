import 'package:elmarket/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetTokenUseCase {
  AuthRepository authRepository;
  GetTokenUseCase({
    required this.authRepository,
  });
  Future<String?> call() => authRepository.getToken();
}
