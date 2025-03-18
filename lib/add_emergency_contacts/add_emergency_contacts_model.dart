import '/flutter_flow/flutter_flow_util.dart';
import 'add_emergency_contacts_widget.dart' show AddEmergencyContactsWidget;
import 'package:flutter/material.dart';

class AddEmergencyContactsModel
    extends FlutterFlowModel<AddEmergencyContactsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ContactNameTextField widget.
  FocusNode? contactNameTextFieldFocusNode;
  TextEditingController? contactNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      contactNameTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contactNameTextFieldFocusNode?.dispose();
    contactNameTextFieldTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
