enum AITaskType{
  inference,
  controlNet,
  upscale,
  removeBackground,
  imageToText,
  promptEnhance,
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
