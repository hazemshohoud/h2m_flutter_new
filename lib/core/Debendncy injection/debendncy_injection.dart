import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_branches.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_customers.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_customers_report.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_get_mandoben.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_get_stores.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_items.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_orders.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_payments.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';
import 'package:h2m_destrib/core/networking/dio_factory.dart';
import 'package:h2m_destrib/features/Home/data/repos/get_branches_repo.dart';
import 'package:h2m_destrib/features/Home/logic/cubits/branches_cubit.dart';
import 'package:h2m_destrib/features/login/data/repos/login_repo.dart';
import 'package:h2m_destrib/features/login/logic/cubit/login_cubit.dart';
import 'package:h2m_destrib/features/pages/customers/data/repos/get_customers_repo.dart';
import 'package:h2m_destrib/features/pages/customers/logic/cubit/customers_cubit.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/repos/customers_report_repo.dart';
import 'package:h2m_destrib/features/pages/customers_report/logic/cubit/customers_report_cubit.dart';
import 'package:h2m_destrib/features/pages/payments/Data/repos/cust_payments_repo.dart';
import 'package:h2m_destrib/features/pages/payments/logic/cubit/cust_payments_cubit.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/repos/get_items_repo.dart';
import 'package:h2m_destrib/features/pages/sales/items/logic/cubit/get_items_cubit.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/repos/orders_add_repo.dart';
import 'package:h2m_destrib/features/pages/sales/orders/logic/cubit/order_add_cubit.dart';
import 'package:h2m_destrib/features/pages/stores/logic/cubit/storeitems_cubit.dart';

import '../../features/Home/data/repos/get_mandoben_repo.dart';
import '../../features/Home/data/repos/get_stores_repo.dart';
import '../../features/Home/logic/cubits/get_mandoben_cubit.dart';
import '../../features/Home/logic/cubits/get_stores_cubit.dart';
import '../../features/login/data/repos/representative_repo.dart';
import '../../features/pages/stores/data/repos/get_store_items_repo.dart';
import '../networking/api_services/api_service_store.dart';

final getIt = GetIt.instance;

Future<void> getItInit() async {
  // dio and ApiService
  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiServiceUser>(
      () => ApiServiceUser(dio, baseUrl: ApiConstants.apiBaseUrl));
  getIt.registerLazySingleton<ApiServiceItems>(() => ApiServiceItems(dio));
  getIt.registerLazySingleton<ApiServiceCustomers>(
      () => ApiServiceCustomers(dio));
  getIt.registerLazySingleton<ApiServiceOrders>(() => ApiServiceOrders(dio));
  getIt.registerLazySingleton<ApiServiceStoreItems>(
      () => ApiServiceStoreItems(dio));
  getIt
      .registerLazySingleton<ApiServicePayments>(() => ApiServicePayments(dio));
  getIt
      .registerLazySingleton<ApiServiceBranches>(() => ApiServiceBranches(dio));
  getIt.registerLazySingleton<ApiServiceGetStores>(
      () => ApiServiceGetStores(dio));
  getIt.registerLazySingleton<ApiServiceGetmandoben>(
      () => ApiServiceGetmandoben(dio));

  // GET MANDOBEN repo
  getIt.registerLazySingleton<GetMandobenRepo>(
      () => GetMandobenRepo(getIt.get<ApiServiceGetmandoben>()));

  getIt.registerLazySingleton<GetMandobenCubit>(() => GetMandobenCubit(
      getIt.get<GetMandobenRepo>(), getIt.get<GetMandobenRepo>()));

  // GET STORES repo
  getIt.registerLazySingleton<GetStoresRepo>(
      () => GetStoresRepo(getIt.get<ApiServiceGetStores>()));

  getIt.registerLazySingleton<GetStoresCubit>(() =>
      GetStoresCubit(getIt.get<GetStoresRepo>(), getIt.get<GetStoresRepo>()));
  // branches repo
  getIt.registerLazySingleton<GetBranchesRepo>(
      () => GetBranchesRepo(getIt.get<ApiServiceBranches>()));
  getIt.registerLazySingleton<GetBranchesCubit>(() => GetBranchesCubit(
      getIt.get<GetBranchesRepo>(), getIt.get<GetBranchesRepo>()));

  // store repo
  getIt.registerLazySingleton<GetStoreItemsRepo>(
      () => GetStoreItemsRepo(getIt.get<ApiServiceStoreItems>()));
  getIt.registerLazySingleton<StoreitemsCubit>(() => StoreitemsCubit(
      getIt.get<GetStoreItemsRepo>(), getIt.get<GetStoreItemsRepo>()));
  // login repo
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt.get<ApiServiceUser>()));

  getIt.registerLazySingleton<LoginCubit>(() =>
      LoginCubit(getIt.get<LoginRepo>(), getIt.get<RepresentativeRepo>()));

  getIt.registerLazySingleton<RepresentativeRepo>(
      () => RepresentativeRepo(getIt.get<ApiServiceUser>()));

  // customers repo
  getIt.registerLazySingleton<GetCustomersRepo>(
      () => GetCustomersRepo(getIt.get<ApiServiceCustomers>()));

  getIt.registerLazySingleton<CustomersCubit>(() => CustomersCubit(
      getIt.get<GetCustomersRepo>(), getIt.get<GetCustomersRepo>()));

  // customers Payment repo
  getIt.registerLazySingleton<CustPaymentsRepo>(
      () => CustPaymentsRepo(getIt.get<ApiServicePayments>()));
  getIt.registerLazySingleton<CustPaymentsCubit>(() => CustPaymentsCubit(
      getIt.get<CustPaymentsRepo>(), getIt.get<CustPaymentsRepo>()));

  // items repo
  getIt.registerLazySingleton<OrdersAddRepo>(
      () => OrdersAddRepo(getIt.get<ApiServiceOrders>()));

  getIt.registerLazySingleton<OrdersAddCubit>(() =>
      OrdersAddCubit(getIt.get<OrdersAddRepo>(), getIt.get<OrdersAddRepo>()));

  // items repo
  getIt.registerLazySingleton<GetItemsRepo>(
      () => GetItemsRepo(getIt.get<ApiServiceItems>()));

  getIt.registerLazySingleton<ItemsCubit>(
      () => ItemsCubit(getIt.get<GetItemsRepo>(), getIt.get<GetItemsRepo>()));

// customers report repo
  getIt.registerLazySingleton<ApiServiceCustomersReport>(
      () => ApiServiceCustomersReport(dio));
  getIt.registerLazySingleton<CustomersReportRepo>(
      () => CustomersReportRepo(getIt.get<ApiServiceCustomersReport>()));

  getIt.registerLazySingleton<CustomersReportCubit>(() => CustomersReportCubit(
      getIt.get<CustomersReportRepo>(), getIt.get<CustomersReportRepo>()));

  // orders repo
  //getIt.registerLazySingleton<OrdersAddRepo>(
  //() => OrdersAddRepo(getIt.get<ApiService>()));
  //getIt.registerLazySingleton<OrdersAddCubit>(() => OrdersAddCubit(
  //getIt.get<OrdersAddRepo>(), getIt.get<OrdersAddRepo>()));
}
