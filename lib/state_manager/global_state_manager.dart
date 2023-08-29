import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart'; 




class GlobalStateManager extends ChangeNotifier{

   List<Contact>? selectedContacts;
  String? choosedContact;
  String? choosedContactName;
  bool? newGroupOrContactAdded;
  bool? newSmsSent;

  void setNewSmsSent(bool sent) {
    newSmsSent = sent;
    notifyListeners();
  }

  get getNewSmsSent{
    return newSmsSent;
  }


  void setNewGroupOrContactAdded(bool added) {
    newGroupOrContactAdded = added;
    notifyListeners();
  }

  get getNewGroupOrContactAdded{
    return newGroupOrContactAdded;
  }

  void setChoosedContactName(String name) {
    choosedContactName = name;
    notifyListeners();
  }

  get getChoosedContactName{
    return choosedContactName;
  }

  void setChoosedContact(String contact) {
    choosedContact = contact;
    notifyListeners();
  }

  get getChoosedContact{
    return choosedContact;
  }

  void setSelectedContacts(List<Contact> contacts) {
    selectedContacts = contacts;
    notifyListeners();
  }

  get getSelectedContacts{
    return selectedContacts;
  }

  // void setPagination(PaginationModel newPagination) {
  //   pagination = newPagination;
  //   notifyListeners();
  // }

  // get getPagination {
  //   return pagination;
  // }



}