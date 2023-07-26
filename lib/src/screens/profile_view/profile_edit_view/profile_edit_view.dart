import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:maiter/src/models/profiles/user_profile.dart';
import 'package:maiter/src/shared/gap.dart';
import 'package:maiter/src/shared/inputs/maiter_button.dart';
import 'package:maiter/src/shared/inputs/maiter_datepicker.dart';
import 'package:maiter/src/shared/inputs/maiter_select.dart';
import 'package:maiter/src/shared/inputs/maiter_text_form_input.dart';

class ProfileEditView extends StatefulWidget {
  final UserProfile profile;

  const ProfileEditView({super.key, required this.profile});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  Widget _birthDateAndGenderInputs(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: MaiterDatepicker(
            initialDate: widget.profile.birthDate,
            fieldName: 'Birthdate',
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: MaiterSelect<String>(
            initialValue: widget.profile.gender,
            options: Genders.values,
            fieldName: 'Gender',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 50),
      child: Form(
        child: Center(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 66,
                    foregroundImage: AssetImage(widget.profile.photo),
                  ),
                  MaiterButton(
                    onPressed: () async {
                      var picked = await FilePicker.platform.pickFiles();

                      if (picked != null) {
                        debugPrint(picked.files.first.name);
                      }
                    },
                    text: 'Change photo',
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
              const Gap.cubic(38),
              MaiterTextFormInput(
                fieldName: 'Name',
                hintText: 'Your Name',
                initialValue: widget.profile.name,
              ),
              const Gap.cubic(24),
              _birthDateAndGenderInputs(context),
              const Gap.cubic(24),
              MaiterTextFormInput(
                fieldName: 'About me',
                hintText: 'I love cats!..',
                maxLines: 10,
                initialValue: widget.profile.description,
              ),
              const Gap.cubic(24),
              MaiterTextFormInput(
                fieldName: 'Education',
                hintText: 'Hogwartz - Griffindor',
                initialValue: widget.profile.education,
              ),
              //Place for geolocation:
              /*
              
              

              */
              //Place for Interests
              /*
              
              
              */
            ],
          ),
        ),
      ),
    );
  }
}
