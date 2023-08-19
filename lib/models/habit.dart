class Habit {
  String title;
  String details;
  String activity;
  String period;

  Habit(
      {required this.title,
      required this.details,
      required this.activity,
      required this.period});

  setTitle(String title) {
    this.title = title;
  }

  setDetails(String details) {
    this.details = details;
  }

  setActivity(String activity) {
    this.activity = activity;
  }

  setPeriod(String period) {
    this.period = period;
  }

  getTitle() {
    return title;
  }

  getDetails() {
    return details;
  }

  getActivity() {
    return activity;
  }

  getPeriod() {
    return period;
  }
}
