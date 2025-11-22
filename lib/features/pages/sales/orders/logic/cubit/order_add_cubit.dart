import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_item_by_id_requestbody.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/add_models/add_edda_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/add_models/add_edda_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/details_models/order_details_requet_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_hraket_amel_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idsndok_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idwrdya_request_Body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_orderid_request_body.dart';
import '../../../items/data/models/get_item_by_id_response.dart';
import '../../data/models/add_models/orders_add_request_body.dart';
import '../../data/repos/orders_add_repo.dart';
part '../state/order_add_state.dart';
part 'order_add_cubit.freezed.dart';

class OrdersAddCubit extends Cubit<OrderAddState> {
  final OrdersAddRepo _Repo;

  String orderResult = '';
  int orderId = 0;
  int idHraketAmel = 0;
  int idSndok = 0;
  int idWardya = 0;

  static String currCustName = 'حدد العميل';

  static List<dynamic> itemsList = [];
  static var egmaley_fatoraController = TextEditingController(text: '0');
  static var billNetController = TextEditingController(text: '0');
  static var billRemainController = TextEditingController(text: '0');
  static var billPaiedController = TextEditingController(text: '0');
  static var totCustAccountTillNowController = TextEditingController(text: '0');
  static var billDiscountController = TextEditingController(text: '0');
  static var custOldDebitController = TextEditingController(text: '0');

  static int currCustId = 0;

  static var priceController = TextEditingController(text: '0');

  static var qtyController = TextEditingController(text: '0');

  static var discountController = TextEditingController(text: '0');
  static var discountPrcController = TextEditingController(text: '0');

  static var totPriceController = TextEditingController(text: '0');

  static var finalTotalController = TextEditingController(text: '0');

  static var mblghShraController = TextEditingController(text: '0');

  static var itemQtyFormKey = GlobalKey<FormState>();
  static var ordersAddFormKey = GlobalKey<FormState>();

  OrdersAddCubit(this._Repo, OrdersAddRepo OrdersAddRepo)
      : super(const OrderAddState.initial());

  Future<void> emitGetIdWrdyaStates(GetIdWrdyaRequestBody requestBody) async {
    //emit(const OrderAddState.loading());
    final response = await _Repo.getIdWardya(requestBody);
    response.when(success: (response) {
      print(response.toString());
      idWardya = int.parse(response.id_wardya.toString());
      emit(OrderAddState.success(idWardya.toString()));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitOrdersAddStates(OrdersAddRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = await _Repo.saveOrder(requestBody);
    response.when(success: (response) {
      orderId = response;
      print('orderResult >>>> $orderId');
      //orderId = int.parse(orderResult);
      emit(OrderAddState.success(orderId.toString()));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitGetOrderIdStates(GetOrderIdRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = await _Repo.getOrderId(requestBody);
    response.when(success: (response) {
      orderResult = response.toString();
      emit(OrderAddState.success(orderResult));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitGetHraketAmelStates(
      GetHraketAmelRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = await _Repo.getHarketAmel(requestBody);
    response.when(success: (response) {
      orderResult = response.toString();
      emit(OrderAddState.success(orderResult));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitGetIdSndokStates(GetIdsndokRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = await _Repo.getIdSndok(requestBody);
    response.when(success: (response) {
      orderResult = response.toString();
      emit(OrderAddState.success(orderResult));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitOrdersAddStatesDetails(
      OrdersDetailsRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = await _Repo.saveOrderDetails(requestBody);
    response.when(success: (response) {
      orderResult = response.toString();
      emit(OrderAddState.success(orderResult));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitOrdersAddStatesGetItemById(
      GetItemByIdRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = _Repo.getItemById(requestBody);
    response.when(success: (response) {
      orderResult = response.toString();
      emit(OrderAddState.success(orderResult));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitAddHarketEddaStates(AddEddaRequestBody requestBody) async {
    emit(const OrderAddState.loading());
    final response = _Repo.addHarketEdda(requestBody);
    response.when(success: (response) {
      orderResult = response.toString();
      emit(OrderAddState.success(orderResult));
    }, failure: (error) {
      emit(OrderAddState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<int> GetIdWardya(GetIdWrdyaRequestBody requestBody) async {
    if (idWardya == 0) {
      await emitGetIdWrdyaStates(requestBody);
      if (idWardya > 1) {
        return idWardya;
      }
      return idWardya;
    }
    return idWardya;
  }

  Future<int> GetIdSndok(GetIdsndokRequestBody requestBody) async {
    if (idSndok == 0) {
      await emitGetIdSndokStates(requestBody);
      if (orderResult.isNotEmpty) {
        return idSndok;
      }
      return idSndok;
    }
    return idSndok;
  }

  Future<int> getHraketAmel(GetHraketAmelRequestBody requestBody) async {
    if (idHraketAmel == 0) {
      await emitGetHraketAmelStates(requestBody);
      if (orderResult.isNotEmpty) {
        return idHraketAmel;
      }
    }
    return idHraketAmel;
  }

  Future<int> GetOrderId(GetOrderIdRequestBody requestBody) async {
    if (orderId == 0) {
      await emitGetOrderIdStates(requestBody);
      if (orderResult.isNotEmpty) {
        return orderId;
      }
    }
    return orderId;
  }

  Future<int> SaveOrderData(OrdersAddRequestBody requestBody) async {
    //if(orderId<=0){
    await emitOrdersAddStates(requestBody);

    //
    return orderId;
  }

  Future<String> SaveOrderDetails(OrdersDetailsRequestBody requestBody) async {
    if (orderResult.isEmpty) {
      await emitOrdersAddStatesDetails(requestBody);
      if (orderResult.isNotEmpty) {
        return orderResult;
      }
    }
    return orderResult;
  }

  Future<GetItemByIdResponse> getItemById(
      GetItemByIdRequestBody requestBody) async {
    GetItemByIdResponse getItemByIdResult = GetItemByIdResponse();
    if (getItemByIdResult.Id_Montag! <= 0) {
      await emitOrdersAddStatesGetItemById(requestBody);
      if (getItemByIdResult.Id_Montag != null) {
        return getItemByIdResult;
      }
    }
    return getItemByIdResult;
  }

  Future<AddEddaResponse> addHarketEdda(AddEddaRequestBody requestBody) async {
    AddEddaResponse result = AddEddaResponse();
    if (result.id_ordar! <= 0) {
      await emitAddHarketEddaStates(requestBody);
      if (result.id_ordar != null) {
        return result;
      }
    }
    return result;
  }

  static void clearData() {
    currCustId = -1;
    currCustName = 'حدد العميل';
    itemsList = [];
    billDiscountController.text = '0.00';
    billNetController.text = '0.00';
    billPaiedController.text = '0.00';
    billRemainController.text = '0.00';
    custOldDebitController.text = '0.00';
    totCustAccountTillNowController.text = '0.00';
    egmaley_fatoraController.text = '0.00';
    discountController.text = '0.00';
    totPriceController.text = '0.00';
    finalTotalController.text = '0.00';
    qtyController.text = '0.00';
    priceController.text = '0.00';
    mblghShraController.text = '0.00';
  }

  static void emitGetCustData(BuildContext context, customer) {
    currCustId = customer["IdAmel"]!;
    currCustName = customer["NameAMel"]!;
  }
}
