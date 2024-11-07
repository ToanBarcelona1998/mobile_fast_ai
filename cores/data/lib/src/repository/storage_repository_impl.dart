import 'package:data/src/resource/local/local_storage_service.dart';
import 'package:domain/domain.dart';

abstract class StorageRepositoryImpl<T extends LocalStorageService> implements StorageRepository {
  final T _localStorageService;

  const StorageRepositoryImpl(this._localStorageService);

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

final class NormalStorageRepositoryImpl extends StorageRepositoryImpl<NormalLocalStorageService> implements NormalStorageRepository {
  const NormalStorageRepositoryImpl(NormalLocalStorageService localStorageService) : super(localStorageService);
}

final class SecureStorageRepositoryImpl extends StorageRepositoryImpl<SecureLocalStorageService> implements SecureStorageRepository {
  const SecureStorageRepositoryImpl(SecureLocalStorageService localStorageService) : super(localStorageService);
}