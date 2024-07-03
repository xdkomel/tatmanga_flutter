import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/secrets.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class AuthData {
  final User user;
  final String displayName;
  final bool canEdit;
  const AuthData({
    required this.user,
    required this.canEdit,
    required this.displayName,
  });
}

class AuthenticationManager extends Notifier<Option<AuthData>> {
  @override
  Option<AuthData> build() => const None();

  Future<void> auth() async {
    final user = await ref.read(P.auth).authenticate();
    state = user.toOption(identity).map(
          (u) => AuthData(
            user: u,
            displayName: u.displayName ?? u.email ?? u.phoneNumber ?? u.uid,
            canEdit: _canEdit(u),
          ),
        );
  }

  bool _canEdit(User user) =>
      user.email.fold(() => false, adminEmails.contains);
}
