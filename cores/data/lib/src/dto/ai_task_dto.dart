import 'package:domain/domain.dart';

extension AITaskDtoMapper on AITaskDto {
  AITask get toEntity => AITask(
        id: id,
        data: data,
        createdAt: createdAt,
        taskType: AITaskTypeE.from(
          taskType,
        ),
      );
}

final class AITaskDto {
  final int id;
  final String data;
  final String? rawData;
  final String createdAt;
  final String taskType;

  const AITaskDto({
    required this.id,
    required this.data,
    this.rawData,
    required this.createdAt,
    required this.taskType,
  });

  factory AITaskDto.fromJson(Map<String, dynamic> json) {
    return AITaskDto(
      id: json['id'],
      data: json['data'],
      createdAt: json['createdAt'],
      taskType: json['taskType'],
      rawData: json['rawData']
    );
  }
}
