class AccountExtra {
  AccountExtra({
    this.employeeId,
    this.prefix,
    this.employeeName,
    this.emailAddress,
    this.departmentId,
    this.departmentName,
    this.branchId,
    this.branchName,
    this.regionId,
    this.regionName,
    this.companyId,
    this.companyName,
  });

  AccountExtra.fromJson(dynamic json) {
    employeeId = json['employee_id'];
    prefix = json['prefix'];
    employeeName = json['employee_name'];
    emailAddress = json['email_address'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    regionId = json['region_id'];
    regionName = json['region_name'];
    companyId = json['company_id'];
    companyName = json['company_name'];
  }

  num? employeeId;
  String? prefix;
  String? employeeName;
  String? emailAddress;
  num? departmentId;
  String? departmentName;
  num? branchId;
  String? branchName;
  num? regionId;
  String? regionName;
  num? companyId;
  String? companyName;

  AccountExtra copyWith({
    num? employeeId,
    String? prefix,
    String? employeeName,
    String? emailAddress,
    num? departmentId,
    String? departmentName,
    num? branchId,
    String? branchName,
    num? regionId,
    String? regionName,
    num? companyId,
    String? companyName,
  }) =>
      AccountExtra(
        employeeId: employeeId ?? this.employeeId,
        prefix: prefix ?? this.prefix,
        employeeName: employeeName ?? this.employeeName,
        emailAddress: emailAddress ?? this.emailAddress,
        departmentId: departmentId ?? this.departmentId,
        departmentName: departmentName ?? this.departmentName,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        regionId: regionId ?? this.regionId,
        regionName: regionName ?? this.regionName,
        companyId: companyId ?? this.companyId,
        companyName: companyName ?? this.companyName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employee_id'] = employeeId;
    map['prefix'] = prefix;
    map['employee_name'] = employeeName;
    map['email_address'] = emailAddress;
    map['department_id'] = departmentId;
    map['department_name'] = departmentName;
    map['branch_id'] = branchId;
    map['branch_name'] = branchName;
    map['region_id'] = regionId;
    map['region_name'] = regionName;
    map['company_id'] = companyId;
    map['company_name'] = companyName;
    return map;
  }
}
