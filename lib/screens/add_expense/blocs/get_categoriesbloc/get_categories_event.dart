part of 'get_categories_bloc.dart';

sealed class GetCategoriesEvent extends Equatable {
  const GetCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesFailure extends GetCategoriesState {}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesSuccess extends GetCategoriesState {
  final List<Category> categories;

  const GetCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}
