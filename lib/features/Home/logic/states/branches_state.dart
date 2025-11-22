import 'package:freezed_annotation/freezed_annotation.dart';
part 'branches_state.freezed.dart';

@freezed
class GetBranchesState<T> with _$GetBranchesState<T> {
  const factory GetBranchesState.initial() = _Initial;
  const factory GetBranchesState.loading() = Loading;
  const factory GetBranchesState.success(T data) = Success<T>;
  const factory GetBranchesState.error({required String error}) = Error;
}
