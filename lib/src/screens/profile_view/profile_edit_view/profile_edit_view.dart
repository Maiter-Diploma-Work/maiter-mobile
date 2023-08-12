import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_datepicker.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
          child: AmicaDatepicker(
            initialDate: widget.profile.birthDate,
            fieldName: 'Birthdate',
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.gender,
            options: genders.values,
            fieldName: 'Gender',
          ),
        ),
      ],
    );
  }

  Widget _statusAndLookingForInputs(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.status,
            options: statuses.values,
            fieldName: 'Status',
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.lookingFor,
            options: lookingFors.values,
            fieldName: 'Looking for',
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
                  AmicaButton(
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
              AmicaTextFormInput(
                fieldName: 'Name',
                hintText: 'Your Name',
                initialValue: widget.profile.name,
              ),
              const Gap.cubic(24),
              _birthDateAndGenderInputs(context),
              const Gap.cubic(24),
              _statusAndLookingForInputs(context),
              const Gap.cubic(24),

              const Gap.cubic(24),
              AmicaTextFormInput(
                fieldName: 'About me',
                hintText: 'I love cats!..',
                maxLines: 10,
                initialValue: widget.profile.description,
              ),
              const Gap.cubic(24),
              AmicaTextFormInput(
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
