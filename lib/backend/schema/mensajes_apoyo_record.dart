import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensajesApoyoRecord extends FirestoreRecord {
  MensajesApoyoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "categoria" field.
  List<String>? _categoria;
  List<String> get categoria => _categoria ?? const [];
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _categoria = getDataList(snapshotData['categoria']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mensajes_Apoyo');

  static Stream<MensajesApoyoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensajesApoyoRecord.fromSnapshot(s));

  static Future<MensajesApoyoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MensajesApoyoRecord.fromSnapshot(s));

  static MensajesApoyoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensajesApoyoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensajesApoyoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensajesApoyoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensajesApoyoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensajesApoyoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensajesApoyoRecordData({
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajesApoyoRecordDocumentEquality
    implements Equality<MensajesApoyoRecord> {
  const MensajesApoyoRecordDocumentEquality();

  @override
  bool equals(MensajesApoyoRecord? e1, MensajesApoyoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.message == e2?.message &&
        listEquality.equals(e1?.categoria, e2?.categoria);
  }

  @override
  int hash(MensajesApoyoRecord? e) =>
      const ListEquality().hash([e?.message, e?.categoria]);

  @override
  bool isValidKey(Object? o) => o is MensajesApoyoRecord;
}
