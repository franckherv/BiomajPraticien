import 'package:biomaj/screens/common/bottom_tab/add_bottom_appbar.dart';
import 'package:biomaj/screens/common/connexion/sign_in.dart';
import 'package:biomaj/screens/common/inscription/sign_up.dart';
import 'package:biomaj/screens/common/splash/splash_screen.dart';
import 'package:biomaj/screens/compte/compte_user.dart';
import 'package:biomaj/screens/consultations/consu_examen/creation_examen.dart';
import 'package:biomaj/screens/consultations/consulting.dart';
import 'package:biomaj/screens/consultations/create_consulting/create_consulting.dart';
import 'package:biomaj/screens/consultations/detail_consulting.dart';
import 'package:biomaj/screens/consultations/list_consultation.dart';
import 'package:biomaj/screens/consultations/ordonnance/creation_ordonnance.dart';
import 'package:biomaj/screens/examens/analyse.dart';
import 'package:biomaj/screens/examens/analyse_en_cours.dart';
import 'package:biomaj/screens/examens/detail_encours_screen.dart';
import 'package:biomaj/screens/examens/examen_screen.dart';
import 'package:biomaj/screens/examens/examens_detail.dart';
import 'package:biomaj/screens/examens/examens_list_screen.dart';
import 'package:biomaj/screens/homeScreen/home_screen.dart';
import 'package:biomaj/screens/profile/profil_screen.dart';
import 'package:biomaj/screens/rendezvous/rendez_vous_screen.dart';
import 'package:biomaj/screens/rendezvous/prise_de_rdv.dart/succes_rdv.dart';
import 'package:biomaj/screens/rendezvous/vue_des_rdv/detail_de_mesrdv.dart';
import 'package:biomaj/screens/rendezvous/vue_des_rdv/mes_rendez_vous.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Sigin-screen':
        return MaterialPageRoute(builder: (_) => SiginScreen());

      case '/shared_bottom_app_bar':
        SharedBottomAppBar argument = args as SharedBottomAppBar;
        return MaterialPageRoute(
            builder: (_) => SharedBottomAppBar(
                  defauldIndex: argument.defauldIndex,
                ));
      case '/sing-up-screen':
        return MaterialPageRoute(builder: (_) => SingUpScreen());

      case '/succes-appointement':
        return MaterialPageRoute(builder: (_) => SuccesAppointement());

      case '/home-screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/rendez-vous-screen':
        return MaterialPageRoute(builder: (_) => RendezVousScreen());
      case '/examen-screen':
        return MaterialPageRoute(builder: (_) => ExamenScreen());
      case '/analyse-prescrite-screen':
        return MaterialPageRoute(builder: (_) => AnalysePrescriteScreen());
      case '/analyse-termine-screen':
        return MaterialPageRoute(builder: (_) => AnalyseTermineScreen());

      case '/consulting-screen':
        return MaterialPageRoute(builder: (_) => ConsultingScreen());

      case '/mes-rendez-vous-vue':
        return MaterialPageRoute(builder: (_) => MesRendezvousvue());

      case '/list-consultation':
        return MaterialPageRoute(builder: (_) => ListConsultation());

      case '/uer-account':
        return MaterialPageRoute(builder: (_) => UserAccount());

      case '/creation-examen-enregistrement':
        CreationExamen argument = args as CreationExamen;
        return MaterialPageRoute(
            builder: (_) => CreationExamen(
                  cnsulID: argument.cnsulID,
                ));

      case '/creation-ordonnance-enregistrement':
        CreationOrdonnance argument = args as CreationOrdonnance;
        return MaterialPageRoute(
            builder: (_) => CreationOrdonnance(
                  cnsulID: argument.cnsulID,
                ));

      case '/mes-rendez-vous-vue-detail':
        MesrendezvousVueDetail argument = args as MesrendezvousVueDetail;
        return MaterialPageRoute(
            builder: (_) => MesrendezvousVueDetail(
                  detailrdv: argument.detailrdv,
                ));

      case '/detail-consultation-creen':
        DetailConsultationScreen argument = args as DetailConsultationScreen;
        return MaterialPageRoute(
            builder: (_) => DetailConsultationScreen(
                  selectedPage: argument.selectedPage,
                  consultatingData: argument.consultatingData,
                ));

      case '/profil-screen':
        ProfilScreen argument = args as ProfilScreen;
        return MaterialPageRoute(
            builder: (_) => ProfilScreen(
                  selectedPage: argument.selectedPage,
                ));
        //     case '/show-examenbytF':
        // ShowExamenbytF argument = args as ShowExamenbytF;
        // return MaterialPageRoute(
        //     builder: (_) => ShowExamenbytF(
        //           examlist: argument.examlist,
        //         ));

      case '/examen-detail-screen':
        ExamenDetailScreen argument = args as ExamenDetailScreen;
        return MaterialPageRoute(
            builder: (_) => ExamenDetailScreen(
                  examId: argument.examId,
                ));

      case '/Detail-examen-encours-screen':
        DetailExamenencoursScreen argument = args as DetailExamenencoursScreen;
        return MaterialPageRoute(
            builder: (_) => DetailExamenencoursScreen(
                  examencours: argument.examencours,
                ));
      case '/list-examens-screen':
        ListExamensScreen argument = args as ListExamensScreen;
        return MaterialPageRoute(
            builder: (_) => ListExamensScreen(
                  examData: argument.examData,
                ));

      case '/create-consulting-screen':
        CreateConsultingScreen argument = args as CreateConsultingScreen;
        return MaterialPageRoute(
            builder: (_) => CreateConsultingScreen(
                  selectedPage: argument.selectedPage,
                ));

      //

      // case '/otp-code-screen':
      //   OtpCodeScreen argument = args as OtpCodeScreen;
      //   return MaterialPageRoute(
      //       builder: (_) => OtpCodeScreen(
      //             code: argument.code,
      //           ));
      default:
        // If there is no such named route in the switch statement, e.g. /HomeScreen
        return _errorRoute();
    }
  }

  // ShowExamenbytF

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
