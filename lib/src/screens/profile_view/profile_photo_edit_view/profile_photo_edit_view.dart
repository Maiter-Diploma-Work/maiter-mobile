import 'dart:io';

import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/file_picker/amica_file_picker.dart';
import 'package:amica/src/shared/inputs/file_picker/strategies/PresentationStrategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePhotoEditView extends StatelessWidget {
  final UserProfile userProfile;

  const ProfilePhotoEditView({super.key, required this.userProfile});

  Future<Widget> fetchImage(String path) async {
    try {
      Uint8List asset = Uint8List.sublistView(await rootBundle.load(path));
      return Image.memory(asset);
    } catch (_) {
      Uint8List file = await File(path).readAsBytes();
      return Image.memory(file);
    }
  }

  List<Widget> photos(BuildContext context) {
    bool photosDoesNotExist = userProfile.photos == null;
    if (photosDoesNotExist) {
      return List.empty();
    }

    return List.from(
      userProfile.photos!.map(
        (e) => SizedBox(
          width: (MediaQuery.of(context).size.width * 0.4) - 64,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
            //TODO: non-mocked photos!
            child: Image.asset(e),
            // child: FutureBuilder(
            //   future: fetchImage(e),
            //   builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            //     if (snapshot.hasData) return snapshot.requireData;
            //     return Container();
            //   },
            // ),
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
          AmicaFilePicker(
            filePickerStrategy: AmicaPresentationFileStrategy(
              profile: userProfile,
            ),
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
        ],
      ),
    );
  }
}
