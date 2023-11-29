import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/file_picker/strategies/file_picker_strategy.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AmicaFilePicker extends StatelessWidget {
  final AmicaFilePickerStrategy filePickerStrategy;

  const AmicaFilePicker({
    super.key,
    required this.filePickerStrategy,
  });

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  @override
  Widget build(BuildContext context) {
    return AmicaButton(
      textColor: Theme.of(context).colorScheme.onPrimary,
      color: Theme.of(context).colorScheme.primary,
      onPressed: () async {
        FilePickerResult? picked = await FilePicker.platform.pickFiles();

        if (picked == null) {
          return;
        }

        final String path = await _localPath;
        for (var file in picked.files) {
          if (file.path != null) filePickerStrategy.addFile(path);
        }
      },
      text: 'Upload new Photo',
    );
  }
}
