// ignore_for_file: must_be_immutable, invalid_use_of_visible_for_testing_member, dead_code
import 'dart:io';

import 'package:biomaj/constants/appBar.dart';
import 'package:biomaj/constants/app_images.dart';
import 'package:biomaj/constants/common_variable.dart';
import 'package:biomaj/datasources/http_global_datasource.dart';
import 'package:biomaj/models/list_exam.dart';
import 'package:biomaj/widgets/loading/loading_spinner.dart';
import 'package:biomaj/widgets/pdf_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Patch2;
import 'dart:io' as Io;
import 'package:image/image.dart' as Image2;
import 'package:path_provider/path_provider.dart';

import '../../models/uploadFile.dart';

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

  PlatformFile? _file;
  File? _imageFiles;
  // ignore: unused_field
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        _file = result.files.first;
        _fileName = _file!.name;
        _imageFile = File(_file!.path!);
      });
    }
  }

  UploadFile uploadFile = UploadFile(data: []);

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      getPictures();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          saveExamens();
        },
        icon: const Icon(Icons.save),
        label: const Text("Enregistrer"),
      ),
      appBar: appBarmenu(
          context: context,
          title: "Détail examens cours",
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
                        widget.examencours.patient != null
                            ? Column(
                                children: [
                                  ListTile(
                                    title: const Text(
                                      'Nom',
                                    ),
                                    trailing: Text(widget
                                        .examencours.patient!.nomuser
                                        .toString()),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Prenom',
                                    ),
                                    trailing: Text(widget
                                        .examencours.patient!.prenomuser
                                        .toString()),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Matricule',
                                    ),
                                    trailing: Text(widget
                                        .examencours.patient!.matriculeuser
                                        .toString()),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        ListTile(
                          title: const Text(
                            'Date de \nprescription',
                          ),
                          trailing: Text(CommonVariable.ddMMYYFormat.format(
                              DateTime.parse(
                                  widget.examencours.createdAt.toString()))),
                        ),
                        ListTile(
                          title: const Text(
                            'Type d\'examens',
                          ),
                          trailing: Text(widget
                              .examencours.typeExam!.libelletypeexamen
                              .toString()),
                        ),
                        ListTile(
                          title: const Text(
                            'Examens démandé',
                          ),
                          trailing:
                              Text(widget.examencours.examendemande.toString()),
                        ),
                        ListTile(
                            title: const Text(
                              'Statut de l\'analyse',
                            ),
                            trailing: Chip(
                                label: Text(
                                  widget.examencours.getStatus(),
                                ),
                                backgroundColor: widget.examencours.color(),
                                labelStyle:
                                    const TextStyle(color: Colors.white))),
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
              SizedBox(
                height: 10.h,
              ),
              uploadFile.data.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0.h,
                      ),
                      child: Column(
                        children: [
                          const Text("Document déjà téléchargée"),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                              height: 120.0,
                              child: GridView.builder(
                                itemCount: uploadFile.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  final fileUrl =
                                      "${CommonVariable.imageBaseUrl}${uploadFile.data[index].image}";

                                  // Vérifier si le fichier est un PDF
                                  if (fileUrl.endsWith('.pdf')) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PDFViewer(pdfUrl: fileUrl),
                                          ),
                                        );
                                      },
                                      child: const Icon(Icons.file_copy,
                                          size: 70,
                                          color:
                                              Color.fromARGB(255, 14, 50, 78)),
                                    );
                                  } else {
                                    return Image.network(
                                      "${CommonVariable.imageBaseUrl}${uploadFile.data[index].image}",
                                      fit: BoxFit.fill,
                                    );
                                  }
                                },
                              )),
                          Align(alignment: Alignment.centerLeft,
                              child: Text("Doc (${uploadFile.data.length})"))
                        ],
                      ))
                  : Container(),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0.h, bottom: 10.0, left: 20.0, right: 20.0),
                child: SizedBox(
                  height: _imageFile != null ? 50 : 150.0.h,
                  child: _imageFile != null
                      ? Container(
                          alignment: Alignment.center,
                          width: 60.r,
                          height: 70.h,
                          child: _imageFile!.path.endsWith('.pdf')
                              ? Icon(
                                  Icons.picture_as_pdf,
                                  size: 50.r,
                                  color: Colors.red,
                                )
                              : Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 110.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 5,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.description,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text(
                                  "Aucun document sélectionné !",
                                )
                              ],
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20),
              _buildFileDisplay(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_imageFile != null)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Choisir ou tirer une photo en appuyant \nsur l'une des icons ci-dessous.",
                          textAlign: TextAlign.center,
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
                                  _pickFile();
                                },
                                child: const Icon(
                                  Icons.description,
                                  size: 50,
                                  color: Colors.black54,
                                ))),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Io.File? _imageFile;
  Future<void> captureImage(ImageSource imageSource) async {
    try {
      await Future.delayed(const Duration(milliseconds: 0));
      final imageFile =
          await ImagePicker.platform.getImageFromSource(source: imageSource);
      _imageFile = await redimentionImageEtCopie(imageFile);
      setState(() {
        _imageFile = _imageFile;
      });
    } catch (e) {}
  }

  Widget _buildFileDisplay() {
    if (_imageFiles != null) {
      // Vérifier si le fichier est un PDF
      if (_imageFiles!.path.endsWith('.pdf')) {
        return const Icon(
          Icons.picture_as_pdf,
          size: 100,
          color: Colors.red,
        ); // Affiche une icône PDF si c'est un fichier PDF
      }
      // Vérifier si le fichier est une image (par extension)
      else if (_imageFiles!.path.endsWith('.png') ||
          _imageFiles!.path.endsWith('.jpg') ||
          _imageFiles!.path.endsWith('.jpeg') ||
          _imageFiles!.path.endsWith('.gif')) {
        return Image.file(
          _imageFiles!,
          width: 200,
          height: 200,
        ); // Affiche l'image si c'est une image
      } else {
        return const Icon(
          Icons.insert_drive_file,
          size: 100,
          color: Colors.grey,
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  // DECLARE RESIZE IMAGE FUNTION
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

//? get all picture
  getPictures() async {
    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource.getImage(id: widget.examencours.id).then((data) {
      Navigator.of(context).pop();
      setState(() {
        uploadFile = data;
      });
    }).catchError((err) {
      Navigator.of(context).pop();
      displayToastmessage("Oupps! une erreur s'est produite", context);
    });
  }

  saveExamens() async {
    setState(() {
      loadingMessage = "Demande en cours ....";
    });

    LoadingSpinner.showLoadingDialog(context, _keyLoader, loadingMessage);
    await httpGlobalDatasource
        .saveAnalyse(
            id: widget.examencours.id,
            statut: "3",
            fichier: _imageFile ?? _imageFiles)
        .then((datas) {
      Navigator.of(context).pop();
      setState(() {
        uploadFile = datas;
      });
      displayToastmessage("Enrégistrement éffectué avec succeès !", context);
      Navigator.of(context).pushNamed('/analysee-en-cours-screen');
    }).catchError((err, error) {
      Navigator.of(context).pop();

      displayToastmessage("Oupps! Une erreur s'est produite", context);
    });
  }

  displayToastmessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
