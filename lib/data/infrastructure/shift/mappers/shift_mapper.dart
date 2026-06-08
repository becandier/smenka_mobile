import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';

extension PauseMapper on PauseDto {
  Pause toDomain() {
    return Pause(
      id: id,
      shiftId: shiftId,
      startedAt: startedAt,
      finishedAt: finishedAt,
    );
  }
}

extension ShiftMapper on ShiftDto {
  Shift toDomain() {
    return Shift(
      id: id,
      userId: userId,
      organizationId: organizationId,
      startedAt: startedAt,
      finishedAt: finishedAt,
      status: ShiftStatus.values.byName(status),
      pauses: pauses.map((p) => p.toDomain()).toList(),
      workedSeconds: workedSeconds,
      hasIncompleteRequiredChecklists: hasIncompleteRequiredChecklists,
    );
  }
}
