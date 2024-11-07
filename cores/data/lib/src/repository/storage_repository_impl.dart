import 'package:data/src/resource/local/local_storage_service.dart';
import 'package:domain/domain.dart';

abstract class LocalStorageRepositoryImpl<T extends LocalStorageService> implements LocalStorageRepository {
  final T _localStorageService;

  const LocalStorageRepositoryImpl(this._localStorageService);

  @override
  Future<bool> add({required AddLocalStorageRequest request}) {
    return _localStorageService.add(request.key, request.value);
  }

  @override
  Future<void> delete({required String id}) {
    return _localStorageService.delete(id);
  }

  @override
  Future<String?> get({required String id}) {
    return _localStorageService.get(id);
  }

  @override
  Future<bool> update({required UpdateLocalStorageRequest request}) {
    return _localStorageService.update(request.key, request.value);
  }
}

final class NormalLocalStorageRepositoryImpl extends LocalStorageRepositoryImpl<NormalLocalStorageService> implements NormalLocalStorageRepository{
  const NormalLocalStorageRepositoryImpl(NormalLocalStorageService localStorageService) : super(localStorageService);
}

final class SecureLocalStorageRepositoryImpl extends LocalStorageRepositoryImpl<SecureLocalStorageService> implements SecureLocalStorageRepository {
  const SecureLocalStorageRepositoryImpl(SecureLocalStorageService localStorageService) : super(localStorageService);
}