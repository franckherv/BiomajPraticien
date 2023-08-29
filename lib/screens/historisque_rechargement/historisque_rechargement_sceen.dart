import 'package:biomaj/widgets/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HistorisqueRechargementSceen extends StatefulWidget {

  @override
  _HistorisqueRechargementSceenState createState() => _HistorisqueRechargementSceenState();
}

class _HistorisqueRechargementSceenState extends State<HistorisqueRechargementSceen> {

  // List<HistoriqueRechargementModel> _historiqueRechargement = [];

  // HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  // final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  // String loadingMessage = "Veuillez patienter s'il vous plaît ...";

  // bool _isLoading = true;
  // bool initLoadingDatas = true;
  // bool isLoadingMore = false;

  // PaginationModel pagination;

  // int previousPage = 1;

  @override
  void initState() {

    // Future.delayed(const Duration(milliseconds: 0), () {
    //   getHistoriqueRechargement(nextPage: 1, showGlobalLoader: true);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // var provider = context.watch<GlobalStateManager>();

    // if (provider.getPagination != null) {
    //   setState(() {
    //     pagination = provider.getPagination;
    //   });
    //   provider.pagination = null;
    // }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(110)),
        child: SimpleAppBarWidget(title: "Historique de rechargement", context: context, showLeading: true),
      ),
      body: Container());
      
      /* LazyLoadScrollView(
        isLoading: isLoadingMore,
        onEndOfPage: () => pagination != null && pagination.nextPageUrl != null && (pagination.current+1 > previousPage) ? getHistoriqueRechargement(nextPage: pagination.current+1, showGlobalLoader: false) : null,
        child: SingleChildScrollView(
          child: Column(
            children: [

              initLoadingDatas == false && _historiqueRechargement.length > 0 ?
              Stack(
                children: [

                  Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _historiqueRechargement.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                        return DisplayRechargementWidget(
                          rechargement: _historiqueRechargement[index],
                        );
                      },
                    ),
                  ),

                  if(_isLoading)
                    Positioned(
                      bottom: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Center(child: CircularProgressIndicator(backgroundColor: AppColors.appThemeColor,)),
                    )

                ],
              )
                  :
              initLoadingDatas == false && _historiqueRechargement.length == 0 ? NoSmsAvailableWidget()
                  :
              Container(),


            ],
          ),
        ),
      ),
    );


  }


  getHistoriqueRechargement({int nextPage, bool showGlobalLoader}) async {

    setState(() {
      previousPage = nextPage;
      _isLoading = !showGlobalLoader; 
      if(showGlobalLoader)
        initLoadingDatas = true;
    });

    if(showGlobalLoader)
      LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);

    await httpGlobalDatasource
        .getHistoriqueRechargement(context: context, page: nextPage)
        .then((historiqueRechargement) {

      if(showGlobalLoader)
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      setState(() {
        _historiqueRechargement.addAll(historiqueRechargement);
        _isLoading = false;
        if(showGlobalLoader)
          initLoadingDatas = false;
      });

    }).catchError((err) {

      if(showGlobalLoader)
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      setState(() {
        _isLoading = false;
        if(showGlobalLoader)
          initLoadingDatas = false;
      });

      Toaster.showErrorToast(
          message:
          "Désolé une erreur s'est produite veuillez réessayer s'il vous plaît !",
          gravity: ToastGravity.TOP);
    });
  } */
}
}
