// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_firebase_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalFirebaseOptionsImpl _$$LocalFirebaseOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalFirebaseOptionsImpl(
      apiKey: json['apiKey'] as String,
      appId: json['appId'] as String,
      messagingSenderId: json['messagingSenderId'] as String,
      projectId: json['projectId'] as String,
      authDomain: json['authDomain'] as String,
      storageBucket: json['storageBucket'] as String,
      measurementId: json['measurementId'] as String,
    );

Map<String, dynamic> _$$LocalFirebaseOptionsImplToJson(
        _$LocalFirebaseOptionsImpl instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'appId': instance.appId,
      'messagingSenderId': instance.messagingSenderId,
      'projectId': instance.projectId,
      'authDomain': instance.authDomain,
      'storageBucket': instance.storageBucket,
      'measurementId': instance.measurementId,
    };
