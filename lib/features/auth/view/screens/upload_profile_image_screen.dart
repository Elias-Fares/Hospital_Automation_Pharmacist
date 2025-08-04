import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../configuration/res.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/buttons/custom_text_button.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import '../../../../core/widgets/general_image_asset.dart';
import '../../../../core/widgets/show_snack_bar_error_message.dart';
// import '../../../appointments/view/appointments.dart';
import '../../view_models/upload_profile_image/upload_profile_image_view_model.dart';

class UploadProfileImageScreen extends ConsumerWidget {
  static const routeName = "/upload_profile_image";
  const UploadProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadProfileImageState =
        ref.watch(uploadProfileImageViewModelProvider);

    ref.listen(
      uploadProfileImageViewModelProvider.select(
        (value) => value.uploadProfileImageResponse,
      ),
      (previous, next) => next?.when(
        data: (data) {
          // context.go(AppointmentsScreen.routeName);
        },
        error: (error, stackTrace) {
          showSnackBarErrorMessage(context, message: error.toString());
        },
        loading: () {},
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    uploadProfileImageState.selectedImage == null
                        ? const GeneralImageAssets(
                            path: Res.uploadImage,
                            width: 100,
                            height: 100,
                            boxFit: BoxFit.contain,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              uploadProfileImageState.selectedImage!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Text(
                      "Upload Your Profile Photo",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "To help us verify your identity and ensure the security of your account, please upload a clear, recognizable photo of yourself. This step helps us prevent fraudulent activity.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    CustomTextButton(
                      text: "Choose Image",
                      onTap: () {
                        ref
                            .read(uploadProfileImageViewModelProvider.notifier)
                            .selectImageFromGallery();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LoadingButton(
                        title: "Upload Image",
                        isLoading: uploadProfileImageState
                                .uploadProfileImageResponse?.isLoading ??
                            false,
                        onTap: () {
                          ref
                              .read(
                                  uploadProfileImageViewModelProvider.notifier)
                              .uploadProfileImage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: kToolbarHeight,
            )
          ],
        ),
      ),
    );
  }
}
