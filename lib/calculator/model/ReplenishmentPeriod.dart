import '../../strings/strings.dart';

enum ReplenishmentPeriod {
  day(Strings.dayToggle),
  month(Strings.monthToggle),
  year(Strings.yearToggle);

  const ReplenishmentPeriod(this.name);

  final String name;
}
