import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/services/auth/mock_auth.service.dart';
import 'package:amica/src/services/auth/mock_auth.service.dart';
import 'package:amica/src/services/chat/message/message.service.dart';
import 'package:amica/src/services/chat/message/mock_message.service.dart';
import 'package:amica/src/services/chat/room/mock_room.service.dart';
import 'package:amica/src/services/chat/room/room.service.dart';
import 'package:amica/src/services/event/event.service.dart';
import 'package:amica/src/services/event/mock_event.service.dart';
import 'package:amica/src/services/like/like.service.dart';
import 'package:amica/src/services/like/mock_like.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/services/user/mock_user_search.service.dart';
import 'package:amica/src/services/user/mock_user_search.service.dart';
import 'package:amica/src/services/user/user_search.service.dart';

enum EnvironmentProfile {
  // Mocked services
  presentation,
  test,
  // 'Real' services
  production,
}

class ServiceFactory {
  static EnvironmentProfile envProfile = EnvironmentProfile.presentation;

  static AuthService provideAuthService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockAuthService.instance;
      case EnvironmentProfile.production:
      //TODO: Change to normal Service instead
        return MockAuthService.instance;
    }
  }

  static MessageService provideMessageService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockMessageService.instance;
      case EnvironmentProfile.production:
      //TODO: Change to normal Service instead
        return MockMessageService.instance;
    }
  }

  static ChatRoomService provideChatRoomService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockChatRoomService.instance;
      case EnvironmentProfile.production:
        return MockChatRoomService.instance;
    }
  }

  static EventService provideEventService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockEventService.instance;
      case EnvironmentProfile.production:
        return MockEventService.instance;
    }
  }

  static LikeService provideLikeService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockLikeService.instance;
      case EnvironmentProfile.production:
        return MockLikeService.instance;
    }
  }

  static ProfileService provideProfileService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockProfileService.instance;
      case EnvironmentProfile.production:
      //TODO: Change to normal Service instead
        return MockProfileService.instance;
    }
  }

  static UserSearchService provideUserSearchService() {
    switch (envProfile) {
      case EnvironmentProfile.presentation:
      case EnvironmentProfile.test:
        return MockedUserSearchService.instance;
      case EnvironmentProfile.production:
      //TODO: Change to normal Service instead
        return MockedUserSearchService.instance;
    }
  }
}
