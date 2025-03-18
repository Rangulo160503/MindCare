import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationsRecord extends FirestoreRecord {
  RecommendationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "recommended_exercises" field.
  String? _recommendedExercises;
  String get recommendedExercises => _recommendedExercises ?? '';
  bool hasRecommendedExercises() => _recommendedExercises != null;

  // "articles" field.
  String? _articles;
  String get articles => _articles ?? '';
  bool hasArticles() => _articles != null;

  // "preferences" field.
  bool? _preferences;
  bool get preferences => _preferences ?? false;
  bool hasPreferences() => _preferences != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _recommendedExercises = snapshotData['recommended_exercises'] as String?;
    _articles = snapshotData['articles'] as String?;
    _preferences = snapshotData['preferences'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommendations');

  static Stream<RecommendationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommendationsRecord.fromSnapshot(s));

  static Future<RecommendationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecommendationsRecord.fromSnapshot(s));

  static RecommendationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecommendationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommendationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommendationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommendationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecommendationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecommendationsRecordData({
  String? userId,
  String? recommendedExercises,
  String? articles,
  bool? preferences,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'recommended_exercises': recommendedExercises,
      'articles': articles,
      'preferences': preferences,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecommendationsRecordDocumentEquality
    implements Equality<RecommendationsRecord> {
  const RecommendationsRecordDocumentEquality();

  @override
  bool equals(RecommendationsRecord? e1, RecommendationsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.recommendedExercises == e2?.recommendedExercises &&
        e1?.articles == e2?.articles &&
        e1?.preferences == e2?.preferences;
  }

  @override
  int hash(RecommendationsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.recommendedExercises, e?.articles, e?.preferences]);

  @override
  bool isValidKey(Object? o) => o is RecommendationsRecord;
}
