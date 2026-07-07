import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/utils/app_language_settings_capability.dart';

final FutureProvider<bool> appLanguageSettingsCapabilityProvider =
    FutureProvider<bool>((Ref ref) {
      return isAppLanguageSettingsSupported();
    });
