// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'document_upload_bloc.dart';

abstract class DocumentUploadEvent {}

class DocumentUploadClicked extends DocumentUploadEvent {
  bool imageUploaded;
  DocumentUploadClicked({required this.imageUploaded});
}

class ImageClearButton extends DocumentUploadEvent {}

class DocumentSubmitClicked extends DocumentUploadEvent {
  VehicleAddData vehicledata;
  DocumentSubmitClicked({
    required this.vehicledata,
  });
}
