// ignore: file_names

import 'package:admin_kitaro/model/account/account_model.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

part 'session.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState.initial(KitaroAccount acc) = _Initial;
  const factory SessionState.dismiss() = _Dismiss;
}

class SessionNotifier extends StateNotifier<SessionState> {
  SessionNotifier() : super(const SessionState.dismiss());

  void setSession(KitaroAccount acc) => state = SessionState.initial(acc);
  void sessionTerminate() => state = const SessionState.dismiss();
}

class SessionProvider {
  static StateNotifierProvider<SessionNotifier, SessionState> create() {
    return StateNotifierProvider<SessionNotifier, SessionState>(
      create: (_) => SessionNotifier(),
    );
  }

  static Provider<SessionNotifier> createProvider() =>
      Provider<SessionNotifier>(
        create: (_) => SessionNotifier(),
      );
}
