import 'package:domain/src/entity/requests/request.dart';
import 'package:domain/src/repository/base_repository.dart';

abstract interface class LocalStorageRepository
    implements
        AddRepository<bool, AddLocalStorageRequest>,
        UpdateRepository<UpdateLocalStorageRequest>,
        DeleteRepository<String>,
        GetRepository<String, String> {}

abstract interface class NormalLocalStorageRepository implements LocalStorageRepository{

}

abstract interface class SecureLocalStorageRepository implements LocalStorageRepository{

}
