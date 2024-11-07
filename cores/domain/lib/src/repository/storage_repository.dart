import 'package:domain/src/entity/requests/request.dart';
import 'package:domain/src/repository/base_repository.dart';

abstract interface class StorageRepository
    implements
        AddRepository<bool, AddLocalStorageRequest>,
        UpdateRepository<UpdateLocalStorageRequest>,
        DeleteRepository<String>,
        GetRepository<String, String> {}

abstract interface class NormalStorageRepository implements StorageRepository{

}

abstract interface class SecureStorageRepository implements StorageRepository{

}
