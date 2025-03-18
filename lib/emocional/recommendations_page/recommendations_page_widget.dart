import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'recommendations_page_model.dart';
export 'recommendations_page_model.dart';

class RecommendationsPageWidget extends StatefulWidget {
  const RecommendationsPageWidget({super.key});

  static String routeName = 'RecommendationsPage';
  static String routePath = '/recommendationsPage';

  @override
  State<RecommendationsPageWidget> createState() =>
      _RecommendationsPageWidgetState();
}

class _RecommendationsPageWidgetState extends State<RecommendationsPageWidget> {
  late RecommendationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendationsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MoodTrackingRecord>>(
      stream: queryMoodTrackingRecord(
        queryBuilder: (moodTrackingRecord) => moodTrackingRecord
            .where(
              'user_id',
              isEqualTo: currentUserUid,
            )
            .orderBy('timestamp', descending: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MoodTrackingRecord> recommendationsPageMoodTrackingRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final recommendationsPageMoodTrackingRecord =
            recommendationsPageMoodTrackingRecordList.isNotEmpty
                ? recommendationsPageMoodTrackingRecordList.first
                : null;

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
                'RecommendationsPage',
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
              child: FutureBuilder<List<MoodTrackingRecord>>(
                future: queryMoodTrackingRecordOnce(
                  queryBuilder: (moodTrackingRecord) => moodTrackingRecord
                      .where(
                        'user_id',
                        isEqualTo: currentUserUid != '' ? currentUserUid : null,
                        isNull:
                            (currentUserUid != '' ? currentUserUid : null) ==
                                null,
                      )
                      .orderBy('timestamp', descending: true),
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
                  List<MoodTrackingRecord> columnMoodTrackingRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnMoodTrackingRecord =
                      columnMoodTrackingRecordList.isNotEmpty
                          ? columnMoodTrackingRecordList.first
                          : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: Text(
                          'Hello World',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
