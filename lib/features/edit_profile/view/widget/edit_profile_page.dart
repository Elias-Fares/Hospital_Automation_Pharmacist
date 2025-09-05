part of '../edit_profile_screen.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    super.key,
    required this.firstNameController,
    required this.secondNameController,
    required this.governorateController,
    required this.cityController,
    required this.regionController,
    required this.streetController,
    required this.phoneController,
    required this.emailController,
    required this.formKey,
    this.onDiscardPressed,
    this.onSavePressed,
    required this.noteController,
    required this.isSaveChangesLoading,
    required this.genderController,
    required this.middleNameController,
    this.profileImage,
    this.selectedImage,
    this.onPickImageTap,
  });

  final TextEditingController firstNameController;
  final TextEditingController middleNameController;
  final TextEditingController secondNameController;
  final TextEditingController governorateController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController streetController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController noteController;
  final TextEditingController genderController;
  final GlobalKey<FormState> formKey;
  final String? profileImage;
  final String? selectedImage;

  final void Function()? onDiscardPressed;
  final void Function()? onSavePressed;

  final bool isSaveChangesLoading;

  final GestureTapCallback? onPickImageTap;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 10),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.onSurfaceContainerVariant2.withValues(
                      alpha: .3,
                    ),
                  ),
                  child:
                      (selectedImage?.isNotEmpty ?? false)
                          ? Image.file(
                            File(selectedImage!),

                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                          : GeneralNetworkImage(
                            url: "${Constant.baseUrl}/$profileImage",
                            failWidget: Icon(
                              Icons.person,
                              size: 30,
                              color: AppColors.outline,
                            ),
                          ),
                ),

                InkWell(
                  onTap: onPickImageTap,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 15,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),
          Text(
            "Personal Information",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          EditProfileTextFormField(
            textEditingController: firstNameController,
            label: "First Name",
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: middleNameController,
            label: "Middle Name",
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: secondNameController,
            label: "Second Name",
          ),
          const SizedBox(height: 12),
          SelectOptionsTextFieldV2(
            textEditingController: genderController,
            hintText: "Gender",
            bottomSheetTitle: "Select Gender",
            optionsList: ["Male", "Female"],
            onTap: (selectedElement) {},
            displayStringForOption: (element) {
              return element;
            },
          ),
          const SizedBox(height: 24),
          Text(
            "Pharamcy Address",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          EditProfileTextFormField(
            textEditingController: governorateController,
            label: "Governorate",
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: cityController,
            label: "City",
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: regionController,
            label: "Region",
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: streetController,
            label: "Street",
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: noteController,
            label: "Note",
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 24),
          Text("Contact Info", style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 10),
          EditProfileTextFormField(
            textEditingController: phoneController,
            label: "Phone Number",
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          EditProfileTextFormField(
            textEditingController: emailController,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  title: "Discard changes",
                  radius: 12,
                  onTap: onDiscardPressed,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: LoadingButton(
                  title: "Save Changes",
                  borderRaduis: BorderRadius.circular(12),
                  onTap: onSavePressed,
                  isLoading: isSaveChangesLoading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
