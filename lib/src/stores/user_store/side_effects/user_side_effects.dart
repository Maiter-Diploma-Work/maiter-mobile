import 'package:amica/src/stores/user_store/side_effects/user_login.effect.dart';
import 'package:rx_redux/src/side_effect.dart';

final List<SideEffect> userSideEffects = [UserLoginEffect.effect];
