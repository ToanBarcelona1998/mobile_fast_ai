import 'package:data/src/dto/dto.dart';
import 'package:data/src/resource/remote/model_service.dart';
import 'package:domain/domain.dart';

final class ModelRepositoryImpl implements ModelRepository {
  final ModelService _modelService;

  const ModelRepositoryImpl(this._modelService);

  @override
  Future<List<Model>> getAll({
    required GetAllModelRequest parameter,
  }) async {
    final baseResponse = await _modelService.getAll(
      accessToken: parameter.accessToken,
    );

    final data = baseResponse.handleResponse();

    final models = data['models'];

    final List<ModelDto> modelsDto = List.empty(growable: true);

    for (final model in models) {
      final ModelDto modelDto = ModelDto.fromJson(model);

      modelsDto.add(modelDto);
    }

    return modelsDto
        .map(
          (e) => e.toEntity,
        )
        .toList();
  }
}
