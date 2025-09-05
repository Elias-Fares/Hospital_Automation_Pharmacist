import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/core/widgets/textfields/select_option_text_field_v2.dart';
import 'package:medicare_pharmacy/data/models/profile_model.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/buttons/custom_outlined_button.dart';
import '../../../core/widgets/buttons/loading_button.dart';

import '../view_model/edit_profile_view_model.dart';
// import '../../profile/view_model/profile_view_model.dart';

part 'widget/edit_profile_text_form_field.dart';
part 'widget/edit_profile_page.dart';
part 'widget/edit_profile_add_note_button.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static const routeName = "/edit_profile";
  const EditProfileScreen({super.key, this.userProfileData});

  final ProfileModel? userProfileData;

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  // Controllers
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController secondNameController;
  late TextEditingController governorateController;
  late TextEditingController cityController;
  late TextEditingController regionController;
  late TextEditingController streetController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController noteController;
  late TextEditingController genderController;

  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController(
      text: widget.userProfileData?.user?.firstName ?? "",
    );
    middleNameController = TextEditingController(
      text: widget.userProfileData?.user?.middleName ?? "",
    );
    secondNameController = TextEditingController(
      text: widget.userProfileData?.user?.lastName ?? "",
    );
    governorateController = TextEditingController(
      text: widget.userProfileData?.addressGovernorate ?? "",
    );
    cityController = TextEditingController(
      text: widget.userProfileData?.addressCity ?? "",
    );
    regionController = TextEditingController(
      text: widget.userProfileData?.addressRegion ?? "",
    );
    streetController = TextEditingController(
      text: widget.userProfileData?.addressStreet ?? "",
    );
    phoneController = TextEditingController(
      text: widget.userProfileData?.phoneNumber ?? "",
    );
    emailController = TextEditingController(
      text: widget.userProfileData?.user?.email ?? "",
    );
    noteController = TextEditingController(
      text: widget.userProfileData?.addressNote ?? "",
    );
    genderController = TextEditingController(
      // text: widget.userProfileData?. ?? "",
      text: "Female",
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    governorateController.dispose();
    cityController.dispose();
    regionController.dispose();
    streetController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(editProfileViewModelProvider);

    ref.listen(
      editProfileViewModelProvider.select((value) => value.editProfileResponse),
      (previous, next) => next?.when(
        data: (data) {
          showSnackBarSuccessMessage(
            context,
            message: "Profile Updated Successfully",
          );
        },
        error: (error, stackTrace) {
          showSnackBarErrorMessage(context, message: error.toString());
        },
        loading: () {},
      ),
    );
    return Scaffold(
      appBar: SubAppBar(
        // titleWidget: AppBarTitleWidget(
        //   // title: joinStrings([
        //   //   widget.userProfileData?.user?.firstName,
        //   //   widget.userProfileData?.user?.lastName,
        //   // ]),
        //   // imagePath: Res.personePlaceHolderImage,
        // ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: EditProfilePage(
          formKey: _editProfileFormKey,
          firstNameController: firstNameController,
          secondNameController: secondNameController,
          middleNameController: middleNameController,
          governorateController: governorateController,
          cityController: cityController,
          regionController: regionController,
          streetController: streetController,
          phoneController: phoneController,
          emailController: emailController,
          noteController: noteController,
          genderController: genderController,
          profileImage: widget.userProfileData?.user?.imgurl,
          selectedImage: editState.selectedImagePath,
          isSaveChangesLoading:
              ref
                  .watch(editProfileViewModelProvider)
                  .editProfileResponse
                  ?.isLoading ??
              false,

          onDiscardPressed: () {
            context.pop();
          },
          onPickImageTap: () {
            ref
                .read(editProfileViewModelProvider.notifier)
                .selectImageFromGallery();
          },
          onSavePressed: () async {
            await ref
                .read(editProfileViewModelProvider.notifier)
                .editUserProfile(
                  email: emailController.text,
                  firstName: firstNameController.text,
                  middleName: middleNameController.text,
                  lastName: secondNameController.text,
                  phoneNumber: phoneController.text,
                  addressGovernate: governorateController.text,
                  addressRegion: regionController.text,
                  addressCity: cityController.text,
                  addressStreet: streetController.text,
                  addressNote: noteController.text,
                  gender: genderController.text,
                );
          },
        ),
      ),
    );
  }
}
