import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/Debendncy%20injection/debendncy_injection.dart';
import 'package:h2m_destrib/core/Routing/app_router.dart';
import 'package:h2m_destrib/features/Home/logic/cubits/branches_cubit.dart';
import 'package:h2m_destrib/features/Home/logic/cubits/get_mandoben_cubit.dart';
import 'package:h2m_destrib/features/pages/payments/logic/cubit/cust_payments_cubit.dart';
import 'package:h2m_destrib/features/pages/sales/items/logic/cubit/get_items_cubit.dart';
import 'package:h2m_destrib/features/pages/sales/orders/logic/cubit/order_add_cubit.dart';
import 'package:h2m_destrib/features/pages/stores/logic/cubit/storeitems_cubit.dart';
import 'package:h2m_destrib/h2m_destrib_app.dart';
import 'features/Home/logic/cubits/get_stores_cubit.dart';
import 'features/login/logic/cubit/login_cubit.dart';
import 'features/pages/customers/logic/cubit/customers_cubit.dart';
import 'features/pages/customers_report/logic/cubit/customers_report_cubit.dart';

void main() async {
  await getItInit();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt<LoginCubit>()),
      BlocProvider(create: (_) => getIt<CustomersCubit>()),
      BlocProvider(create: (_) => getIt<ItemsCubit>()),
      BlocProvider(create: (_) => getIt<OrdersAddCubit>()),
      BlocProvider(create: (_) => getIt<CustPaymentsCubit>()),
      BlocProvider(create: (_) => getIt<StoreitemsCubit>()),
      BlocProvider(create: (_) => getIt<GetBranchesCubit>()),
      BlocProvider(create: (_) => getIt<GetStoresCubit>()),
      BlocProvider(create: (_) => getIt<GetMandobenCubit>()),
      BlocProvider(create: (_) => getIt<CustomersReportCubit>())
    ],
    child: H2mDestrib(
      appRouter: AppRouter(),
    ),
  ));
}
