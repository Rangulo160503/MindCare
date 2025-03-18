import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPreferencesRecord extends FirestoreRecord {
  UserPreferencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "recommendations_enabled" field.
  bool? _recommendationsEnabled;
  bool get recommendationsEnabled => _recommendationsEnabled ?? false;
  bool hasRecommendationsEnabled() => _recommendationsEnabled != null;

  // "preferred_content_types" field.
  List<String>? _preferredContentTypes;
  List<String> get preferredContentTypes => _preferredContentTypes ?? const [];
  bool hasPreferredContentTypes() => _preferredContentTypes != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _recommendationsEnabled = snapshotData['recommendations_enabled'] as bool?;
    _preferredContentTypes =
        getDataList(snapshotData['preferred_content_types']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_preferences');

  static Stream<UserPreferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPreferencesRecord.fromSnapshot(s));

  static Future<UserPreferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPreferencesRecord.fromSnapshot(s));

  static UserPreferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPreferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPreferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPreferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPreferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPreferencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPreferencesRecordData({
  String? userId,
  bool? recommendationsEnabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'recommendations_enabled': recommendationsEnabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPreferencesRecordDocumentEquality
    implements Equality<UserPreferencesRecord> {
  const UserPreferencesRecordDocumentEquality();

  @override
  bool equals(UserPreferencesRecord? e1, UserPreferencesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.recommendationsEnabled == e2?.recommendationsEnabled &&
        listEquality.equals(
            e1?.preferredContentTypes, e2?.preferredContentTypes);
  }

  @override
  int hash(UserPreferencesRecord? e) => const ListEquality()
      .hash([e?.userId, e?.recommendationsEnabled, e?.preferredContentTypes]);

  @override
  bool isValidKey(Object? o) => o is UserPreferencesRecord;
}
