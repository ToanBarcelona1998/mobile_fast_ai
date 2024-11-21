import 'package:data/core/base_response.dart';
import 'package:data/src/dto/ai_task_dto.dart';
import 'package:data/src/dto/dto.dart';
import 'package:data/src/resource/remote/remote.dart';
import 'package:domain/domain.dart';

final class ImageGeneratorRepositoryImpl implements ImageGeneratorRepository {
  final ImageGeneratorService _imageGeneratorService;

  const ImageGeneratorRepositoryImpl(this._imageGeneratorService);

  @override
  Future<List<AITask>> controlNetProcessor(ControlNetRequest request) async{
    final baseResponse = await _imageGeneratorService.controlNetProcessor(
      accessToken: request.accessToken,
      body: request.toJson(),
    );

    return _convertBaseResponseToTask(baseResponse);
  }

  @override
  Future<List<AITask>> enhancePrompt(EnhancePromptRequest request) async{
    final baseResponse = await _imageGeneratorService.enhancePrompt(
      accessToken: request.accessToken,
      body: request.toJson(),
    );

    return _convertBaseResponseToTask(baseResponse);
  }

  @override
  Future<List<AITask>> generateImage(GenerateImageRequest request) async {
    final baseResponse = await _imageGeneratorService.generateImage(
      accessToken: request.accessToken,
      body: request.toJson(),
    );

    return _convertBaseResponseToTask(baseResponse);
  }

  @override
  Future<List<AITask>> imageToText(ImageToTextRequest request) async{
    final baseResponse = await _imageGeneratorService.imageToText(
      accessToken: request.accessToken,
      body: request.toJson(),
    );

    return _convertBaseResponseToTask(baseResponse);
  }

  @override
  Future<List<AITask>> removeBackground(RemoveBackgroundRequest request) async{
    final baseResponse = await _imageGeneratorService.removeBackground(
      accessToken: request.accessToken,
      body: request.toJson(),
      file: request.image,
    );

    return _convertBaseResponseToTask(baseResponse);
  }

  @override
  Future<List<AITask>> upscale(UpScaleImageRequest request) async{
    final baseResponse = await _imageGeneratorService.upscale(
      accessToken: request.accessToken,
      body: request.toJson(),
    );

    return _convertBaseResponseToTask(baseResponse);
  }

  Future<List<AITask>> _convertBaseResponseToTask(BaseResponse baseResponse)async{
    final data = baseResponse.handleResponse();

    final tasks = data['tasks'];

    final List<AITaskDto> tasksDto = List.empty(growable: true);

    for (final task in tasks) {
      final AITaskDto taskDto = AITaskDto.fromJson(task);

      tasksDto.add(taskDto);
    }

    return tasksDto
        .map(
          (e) => e.toEntity,
    )
        .toList();
  }
}
