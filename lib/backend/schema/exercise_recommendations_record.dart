import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseRecommendationsRecord extends FirestoreRecord {
  ExerciseRecommendationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  bool hasMood() => _mood != null;

  // "exercise_name" field.
  String? _exerciseName;
  String get exerciseName => _exerciseName ?? '';
  bool hasExerciseName() => _exerciseName != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _mood = snapshotData['mood'] as String?;
    _exerciseName = snapshotData['exercise_name'] as String?;
    _category = snapshotData['category'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercise_recommendations');

  static Stream<ExerciseRecommendationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ExerciseRecommendationsRecord.fromSnapshot(s));

  static Future<ExerciseRecommendationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExerciseRecommendationsRecord.fromSnapshot(s));

  static ExerciseRecommendationsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ExerciseRecommendationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExerciseRecommendationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExerciseRecommendationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExerciseRecommendationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExerciseRecommendationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExerciseRecommendationsRecordData({
  String? userId,
  String? mood,
  String? exerciseName,
  String? category,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'mood': mood,
      'exercise_name': exerciseName,
      'category': category,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExerciseRecommendationsRecordDocumentEquality
    implements Equality<ExerciseRecommendationsRecord> {
  const ExerciseRecommendationsRecordDocumentEquality();

  @override
  bool equals(
      ExerciseRecommendationsRecord? e1, ExerciseRecommendationsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.mood == e2?.mood &&
        e1?.exerciseName == e2?.exerciseName &&
        e1?.category == e2?.category &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ExerciseRecommendationsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.mood, e?.exerciseName, e?.category, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ExerciseRecommendationsRecord;
}
