import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MindfulnessExercisesRecord extends FirestoreRecord {
  MindfulnessExercisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "exercise_id" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  bool hasExerciseId() => _exerciseId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "favorite" field.
  bool? _favorite;
  bool get favorite => _favorite ?? false;
  bool hasFavorite() => _favorite != null;

  void _initializeFields() {
    _exerciseId = snapshotData['exercise_id'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _favorite = snapshotData['favorite'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mindfulness_exercises');

  static Stream<MindfulnessExercisesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => MindfulnessExercisesRecord.fromSnapshot(s));

  static Future<MindfulnessExercisesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MindfulnessExercisesRecord.fromSnapshot(s));

  static MindfulnessExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MindfulnessExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MindfulnessExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MindfulnessExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MindfulnessExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MindfulnessExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMindfulnessExercisesRecordData({
  String? exerciseId,
  String? title,
  String? description,
  int? duration,
  bool? favorite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'exercise_id': exerciseId,
      'title': title,
      'description': description,
      'duration': duration,
      'favorite': favorite,
    }.withoutNulls,
  );

  return firestoreData;
}

class MindfulnessExercisesRecordDocumentEquality
    implements Equality<MindfulnessExercisesRecord> {
  const MindfulnessExercisesRecordDocumentEquality();

  @override
  bool equals(MindfulnessExercisesRecord? e1, MindfulnessExercisesRecord? e2) {
    return e1?.exerciseId == e2?.exerciseId &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.duration == e2?.duration &&
        e1?.favorite == e2?.favorite;
  }

  @override
  int hash(MindfulnessExercisesRecord? e) => const ListEquality().hash(
      [e?.exerciseId, e?.title, e?.description, e?.duration, e?.favorite]);

  @override
  bool isValidKey(Object? o) => o is MindfulnessExercisesRecord;
}
