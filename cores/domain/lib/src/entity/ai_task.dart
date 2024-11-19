extension AITaskTypeE on AITaskType{
  static AITaskType from(String type) {
    return AITaskType.values.firstWhere(
          (task) => task.type == type,
    );
  }
}

enum AITaskType {
  inference('imageInference'),
  controlNet('imageControlNetPreProcess'),
  upscale('imageUpscale'),
  removeBackground('imageBackgroundRemoval'),
  imageToText('imageCaption'),
  promptEnhance('promptEnhance');

  const AITaskType(this.type);

  final String type;
}

final class AITask {
  final int id;
  final String data;
  final String? rawData;
  final String createdAt;
  final AITaskType taskType;

  const AITask({
    required this.id,
    required this.data,
    this.rawData,
    required this.createdAt,
    required this.taskType,
  });
}
