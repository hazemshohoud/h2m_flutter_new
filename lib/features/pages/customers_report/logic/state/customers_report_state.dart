part of '../cubit/customers_report_cubit.dart';

@freezed
class CustomersReportState<T> with _$CustomersReportState<T> {
  const factory CustomersReportState.initial() = _Initial;
  const factory CustomersReportState.loading() = CustomersReportStateLoading;
  const factory CustomersReportState.success(T data) =
      CustomersReportStateSuccess<T>;
  const factory CustomersReportState.error({required String error}) =
      CustomersReportStateError;
}
