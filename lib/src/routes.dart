import 'package:go_router/go_router.dart';
import 'package:maiter/src/data/anna_shapovalova.dart';
import 'package:maiter/src/layouts/scaffold.dart';
import 'package:maiter/src/screens/auth/login/login.dart';
import 'package:maiter/src/screens/auth/register/register.dart';
import 'package:maiter/src/screens/option_select_view/option_select_item.dart';
import 'package:maiter/src/screens/option_select_view/option_select_view.dart';
import 'package:maiter/src/screens/profile_view/profile_edit_view/profile_edit_view.dart';
import 'package:maiter/src/screens/profile_view/profile_view.dart';
import 'package:maiter/src/screens/user_profile_detailed_view/user_profile_detailed.dart';
import 'package:maiter/src/screens/user_profile_view/user_profile_view.dart';
import 'package:maiter/src/screens/welcome_view/welcome_view.dart';

import 'layouts/detailed_scaffold.dart';

final searchUser = GoRoute(
  path: '/search/user',
  builder: (context, state) => MaiterScaffold(
    title: "User Search",
    scaffoldBody: UserProfileView(
      profile: AnnaShapovalova,
    ),
    selectedNavigationItemIndex: 0,
  ),
);

final detailedUser = GoRoute(
  path: '/search/user/details',
  builder: (context, state) => MaiterDetailedScaffold(
    title: "",
    scaffoldBody: UserProfileDetailed(
      profile: AnnaShapovalova,
    ),
    selectedNavigationItemIndex: 0,
    backRoute: '/search/user',
  ),
);

final search = GoRoute(
  path: '/search',
  routes: [
    searchUser,
    //searchEvent,
    //searchGroup
  ],
);

final login = GoRoute(
  path: '/auth/login',
  builder: (context, state) => const LoginScreen(),
);
final register = GoRoute(
  path: '/auth/register',
  builder: (context, state) => const RegisterScreen(),
);

final profile = GoRoute(
  path: '/profile',
  builder: (context, state) => MaiterScaffold(
    title: 'Your Profile',
    scaffoldBody: ProfileView(profile: AnnaShapovalova),
    selectedNavigationItemIndex: 3,
  ),
);

final profileSelectTheme = GoRoute(
  path: '/profile/theme',
  builder: (context, state) => MaiterDetailedScaffold(
    backRoute: '/profile',
    selectedNavigationItemIndex: 3,
    title: 'Theme selection',
    scaffoldBody: OptionSelect(
      options: [
        OptionSelectItem("light"),
        OptionSelectItem("dark"),
        OptionSelectItem("summer"),
        OptionSelectItem("fall"),
        OptionSelectItem("winter"),
        OptionSelectItem("spring"),
      ],
    ),
  ),
);

//TODO: REMOVE THE HARCODE
final profileSelectLanguage = GoRoute(
  path: '/profile/language',
  builder: (context, state) => MaiterDetailedScaffold(
    backRoute: '/profile',
    selectedNavigationItemIndex: 3,
    title: 'Language selection',
    scaffoldBody: OptionSelect(
      options: [
        OptionSelectItem("English"),
        OptionSelectItem("Українська"),
      ],
    ),
  ),
);

final profileEdit = GoRoute(
  path: '/profile/edit',
  builder: (context, state) => MaiterDetailedScaffold(
    title: 'Edit Profile',
    scaffoldBody: ProfileEditView(profile: AnnaShapovalova),
    selectedNavigationItemIndex: 3,
    backRoute: '/profile',
  ),
);

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    searchUser,
    detailedUser,
    profile,
    profileEdit,
    profileSelectTheme,
    profileSelectLanguage,
    login,
    register,
  ],
);
