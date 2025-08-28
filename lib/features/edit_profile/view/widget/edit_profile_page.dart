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
    required this.isSaveChangesLoading, required this.genderController,
  });

  final TextEditingController firstNameController;
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

  final void Function()? onDiscardPressed;
  final void Function()? onSavePressed;

  final bool isSaveChangesLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
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
            "Residential Address",
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
