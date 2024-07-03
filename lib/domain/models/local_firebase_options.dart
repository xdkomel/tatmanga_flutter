import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_firebase_options.freezed.dart';
part 'local_firebase_options.g.dart';

@freezed
class LocalFirebaseOptions with _$LocalFirebaseOptions {
  factory LocalFirebaseOptions({
    required String apiKey,
    required String appId,
    required String messagingSenderId,
    required String projectId,
    required String authDomain,
    required String storageBucket,
    required String measurementId,
  }) = _LocalFirebaseOptions;

  factory LocalFirebaseOptions.fromJson(Map<String, dynamic> json) => _$LocalFirebaseOptionsFromJson(json);
}

extension ToFirebaseOptions on LocalFirebaseOptions {
  FirebaseOptions get toFirebaseOptions => FirebaseOptions(
        apiKey: apiKey,
        appId: appId,
        messagingSenderId: messagingSenderId,
        projectId: projectId,
        authDomain: authDomain,
        storageBucket: storageBucket,
        measurementId: measurementId,
      );
}
