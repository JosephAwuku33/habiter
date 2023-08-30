// ignore_for_file: constant_identifier_names

enum TimePeriod {
  Morning,
  Noon,
  Afternoon,
  Evening,
  Dawn,
  Dusk,
}

final Map<String, TimePeriod> stringToEnum = {
  'Morning': TimePeriod.Morning,
  'Noon': TimePeriod.Noon,
  'Afternoon': TimePeriod.Afternoon,
  'Evening': TimePeriod.Evening,
  'Dawn': TimePeriod.Dawn,
  'Dusk': TimePeriod.Dusk,
};
