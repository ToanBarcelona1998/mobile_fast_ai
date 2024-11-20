import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/base_repository.dart';

abstract interface class ModelRepository implements GetAllWithParamRepository<Model,GetAllModelRequest>, AddRepository{
  Future<List<Model>> getLocalModels();
}