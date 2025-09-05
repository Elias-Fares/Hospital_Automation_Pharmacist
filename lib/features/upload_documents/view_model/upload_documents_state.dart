part of "upload_documents_view_model.dart";

class UploadDocumentsState {
  final String? selectedFilePath;
  final String? selectedFileSize;
  final AsyncValue? uploadFileResponse;


  UploadDocumentsState({this.selectedFilePath, this.uploadFileResponse, this.selectedFileSize});

  UploadDocumentsState copyWith({
    String? selectedFilePath,
    AsyncValue? uploadFileResponse,
    String? selectedFileSize
  }) {
    return UploadDocumentsState(
      selectedFilePath: selectedFilePath ?? this.selectedFilePath,
      uploadFileResponse: uploadFileResponse ?? this.uploadFileResponse,
      selectedFileSize: selectedFileSize ?? this.selectedFileSize
    );
  }
}
