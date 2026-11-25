import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portfolio project synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.link,
    this.thumbnail = '',
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  final String techStack;

  @JsonKey(defaultValue: '')
  final String link;

  @JsonKey(defaultValue: '')
  final String thumbnail;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
