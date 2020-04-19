import 'package:json_annotation/json_annotation.dart';

part 'mini_program.g.dart';

@JsonSerializable()
class MiniProgram {
  final String name;
  final String url;

  MiniProgram(this.name, this.url);

  factory MiniProgram.fromJson(Map<String, dynamic> json) => _$MiniProgramFromJson(json);

  Map<String, dynamic> toJson() => _$MiniProgramToJson(this);
}
