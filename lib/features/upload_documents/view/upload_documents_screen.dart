import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/features/permission_required/view/permission_required_screen.dart';
import 'package:medicare_pharmacy/features/upload_documents/view_model/upload_documents_view_model.dart';

class UploadDocumentsScreen extends ConsumerWidget {
  const UploadDocumentsScreen({super.key});
  static const routeName = "/upload_document_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadDocState = ref.watch(uploadDocumentsViewModelProvider);

    ref.listen(
      uploadDocumentsViewModelProvider.select(
        (value) => value.uploadFileResponse,
      ),
      (previous, next) => next?.when(
        data: (data) {
          showSnackBarSuccessMessage(
            context,
            message: "Your Document Uploaded Successfully",
          );

          if (context.mounted) context.push(PermissionRequiredScreen.routeName);
        },
        error: (error, s) {
          showSnackBarErrorMessage(context, message: error.toString());
        },

        loading: () {},
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: containerCardDecoration(),
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Upload required documents",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please ensure your uploaded files are clear and legible.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),

                  // SizedBox(height: 24),
                  if (uploadDocState.selectedFilePath != null) ...[
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.picture_as_pdf_rounded,
                          color: AppColors.error,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          uploadDocState.selectedFilePath!.split("/").last,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 17),
                        ),
                        Spacer(),
                        Text(
                          uploadDocState.selectedFileSize ?? "",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.hintTextColor),
                        ),
                      ],
                    ),
                  ],

                  SizedBox(height: 20),

                  uploadDocState.selectedFilePath == null
                      ? _initialStateButton(
                        onSelectTap: () {
                          ref
                              .read(uploadDocumentsViewModelProvider.notifier)
                              .pickFile();
                        },
                      )
                      : _documentSelectedButton(
                        isUploadLoading:
                            uploadDocState.uploadFileResponse?.isLoading ??
                            false,
                        onReplaceTap: () {
                          ref
                              .read(uploadDocumentsViewModelProvider.notifier)
                              .pickFile();
                        },
                        onUploadTap: () {
                          ref
                              .read(uploadDocumentsViewModelProvider.notifier)
                              .uploadDocument();
                        },
                      ),

                  SizedBox(height: 24),
                ],
              ),
            ),
            SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }

  CustomOutlinedButton _initialStateButton({
    required void Function()? onSelectTap,
  }) {
    return CustomOutlinedButton(
      onTap: onSelectTap,
      title: "Select Document",
      width: 160,
      backgroundColor: AppColors.white,
      icon: Icon(Icons.attach_file_rounded, color: AppColors.primary, size: 20),
    );
  }

  Row _documentSelectedButton({
    required bool isUploadLoading,
    required void Function()? onReplaceTap,
    required void Function()? onUploadTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: CustomOutlinedButton(
            onTap: onReplaceTap,
            title: "Replace Document",

            backgroundColor: AppColors.white,
            icon: Icon(
              Icons.attach_file_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: LoadingButton(
            title: "Upload",
            isLoading: isUploadLoading,
            onTap: onUploadTap,
          ),
        ),
      ],
    );
  }
}
