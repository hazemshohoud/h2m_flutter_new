class ApiConstants {
  static String apiBaseUrl = "https://h2m.runasp.net";
  //static const String apiBaseUrlApi = "https://41.235.105.178:3000/"; admin

  static const String login = "/User/Login";

  static const String getMosamAmal = "/User/GetMosamAmal";

  static const String getRepresentative = "/User/getslaheyatuser";

  //Products/GetProductSerch

  static const String getProduts = "/Products/GetProductSerch";
  //Products/GetProductId

  static const String getProductId = "/Products/GetProductId";
  //Products/AddHarketMkhzan

  static const String addHarketMkhzan = "/Products/AddHarketMkhzan";
  //Order/GetIdOrder

  static const String getIdOrder = "/Order/GetIdOrder";
  //Order/GetIdHrketmakhzan

  static const String getIdHrketmakhzan = "/Order/GetIdHrketmakhzan";
  //Order/GetWardia

  static const String getWardia = "/Order/GetWardia";
  //Order/AddArbah

  static const String addArbah = "/Order/AddArbah";
  //Order/AddNakdia

  static const String addNakdia = "/Order/AddNakdia";
  //Order/AddOrder

  static const String addOrder = "/Order/AddOrder";
  //Order/getorderDate

  static const String getOrderDate = "/Order/getorderDate";
  //Order/GetOrderId

  static const String getOrderId = "/Order/GetOrderId";
  //OrderDetels/AddOrderDetels

  static const String addOrderDetels = "/OrderDetels/AddOrderDetels";
  //OrderDetels/GetOrderDetalse

  static const String getOrderDetalse = "/OrderDetels/GetOrderDetalse";
  //Omla/GetIdOmla

  static const String getIdOmla = "/Omla/GetIdOmla";
  //Omla/GetIdHrketOmla

  static const String getIdHrketOmla = "/Omla/GetIdHrketOmla";
  //Omla/AddOmla
  static const String getHarketOmala = "/Omla/GetHarketOmala";

  static const String getHarketOmalaId = "/Omla/GetHarketOmalaIdAmel";
  //DeleteHarketOmala

  static const String deleteHarketOmala = "/Omla/DeleteHarketAmel";

  static const String addOmla = "/Omla/AddOmla";
  //Omla/GeLastOrderAmel

  static const String getLastOrderAmel = "/Omla/GeLastOrderAmel";
  //Omla/GetAmel

  static const String getOneCust = "/Omla/GetAmel";
  //Omla/SerchOmla

  static const String getAllCustomers = "/Omla/SerchOmla";
  //Omla/GetNowAmel

  static const String getNowAmel = "/Omla/GetNowAmel";
  //Omla/AddAmel

  static const String addAmel = "/Omla/AddAmel";
  //Omla/GetHarketOmlaId

  static const String getHarketOmlaId = "/Omla/GetHarketOmlaId";
  //Omla/AddHrketOmla

  static const String addHrketOmla = "/Omla/AddHrketOmla";
  //Omla/AddHrketOmlaSdad

  static const String addHrketOmlaSdad = "/Omla/AddHrketOmlaSdad";

  static String addHarketEdda = "/OrderDetels/AddHarketEdaa";

  static String getStoreItems = "/Products/GetMpeatAndRasedMkzan";

  static String getBranches = "/Mndoben/getFrowShrka";

  static String getMkhazen = "/Mndoben/getMkhazen";

  static String getMandoben = "/Mndoben/GetMndoben";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
