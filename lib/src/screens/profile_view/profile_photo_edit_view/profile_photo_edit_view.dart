import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProfilePhotoEditView extends StatelessWidget {
  final UserProfile userProfile;
  const ProfilePhotoEditView({super.key, required this.userProfile});

  List<Widget> photos(BuildContext context) {
    bool photosExist = userProfile.photos == null;
    bool photosIsEmpty = (photosExist && userProfile.photos!.isEmpty);

    if (photosExist || photosIsEmpty) {
      return List.empty();
    }

    return List.from(
      userProfile.photos!.map(
        (e) => SizedBox(
          width: (MediaQuery.of(context).size.width * 0.4) - 64,
          // width: 105,
          // height: (MediaQuery.of(context).size.height * 0.25),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
            //TODO: non-asset photos!
            child: Image.asset(
              e,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 128,
        ),
        children: [
          AmicaButton(
            onPressed: () async {
              var picked = await FilePicker.platform.pickFiles();

              if (picked != null) {
                debugPrint(picked.files.first.name);
              }
            },
            text: 'Upload new Photo',
            color: Theme.of(context).colorScheme.secondary,
          ),
          const Gap(
            verticalGap: 30,
            horizontalGap: 0,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 7,
            runSpacing: 7,
            alignment: WrapAlignment.spaceEvenly,
            children: photos(context),
          )
          //todo: wrap with photos
        ],
      ),
    );
  }
}
