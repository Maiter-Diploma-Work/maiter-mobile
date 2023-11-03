import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/stores/user_store/user.state.dart';
import 'package:rx_redux/rx_redux.dart';

import 'side_effects/user_side_effects.dart';
import 'user.reducer.dart';

final UserState initialUserState = UserState(
  user: UserProfile.empty(),
  accessToken: '',
  isLoading: false,
);

final RxReduxStore userStore = RxReduxStore(
  initialState: initialUserState,
  sideEffects: userSideEffects,
  reducer: userReducer,
);
