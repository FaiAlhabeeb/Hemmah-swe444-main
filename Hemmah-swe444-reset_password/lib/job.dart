class Job {
  late String id;
  late String position;
  late String workplaceType;
  late String jobType;
  late String location;
  late String description;
  late String companyEmail;

  Job();

  Job.fromMap(Map<String, dynamic> map) {
    position = map['position'];
    workplaceType = map['workplaceType'];
    jobType = map['jobType'];
    location = map['location'];
    description = map['description'];
    companyEmail = map['companyEmail'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['position'] = position;
    map['workplaceType'] = workplaceType;
    map['jobType'] = jobType;
    map['location'] = location;
    map['description'] = description;
    map['companyEmail'] = companyEmail;
    return map;
  }
}
