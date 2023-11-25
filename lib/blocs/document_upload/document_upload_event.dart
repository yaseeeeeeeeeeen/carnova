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
  List<File> vehicleImages;
  File doc;
  DocumentSubmitClicked({
    required this.vehicledata,
    required this.vehicleImages,
    required this.doc,
  });
}
