import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'help_linesinformation_widget.dart' show HelpLinesinformationWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HelpLinesinformationModel
    extends FlutterFlowModel<HelpLinesinformationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for HelpLinesInformationListView widget.

  PagingController<DocumentSnapshot?, HelpLinesRecord>?
      helpLinesInformationListViewPagingController;
  Query? helpLinesInformationListViewPagingQuery;
  List<StreamSubscription?> helpLinesInformationListViewStreamSubscriptions =
      [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    helpLinesInformationListViewStreamSubscriptions.forEach((s) => s?.cancel());
    helpLinesInformationListViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, HelpLinesRecord>
      setHelpLinesInformationListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    helpLinesInformationListViewPagingController ??=
        _createHelpLinesInformationListViewController(query, parent);
    if (helpLinesInformationListViewPagingQuery != query) {
      helpLinesInformationListViewPagingQuery = query;
      helpLinesInformationListViewPagingController?.refresh();
    }
    return helpLinesInformationListViewPagingController!;
  }

  PagingController<DocumentSnapshot?, HelpLinesRecord>
      _createHelpLinesInformationListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, HelpLinesRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryHelpLinesRecordPage(
          queryBuilder: (_) =>
              helpLinesInformationListViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: helpLinesInformationListViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
