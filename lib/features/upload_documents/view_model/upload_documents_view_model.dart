import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'upload_documents_state.dart';
part 'upload_documents_view_model.g.dart';

@riverpod
class UploadDocumentsViewModel extends _$UploadDocumentsViewModel {
  @override
  UploadDocumentsState build() => UploadDocumentsState();

  final _repository = getIt<Repository>();

  Future<void> pickFile() async {
    try {
      const allowedFileExtensions = ["pdf", "docx"];

      final picker = FilePicker.platform;

      final result = await picker.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: allowedFileExtensions,
      );

      if (result == null || (result.files.isEmpty)) {
        return;
      }

      final path = result.files.first.path;

      double fileSize = result.files.first.size / 1024; // the size in KB
      String fileSizeString = "${fileSize.toStringAsFixed(2)} KB";

      if (fileSize > 1000) {
        fileSize = fileSize / 1024; // Size in MB
        fileSizeString = "${fileSize.toStringAsFixed(2)} MB";
      }

      if (path == null) {
        throw Exception("File path not available");
      }

      state = state.copyWith(
        selectedFilePath: path,
        selectedFileSize: fileSizeString,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> uploadDocument() async {
    if (state.selectedFilePath == null || state.selectedFilePath!.isEmpty) {
      return;
    }
    state = state.copyWith(uploadFileResponse: AsyncValue.loading());

    final response = await _repository.uploadFile(
      filePath: state.selectedFilePath!,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        uploadFileResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        uploadFileResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
