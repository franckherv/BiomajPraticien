
class HttpPaiementDatasource {
/*
  Dio dio = Dio(
    BaseOptions(baseUrl: CommonVariable.sckApiBaseUrl,
        headers: {
      //"Accept": "application/json",
      //"X-SYCA-MERCHANDID": 'C_60D9EEE685DE1', //Test
      "X-SYCA-MERCHANDID": 'C_60D9EA56BB62D', //prod
      //"X-SYCA-APIKEY": 'pk_syca_55a86384eb4f431d1dbdc10ffe2eadfcca61cf94', //Test
      "X-SYCA-APIKEY": 'pk_syca_4bffdc3ae70b7cec858c0eacc78e0bb5d8ebec8b', //prod
      "X-SYCA-REQUEST-DATA-FORMAT": 'JSON',
      "X-SYCA-RESPONSE-DATA-FORMAT": 'JSON'
    }),
  );

  var token;


  Future<SikaLoginModel> login({
    int montant
  }) async {
    try {
      Response response = await dio.post('login.php', data: {
        "montant": montant,
        "currency": "XOF",
      });

      //print("###response.data${response.data}#########");

      return SikaLoginModel.fromJson(response.data);

    } catch (error, stacktrace) {
      print("###error####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  Future<SikaPaiementResultModel> paiementSika({
    @required int montant,
    @required String token,
    @required String telephone,
    @required String name,
    @required String pname,
    @required String numcommande,
    String otp,
  }) async {

    try {

      var params;

      if(otp != null){
        params = {
          //"marchandid": "C_60D9EEE685DE1",//test
          "marchandid": "C_60D9EA56BB62D", //prod
          "montant": montant,
          "currency": "XOF",
          "token": token,
          "telephone": telephone,
          "name": name,
          "pname": pname,
          "numcommande": numcommande,
          "otp": otp,
          "urlnotif": "https://textopro.ci/api/sycapay-notify",
        };
      }else{
        params = {
          //"marchandid": "C_60D9EEE685DE1",//test
          "marchandid": "C_60D9EA56BB62D", //prod
          "montant": montant,
          "currency": "XOF",
          "token": token,
          "telephone": telephone,
          "name": name,
          "pname": pname,
          "numcommande": numcommande,
          "urlnotif": "https://textopro.ci/api/sycapay-notify",
        };
      }
      print("****params********$params*****");

      Response response = await dio.post('checkoutpay.php', data: params);

      print("###response ${response.data}#########");

      return SikaPaiementResultModel.fromJson(response.data);

    } catch (error, stacktrace) {
      print("###error####${error.response}###");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }
  */


}

