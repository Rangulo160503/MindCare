import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'anonymous_forum_page_model.dart';
export 'anonymous_forum_page_model.dart';

class AnonymousForumPageWidget extends StatefulWidget {
  const AnonymousForumPageWidget({super.key});

  static String routeName = 'AnonymousForumPage';
  static String routePath = '/anonymousForumPage';

  @override
  State<AnonymousForumPageWidget> createState() =>
      _AnonymousForumPageWidgetState();
}

class _AnonymousForumPageWidgetState extends State<AnonymousForumPageWidget> {
  late AnonymousForumPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnonymousForumPageModel());
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
            'Page Title',
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
          child: StreamBuilder<List<AnonymousPostsRecord>>(
            stream: queryAnonymousPostsRecord(
              queryBuilder: (anonymousPostsRecord) =>
                  anonymousPostsRecord.orderBy('timestamp', descending: true),
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
              List<AnonymousPostsRecord> columnAnonymousPostsRecordList =
                  snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(columnAnonymousPostsRecordList.length,
                    (columnIndex) {
                  final columnAnonymousPostsRecord =
                      columnAnonymousPostsRecordList[columnIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<AnonymousPostsRecord>>(
                            stream: queryAnonymousPostsRecord(
                              queryBuilder: (anonymousPostsRecord) =>
                                  anonymousPostsRecord.orderBy('timestamp',
                                      descending: true),
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
                              List<AnonymousPostsRecord>
                                  textodelmensajeAnonymousPostsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textodelmensajeAnonymousPostsRecord =
                                  textodelmensajeAnonymousPostsRecordList
                                          .isNotEmpty
                                      ? textodelmensajeAnonymousPostsRecordList
                                          .first
                                      : null;

                              return Text(
                                valueOrDefault<String>(
                                  textodelmensajeAnonymousPostsRecord?.text,
                                  'Esta bueno',
                                ),
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              );
                            },
                          ),
                          if (columnAnonymousPostsRecord.isAnonymous)
                            StreamBuilder<List<AnonymousPostsRecord>>(
                              stream: queryAnonymousPostsRecord(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AnonymousPostsRecord>
                                    annimoAnonymousPostsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final annimoAnonymousPostsRecord =
                                    annimoAnonymousPostsRecordList.isNotEmpty
                                        ? annimoAnonymousPostsRecordList.first
                                        : null;

                                return Text(
                                  valueOrDefault<String>(
                                    columnAnonymousPostsRecord.isAnonymous
                                        .toString(),
                                    'Si',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF888888),
                                        letterSpacing: 0.0,
                                      ),
                                );
                              },
                            ),
                          StreamBuilder<List<AnonymousPostsRecord>>(
                            stream: queryAnonymousPostsRecord(
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
                              List<AnonymousPostsRecord>
                                  fechadepublicacinAnonymousPostsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final fechadepublicacinAnonymousPostsRecord =
                                  fechadepublicacinAnonymousPostsRecordList
                                          .isNotEmpty
                                      ? fechadepublicacinAnonymousPostsRecordList
                                          .first
                                      : null;

                              return Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      "yMd",
                                      fechadepublicacinAnonymousPostsRecord
                                          ?.timestamp),
                                  '3/18/2025',
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFFAAAAAA),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
