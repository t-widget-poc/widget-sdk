import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter/mini_program.dart';

import 'mini_program.dart';

part 'mini_program_list.g.dart';

@JsonSerializable()
class MiniProgramList {
  final List<MiniProgram> widgets;

  MiniProgramList(this.widgets);

  factory MiniProgramList.fromJson(Map<String, dynamic> json) => _$MiniProgramListFromJson(json);

  Map<String, dynamic> toJson() => _$MiniProgramListToJson(this);
}
