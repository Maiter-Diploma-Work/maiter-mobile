import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/inputs/file_picker/strategies/file_picker_strategy.dart';

class AmicaPresentationFileStrategy extends AmicaFilePickerStrategy {
  final UserProfile profile;

  AmicaPresentationFileStrategy({
    required this.profile,
  });

  @override
  void addFile(String filePath) {
    profile.photos ??= [];
    profile.photos!.add(filePath);
  }

  @override
  void removeFile(String filePath) {
    if (profile.photos == null) return;
    if (profile.photos!.isEmpty) return;
    if (!profile.photos!.contains(filePath)) return;

    profile.photos!.removeWhere((element) => element == filePath);
  }
}
