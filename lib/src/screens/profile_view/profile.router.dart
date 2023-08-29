import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/profile_view/option_select_view/option_select_item.dart';
import 'package:amica/src/screens/profile_view/option_select_view/option_select_view.dart';
import 'package:amica/src/screens/profile_view/profile_edit_view/profile_edit_view.dart';
import 'package:amica/src/screens/profile_view/profile_photo_edit_view/profile_photo_edit_view.dart';
import 'package:amica/src/screens/profile_view/profile_view.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_detailed_view/user_profile_detailed.dart';
import 'package:amica/src/shared/interests_list/interests_list.dart';
import 'package:go_router/go_router.dart';

final profileRouter = GoRoute(
  path: '/profile',
  builder: (context, state) => AmicaScaffold(
    title: 'Your Profile',
    scaffoldBody: UserProfileDetailed(profile: ValeryDoe, isOwnProfile: true),
    selectedNavigationItemIndex: 3,
    isDetailed: false,
  ),
  routes: [
    GoRoute(
      path: 'edit-menu',
      builder: (context, state) => AmicaScaffold(
        hasBlurOnAppBar: true,
        isDetailed: true,
        title: 'Edit Profile',
        scaffoldBody: ProfileView(profile: ValeryDoe),
        selectedNavigationItemIndex: 3,
      ),
      routes: profileEdit,
    ),
  ],
);

final profileEdit = <GoRoute>[
  GoRoute(
    path: 'edit',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: true,
      title: 'Edit Profile',
      scaffoldBody: ProfileEditView(profile: ValeryDoe),
      selectedNavigationItemIndex: 3,
    ),
  ),
  GoRoute(
    path: 'interests',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: true,
      title: 'Edit interests',
      scaffoldBody: InterestsListSelect(
        selectedInterests: ValeryDoe.interests,
        isRegistrations: false,
      ),
      selectedNavigationItemIndex: 3,
    ),
  ),
  GoRoute(
    path: 'photos',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: true,
      title: 'Edit Profile',
      scaffoldBody: ProfilePhotoEditView(userProfile: ValeryDoe),
      selectedNavigationItemIndex: 3,
    ),
  ),
  GoRoute(
    path: 'theme',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: true,
      selectedNavigationItemIndex: 3,
      title: 'Theme selection',
      scaffoldBody: OptionSelect(
        options: [
          OptionSelectItem("light"),
          OptionSelectItem("dark"),
        ],
      ),
    ),
  ),
  GoRoute(
    path: 'language',
    builder: (context, state) => AmicaScaffold(
      hasBlurOnAppBar: true,
      isDetailed: true,
      selectedNavigationItemIndex: 3,
      title: 'Language selection',
      scaffoldBody: OptionSelect(
        options: [
          OptionSelectItem("English"),
          OptionSelectItem("Українська"),
        ],
      ),
    ),
  ),
];
