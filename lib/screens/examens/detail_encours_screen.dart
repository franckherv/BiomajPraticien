// ignore_for_file: must_be_immutable, invalid_use_of_visible_for_testing_member, dead_code
import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Patch2;
import 'dart:io' as Io;
import 'package:image/image.dart' as Image2;
import 'package:path_provider/path_provider.dart';

import '../../utils/simple_loader.dart';

class DetailExamenencoursScreen extends StatefulWidget {
  Examencours examencours;

  DetailExamenencoursScreen({Key? key, required this.examencours});

  @override
  State<DetailExamenencoursScreen> createState() =>
      _DetailExamenencoursScreenState();
}

class _DetailExamenencoursScreenState extends State<DetailExamenencoursScreen> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Patientez svp";
  bool buttonColor = false;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: buttonColor
          ? const SizedBox()
          : FloatingActionButton.extended(
              onPressed: () {
                saveExamens();
                setState(() {
                  buttonColor = true;
                });
              },
              icon: const Icon(Icons.save),
              label: const Text("Sauvegarder"),
            ),
      appBar: appBarmenu(
          context: context,
          title: "Détail examens en cours",
          bgClr: Colors.white,
          color: Colors.black,
          elevation: 0),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.fontdecran,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setHeight(15),
              vertical: ScreenUtil().setHeight(10)),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // margin: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Date',
                          ),
                          trailing: Text(CommonVariable.ddMMYYFormat.format(
                              DateTime.parse(widget.examencours.updatedAt))),
                        ),
                        ListTile(
                          title: const Text(
                            'Statut de l\'analyse',
                          ),
                          trailing: widget.examencours.etatId == 2
                              ? const Chip(label: Text("encours"))
                              : const Chip(label: Text("Terminé")),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          title: const Text("Description"),
                          subtitle:
                              widget.examencours.descriptionanalyse != null
                                  ? Text(widget.examencours.descriptionanalyse!,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400))
                                  : const Text('Aucune description inscrite',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: SizedBox(
                    height: 150.0,
                    child: _imageFiles.isNotEmpty
                        ? GridView.builder(
                            itemCount: _imageFiles.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              if (_isLoading) {
                                return SimpleLoaderWidget(
                                  isLoading: _isLoading,
                                  message: "Chargement en cours ...",
                                );
                              } else {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Image.file(
                                    _imageFiles[index],
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                            },
                          )
                        : _imageFiles.isEmpty && _isLoading == true
                            ? SimpleLoaderWidget(
                                isLoading: _isLoading,
                                message: "Chargement en cours ...",
                              )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 // Text(
                                //   "Aucune image sélectionnée !",
                                // )
                                Row(
                                  children: [
                                    Container(
                                      width: 110.w,
                                      height: 110.h,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 5, color: Colors.grey.shade300),
                                      ),
                                      child: const Icon(
                                        Icons.add_a_photo,
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                  const Text(
                                  "Aucune image sélectionnée !",
                                )
                                  ],
                                )
                                // Icon(
                                //   Icons.image,
                                //   size: 50.0,
                                //   color: Colors.black54,
                                // ),
                                // Text(
                                //   "Aucune image sélectionnée !",
                                // )
                              ],
                            )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_imageFiles.length == 0)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Choisir ou tirer une photo en \nappuyant sur l'icon ci-dessous",
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                            child: TextButton(
                                onPressed: () {
                                  captureImage(ImageSource.camera);
                                },
                                child: const Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Colors.black54,
                                ))),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                            child: TextButton(
                                onPressed: () {
                                  captureImage(ImageSource.gallery);
                                },
                                child: const Icon(
                                  Icons.add_photo_alternate,
                                  size: 50,
                                  color: Colors.black54,
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //! DECLARE IMAGE LENGHT VARIABLE
  List<Io.File> _imageFiles = [];

  _buildImage() {
    if (_imageFiles.length > 0) {
      print('###_imageFiles#####$_imageFiles###');

      for (var i = 0; i < _imageFiles.length; i++) {
        return Image.file(
          _imageFiles[i],
          fit: BoxFit.fill,
        );
      }
    } else {
      return const Text(
        "choisir une photo de profil",
      );
    }
  }

  //! DECLARE CAPTURE IMAGE FUNTION
  Future<void> captureImage(ImageSource imageSource) async {
    try {
      final imageFile =
          await ImagePicker.platform.getImageFromSource(source: imageSource);
      setState(() {
        _isLoading = true;
      });
      Io.File _imageFile = await redimentionImageEtCopie(imageFile);

      setState(() {
        _imageFiles.add(_imageFile);
        _isLoading = false;
        //_imageFile = _imageFile;
        //cest ici que je dois gerer le parametrage de limage
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  //! DECLARE RESIZE IMAGE FUNTION
  Future<Io.File> redimentionImageEtCopie(imagefile) async {
    // Read a jpeg image from file.
    final filename = Patch2.basename(imagefile.path);
    //parametrage.image = filename;
    Image2.Image? image =
        Image2.decodeImage(Io.File(imagefile.path).readAsBytesSync());

    // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    Image2.Image bonneImage =
        Image2.copyResize(image!, width: 400, height: 400);
    String dir = (await getApplicationDocumentsDirectory()).path;
    // Save the thumbnail as a PNG.
    return Io.File('$dir/$filename')
      ..writeAsBytesSync(Image2.encodePng(bonneImage));
  }

  //Io.File? _imageFile;
  /* Future<void> captureImage(ImageSource imageSource) async {
    try {
      await Future.delayed(const Duration(milliseconds: 0));
      final imageFile = await ImagePicker.platform.getImageFromSource(source: imageSource);
      _imageFile = await redimentionImageEtCopie(imageFile);
      setState(() {
        _imageFile = _imageFile;
      });
    } catch (e) {
      print(e);
    }
  } */

  /* Widget imagePicker() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              if (_imageFile != null) {
                captureImage(ImageSource.gallery);
              }
            },
            child: Container(
              alignment: Alignment.center,
              // margin: const EdgeInsets.only(top: 8, right: 10),
              height: ScreenUtil().setHeight(80),
              // width: ScreenUtil().setWidth(200),
              decoration: BoxDecoration(
                  color: _imageFile == null ? Colors.grey[200] : null,
                  border: Border.all(
                      width: 1, //
                      color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.1),
                      BlendMode.luminosity,
                    ),
                    image: FileImage(File(_imageFile?.path ?? "")),
                    fit: BoxFit.cover,
                  )),
              child: Text(
                "fichier.pdf",
                style: TextStyle(
                    color:
                        _imageFiles.isNotEmpty  ? Colors.transparent : Colors.grey,
                    fontSize: 12,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        _imageFiles.isNotEmpty
            ? const SizedBox()
            : Expanded(
                // flex: 2,
                child: TextButton(
                child: const Text(
                  "Télécharger un fichier PDF",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () async {
                  captureImage(ImageSource.gallery);
                },
              ))
      ],
    );
  }
 */

  saveExamens() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .saveAnalyse(
            id: widget.examencours.id, statut: "3", fichier: _imageFiles)
        .then((datas) {
      Navigator.of(context).pop();
      if (datas["code"] == 1) {
        displayToastmessage("Enrégistrement éffectué avec succeès !", context);

        // Navigator.of(context).pushNamedAndRemoveUntil(
        //   '/succes-appointement',
        //   (Route<dynamic> route) => false,
        // );
      } else {
        displayToastmessage("${datas["message"]}", context);
      }
    }).catchError((err, error) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
