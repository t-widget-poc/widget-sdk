// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_program_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiniProgramList _$MiniProgramListFromJson(Map<String, dynamic> json) {
  return MiniProgramList(
    (json['widgets'] as List)
        ?.map((e) =>
            e == null ? null : MiniProgram.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MiniProgramListToJson(MiniProgramList instance) =>
    <String, dynamic>{
      'widgets': instance.widgets,
    };
