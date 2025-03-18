import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'help_line_widget.dart' show HelpLineWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HelpLineModel extends FlutterFlowModel<HelpLineWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for HelpLinesListView widget.

  PagingController<DocumentSnapshot?, HelpLinesRecord>?
      helpLinesListViewPagingController;
  Query? helpLinesListViewPagingQuery;
  List<StreamSubscription?> helpLinesListViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    helpLinesListViewStreamSubscriptions.forEach((s) => s?.cancel());
    helpLinesListViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, HelpLinesRecord>
      setHelpLinesListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    helpLinesListViewPagingController ??=
        _createHelpLinesListViewController(query, parent);
    if (helpLinesListViewPagingQuery != query) {
      helpLinesListViewPagingQuery = query;
      helpLinesListViewPagingController?.refresh();
    }
    return helpLinesListViewPagingController!;
  }

  PagingController<DocumentSnapshot?, HelpLinesRecord>
      _createHelpLinesListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, HelpLinesRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryHelpLinesRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: helpLinesListViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
