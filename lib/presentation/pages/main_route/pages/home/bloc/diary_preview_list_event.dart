part of 'diary_preview_list_bloc.dart';

@immutable
abstract class DiaryPreviewListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoadDiaryPreviewListEvent extends DiaryPreviewListEvent {}
