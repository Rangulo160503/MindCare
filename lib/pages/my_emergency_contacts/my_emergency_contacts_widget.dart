import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_emergency_contacts_model.dart';
export 'my_emergency_contacts_model.dart';

class MyEmergencyContactsWidget extends StatefulWidget {
  const MyEmergencyContactsWidget({super.key});

  static String routeName = 'MyEmergencyContacts';
  static String routePath = '/myEmergencyContacts';

  @override
  State<MyEmergencyContactsWidget> createState() =>
      _MyEmergencyContactsWidgetState();
}

class _MyEmergencyContactsWidgetState extends State<MyEmergencyContactsWidget> {
  late MyEmergencyContactsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyEmergencyContactsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'My Emergency Contacts',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FutureBuilder<List<EmergencyContactsRecord>>(
                  future: queryEmergencyContactsRecordOnce(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<EmergencyContactsRecord>
                        helpLinesInformationListViewEmergencyContactsRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final helpLinesInformationListViewEmergencyContactsRecord =
                        helpLinesInformationListViewEmergencyContactsRecordList
                                .isNotEmpty
                            ? helpLinesInformationListViewEmergencyContactsRecordList
                                .first
                            : null;

                    return ListView(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (isiOS) {
                                      await launchUrl(Uri.parse(
                                          "sms:${helpLinesInformationListViewEmergencyContactsRecord!.phoneNumber}&body=${Uri.encodeComponent('¡Emergencia! Necesito ayuda urgente. Por favor, contáctame.')}"));
                                    } else {
                                      await launchUrl(Uri(
                                        scheme: 'sms',
                                        path:
                                            helpLinesInformationListViewEmergencyContactsRecord!
                                                .phoneNumber,
                                        queryParameters: <String, String>{
                                          'body':
                                              '¡Emergencia! Necesito ayuda urgente. Por favor, contáctame.',
                                        },
                                      ));
                                    }
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      helpLinesInformationListViewEmergencyContactsRecord
                                          ?.name,
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await launchURL('tel:{phone_number}');
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      helpLinesInformationListViewEmergencyContactsRecord
                                          ?.phoneNumber,
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 7.0))
                                .around(SizedBox(width: 7.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(AddEmergencyContactsWidget.routeName);
                  },
                  text: 'Back',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
