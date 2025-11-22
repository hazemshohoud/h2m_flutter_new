import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_cust_payments_state.freezed.dart';

@freezed
class AddCustPaymentsState<T> with _$AddCustPaymentsState<T> {
  const factory AddCustPaymentsState.initial() = _Initial;
  const factory AddCustPaymentsState.loading() = CustPaymentsStateLoading;
  const factory AddCustPaymentsState.success(T data) =
      CustPaymentsStateSuccess<T>;
  const factory AddCustPaymentsState.error({required String error}) =
      CustPaymentsStateError;
}
