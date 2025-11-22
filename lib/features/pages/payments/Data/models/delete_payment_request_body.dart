import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_payment_request_body.g.dart';

@JsonSerializable()
class DeletePaymentRequestBody {
  final int id_hrka;
  final String date_hrka;
  final String user_Name;
  DeletePaymentRequestBody({
        required this.id_hrka,
      required this.date_hrka,
      required this.user_Name
    });

  Map<String, dynamic> toJson() => _$DeletePaymentRequestBodyToJson(this);
}
