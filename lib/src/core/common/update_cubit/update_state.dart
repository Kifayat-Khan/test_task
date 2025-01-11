part of 'update_cubit.dart';

@immutable
sealed class UpdateState {}

final class UpdateInitial extends UpdateState {}

final class Updated extends UpdateState {}
