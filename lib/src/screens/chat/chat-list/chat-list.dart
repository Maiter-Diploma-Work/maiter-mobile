import 'package:amica/src/models/chat/chat_room.dart';
import 'package:amica/src/models/chat/chat_user_short_profile.dart';
import 'package:amica/src/services/chat/room/room.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/maiter_search_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatListView extends StatefulWidget {
  final ProfileService profileService;
  final ChatRoomService chatRoomService;

  const ChatListView({
    super.key,
    required this.profileService,
    required this.chatRoomService,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  TextEditingController controller = TextEditingController();

  List<ChatRoom> _chatRooms = [];
  List<ChatRoom> _chatRoomsSource = [];
  List<ChatRoom> _pinnedChatRooms = [];

  Future<void> readMockChatRooms() async {
    widget.profileService.setUserProfile();
    final List<ChatRoom> chatRooms =
        await widget.chatRoomService.getChatRoomsFor(
      widget.profileService.userProfile!.id.toString(),
      ChatRoomType.plain,
    );
    final List<ChatRoom> pinnedChatRooms =
        await widget.chatRoomService.getChatRoomsFor(
      widget.profileService.userProfile!.id.toString(),
      ChatRoomType.pinned,
    );

    setState(() {
      _chatRooms = chatRooms;
      _chatRoomsSource = chatRooms;
      _pinnedChatRooms = pinnedChatRooms;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_transformChatList);
    readMockChatRooms();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          AmicaSearchBar(
            controller: controller,
          ),
          _generateChatList(context),
        ],
      ),
    );
  }

  Iterable<ChatRoom> _selectChatRoomsByParticipantsName(List<ChatRoom> rooms) {
    return rooms.where(
      (x) => x.participants.any(
        (element) => element.name.toLowerCase().contains(controller.text),
      ),
    );
  }

  void _transformChatList() {
    print(controller.text);
    setState(() {
      _chatRooms = List.from(
        _selectChatRoomsByParticipantsName(_chatRoomsSource).map(
          (e) => ChatRoom(
            id: e.id,
            participants: e.participants,
            lastMessageSentAt: e.lastMessageSentAt,
          ),
        ),
      );
    });
  }

  String getChatRoomPhoto(ChatRoom e) {
    return e.participants
        .firstWhere(
            (element) => element.id != widget.profileService.userProfile!.id)
        .photo;
  }

  Widget _generateChatList(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.surface,
          child: ListView(
            shrinkWrap: false,
            children: [
              const Gap(verticalGap: 16.0, horizontalGap: 0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _generateQuickChats(context),
              ),
              const Gap(verticalGap: 32.0, horizontalGap: 0),
              ..._generateContacts(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _generateQuickChats(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _addQuickChatButton(context),
          const Gap(verticalGap: 0, horizontalGap: 16),
          ...List<Widget>.from(
            _pinnedChatRooms.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  backgroundImage: AssetImage(getChatRoomPhoto(e)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _generateContacts(BuildContext context) {
    return List<Widget>.from(
      _chatRooms.map(
        (e) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6,
              ),
              child: _generateContact(
                e.participants.firstWhere((element) =>
                    element.id != widget.profileService.userProfile!.id),
                e,
                context,
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
                ),
              ),
            ),
            const Gap(verticalGap: 14.0, horizontalGap: 0)
          ],
        ),
      ),
    );
  }

  Widget _addQuickChatButton(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      // padding: const EdgeInsets.all(13),
      strokeWidth: 1.0,
      color: Theme.of(context).colorScheme.onSurface,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
      ),
    );
  }

  Widget _generateContact(
    ChatUserShortProfile profile,
    ChatRoom chatRoom,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => context.go('/chat/${profile.id}/${chatRoom.id}'),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.background,
            backgroundImage: AssetImage(profile.photo),
            // child: Image.network(profile.photo),
          ),
          const Gap.cubic(16),
          generateContactName(
            profile.name,
            chatRoom.lastMessageSentAt,
            context,
          ),
        ],
      ),
    );
  }

  Widget generateContactName(
    String profileName,
    DateTime lastMessageSentAt,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profileName,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          '${lastMessageSentAt.day}.${lastMessageSentAt.day}.${lastMessageSentAt.year}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
