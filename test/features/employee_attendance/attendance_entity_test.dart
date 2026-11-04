import 'package:flutter_test/flutter_test.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';

void main() {
  group('AttendanceEntity.getTodayRecord', () {
    test('returns null when data list is null or empty', () {
      const entityNull = AttendanceEntity(status: 200, message: 'ok');
      expect(entityNull.getTodayRecord(), isNull);

      const entityEmpty = AttendanceEntity(
        status: 200,
        message: 'ok',
        data: [],
      );
      expect(entityEmpty.getTodayRecord(), isNull);
    });

    test('returns matching record for target date', () {
      final targetDate = DateTime(2026, 3, 15);
      const record1 = AttendanceDataEntity(
        id: 1,
        date: '2026-03-14',
        attendanceTime: '09:00:00',
      );
      const record2 = AttendanceDataEntity(
        id: 2,
        date: '2026-03-15',
        attendanceTime: '09:05:00',
      );
      const entity = AttendanceEntity(
        status: 200,
        message: 'ok',
        data: [record1, record2],
      );

      final result = entity.getTodayRecord(targetDate);
      expect(result, isNotNull);
      expect(result?.id, 2);
      expect(result?.date, '2026-03-15');
    });

    test('returns null when no record matches the target date', () {
      final targetDate = DateTime(2026, 3, 16);
      const record = AttendanceDataEntity(
        id: 1,
        date: '2026-03-15',
        attendanceTime: '09:00:00',
      );
      const entity = AttendanceEntity(
        status: 200,
        message: 'ok',
        data: [record],
      );

      final result = entity.getTodayRecord(targetDate);
      expect(result, isNull);
    });

    test('formats single-digit months and days with leading zeros', () {
      final targetDate = DateTime(2026, 1, 5);
      const record = AttendanceDataEntity(
        id: 1,
        date: '2026-01-05',
        attendanceTime: '08:30:00',
      );
      const entity = AttendanceEntity(
        status: 200,
        message: 'ok',
        data: [record],
      );

      final result = entity.getTodayRecord(targetDate);
      expect(result?.id, 1);
    });
  });
}
