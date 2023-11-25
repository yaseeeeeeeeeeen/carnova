// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'document_upload_bloc.dart';

abstract class DocumentUploadState {}

final class DocumentUploadInitial extends DocumentUploadState {}

class DocumentUploadLoadingState extends DocumentUploadState {}

class DocumentUploadSuccsessState extends DocumentUploadState {
  File? imagePath;
  DocumentUploadSuccsessState({
    this.imagePath,
  });
}

class DocumentAllSuccsessState extends DocumentUploadState {}

class DocumentClearedState extends DocumentUploadState {}

class DocumentUploadFailedState extends DocumentUploadState {}

class DocumentUploadErrorState extends DocumentUploadState {}
