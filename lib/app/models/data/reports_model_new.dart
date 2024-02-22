class ReportsModelNew {
  ReportsModelNew({
    this.systemId,
    this.subjectName,
    this.regionId,
    this.cityId,
    this.branchId,
    this.sectionId,
    this.stdName,
    this.midtrmYr1Trm1,
    this.midtrmYr1Trm1TchrId,
    this.midtrmYr1Trm1TchrNm,
    this.midtrmYr1Trm1Gpa,
    this.midtrmYr1Trm1Gd,
    this.midtrmYr1Trm2,
    this.midtrmYr1Trm2TchrId,
    this.midtrmYr1Trm2TchrNm,
    this.midtrmYr1Trm2Gpa,
    this.midtrmYr1Trm2Gd,
    this.midtrmYr2Trm1,
    this.midtrmYr2Trm1TchrId,
    this.midtrmYr2Trm1TchrNm,
    this.midtrmYr2Trm1Gpa,
    this.midtrmYr2Trm1Gd,
    this.midtrmYr2Trm2,
    this.midtrmYr2Trm2TchrId,
    this.midtrmYr2Trm2TchrNm,
    this.midtrmYr2Trm2Gpa,
    this.midtrmYr2Trm2Gd,
    this.midyrYr1Trm1,
    this.midyrYr1Trm1TchrId,
    this.midyrYr1Trm1TchrNm,
    this.midyrYr1Trm1Gpa,
    this.midyrYr1Trm1Gd,
    this.midyrYr2Tr1,
    this.midyrYr2Tr1TchrId,
    this.midyrYr2Tr1TchrNm,
    this.midyrYr2Tr1Gpa,
    this.midyrYr2Tr1Gd,
    this.mockexYr1Tr2,
    this.mockexYr1Tr2TchrId,
    this.mockexYr1Tr2TchrNm,
    this.mockexYr1Tr2Gpa,
    this.mockexYr1Tr2Gd,
    this.mockexYr2Tr2,
    this.mockexYr2Tr2TchrId,
    this.mockexYr2Tr2TchrNm,
    this.mockexYr2Tr2Gpa,
    this.mockexYr2Tr2Gd,
    this.prdMidtrmYr1Trm1,
    this.prdMidtrmYr1Trm1TchrId,
    this.prdMidtrmYr1Trm1TchrNm,
    this.prdMidtrmYr1Trm1Gpa,
    this.prdMidtrmYr1Trm1Gd,
    this.prdMidtrmYr2Trm1,
    this.prdMidtrmYr2Trm1TchrId,
    this.prdMidtrmYr2Trm1TchrNm,
    this.prdMidtrmYr2Trm1Gpa,
    this.prdMidtrmYr2Trm1Gd,
    this.presentPercentageYr1Trm1,
    this.presentPercentageYr1Tr2,
    this.presentPercentageYr2Tr1,
    this.presentPercentageYr2Tr2,
    this.avgYr1Trm1Cgpa,
    this.avgYr1Trm2Cgpa,
    this.avgYr2Trm1Cgpa,
    this.avgYr2Trm2Cgpa,
    this.avgYr1Cgpa,
    this.avgYr2Cgpa,
    this.yr1Yr2Cgpa,
    this.subjectId,
  });

  ReportsModelNew.fromJson(dynamic json) {
    systemId = json['system_id'];
    subjectName = json['subject_name'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    branchId = json['branch_id'];
    sectionId = json['section_id'];
    stdName = json['std_name'];
    midtrmYr1Trm1 = json['midtrm_yr1_trm1'];
    midtrmYr1Trm1TchrId = json['midtrm_yr1_trm1_tchr_id'];
    midtrmYr1Trm1TchrNm = json['midtrm_yr1_trm1_tchr_nm'];
    midtrmYr1Trm1Gpa = json['midtrm_yr1_trm1_gpa'];
    midtrmYr1Trm1Gd = json['midtrm_yr1_trm1_gd'];
    midtrmYr1Trm2 = json['midtrm_yr1_trm2'];
    midtrmYr1Trm2TchrId = json['midtrm_yr1_trm2_tchr_id'];
    midtrmYr1Trm2TchrNm = json['midtrm_yr1_trm2_tchr_nm'];
    midtrmYr1Trm2Gpa = json['midtrm_yr1_trm2_gpa'];
    midtrmYr1Trm2Gd = json['midtrm_yr1_trm2_gd'];
    midtrmYr2Trm1 = json['midtrm_yr2_trm1'];
    midtrmYr2Trm1TchrId = json['midtrm_yr2_trm1_tchr_id'];
    midtrmYr2Trm1TchrNm = json['midtrm_yr2_trm1_tchr_nm'];
    midtrmYr2Trm1Gpa = json['midtrm_yr2_trm1_gpa'];
    midtrmYr2Trm1Gd = json['midtrm_yr2_trm1_gd'];
    midtrmYr2Trm2 = json['midtrm_yr2_trm2'];
    midtrmYr2Trm2TchrId = json['midtrm_yr2_trm2_tchr_id'];
    midtrmYr2Trm2TchrNm = json['midtrm_yr2_trm2_tchr_nm'];
    midtrmYr2Trm2Gpa = json['midtrm_yr2_trm2_gpa'];
    midtrmYr2Trm2Gd = json['midtrm_yr2_trm2_gd'];
    midyrYr1Trm1 = json['midyr_yr1_trm1'];
    midyrYr1Trm1TchrId = json['midyr_yr1_trm1_tchr_id'];
    midyrYr1Trm1TchrNm = json['midyr_yr1_trm1_tchr_nm'];
    midyrYr1Trm1Gpa = json['midyr_yr1_trm1_gpa'];
    midyrYr1Trm1Gd = json['midyr_yr1_trm1_gd'];
    midyrYr2Tr1 = json['midyr_yr2_tr1'];
    midyrYr2Tr1TchrId = json['midyr_yr2_tr1_tchr_id'];
    midyrYr2Tr1TchrNm = json['midyr_yr2_tr1_tchr_nm'];
    midyrYr2Tr1Gpa = json['midyr_yr2_tr1_gpa'];
    midyrYr2Tr1Gd = json['midyr_yr2_tr1_gd'];
    mockexYr1Tr2 = json['mockex_yr1_tr2'];
    mockexYr1Tr2TchrId = json['mockex_yr1_tr2_tchr_id'];
    mockexYr1Tr2TchrNm = json['mockex_yr1_tr2_tchr_nm'];
    mockexYr1Tr2Gpa = json['mockex_yr1_tr2_gpa'];
    mockexYr1Tr2Gd = json['mockex_yr1_tr2_gd'];
    mockexYr2Tr2 = json['mockex_yr2_tr2'];
    mockexYr2Tr2TchrId = json['mockex_yr2_tr2_tchr_id'];
    mockexYr2Tr2TchrNm = json['mockex_yr2_tr2_tchr_nm'];
    mockexYr2Tr2Gpa = json['mockex_yr2_tr2_gpa'];
    mockexYr2Tr2Gd = json['mockex_yr2_tr2_gd'];
    prdMidtrmYr1Trm1 = json['prd_midtrm_yr1_trm1'];
    prdMidtrmYr1Trm1TchrId = json['prd_midtrm_yr1_trm1_tchr_id'];
    prdMidtrmYr1Trm1TchrNm = json['prd_midtrm_yr1_trm1_tchr_nm'];
    prdMidtrmYr1Trm1Gpa = json['prd_midtrm_yr1_trm1_gpa'];
    prdMidtrmYr1Trm1Gd = json['prd_midtrm_yr1_trm1_gd'];
    prdMidtrmYr2Trm1 = json['prd_midtrm_yr2_trm1'];
    prdMidtrmYr2Trm1TchrId = json['prd_midtrm_yr2_trm1_tchr_id'];
    prdMidtrmYr2Trm1TchrNm = json['prd_midtrm_yr2_trm1_tchr_nm'];
    prdMidtrmYr2Trm1Gpa = json['prd_midtrm_yr2_trm1_gpa'];
    prdMidtrmYr2Trm1Gd = json['prd_midtrm_yr2_trm1_gd'];
    presentPercentageYr1Trm1 = json['present_percentage_yr1_trm1'];
    presentPercentageYr1Tr2 = json['present_percentage_yr1_tr2'];
    presentPercentageYr2Tr1 = json['present_percentage_yr2_tr1'];
    presentPercentageYr2Tr2 = json['present_percentage_yr2_tr2'];
    avgYr1Trm1Cgpa = json['avg_yr1_trm1_cgpa'];
    avgYr1Trm2Cgpa = json['avg_yr1_trm2_cgpa'];
    avgYr2Trm1Cgpa = json['avg_yr2_trm1_cgpa'];
    avgYr2Trm2Cgpa = json['avg_yr2_trm2_cgpa'];
    avgYr1Cgpa = json['avg_yr1_cgpa'];
    avgYr2Cgpa = json['avg_yr2_cgpa'];
    yr1Yr2Cgpa = json['yr1_yr2_cgpa'];
    subjectId = json['subject_id'];
  }

  num? systemId;
  String? subjectName;
  num? regionId;
  num? cityId;
  num? branchId;
  num? sectionId;
  String? stdName;
  num? midtrmYr1Trm1;
  num? midtrmYr1Trm1TchrId;
  String? midtrmYr1Trm1TchrNm;
  String? midtrmYr1Trm1Gpa;
  String? midtrmYr1Trm1Gd;
  num? midtrmYr1Trm2;
  num? midtrmYr1Trm2TchrId;
  String? midtrmYr1Trm2TchrNm;
  String? midtrmYr1Trm2Gpa;
  String? midtrmYr1Trm2Gd;
  dynamic midtrmYr2Trm1;
  String? midtrmYr2Trm1TchrId;
  String? midtrmYr2Trm1TchrNm;
  String? midtrmYr2Trm1Gpa;
  String? midtrmYr2Trm1Gd;
  String? midtrmYr2Trm2;
  String? midtrmYr2Trm2TchrId;
  String? midtrmYr2Trm2TchrNm;
  dynamic midtrmYr2Trm2Gpa;
  String? midtrmYr2Trm2Gd;
  num? midyrYr1Trm1;
  num? midyrYr1Trm1TchrId;
  String? midyrYr1Trm1TchrNm;
  String? midyrYr1Trm1Gpa;
  String? midyrYr1Trm1Gd;
  dynamic midyrYr2Tr1;
  num? midyrYr2Tr1TchrId;
  String? midyrYr2Tr1TchrNm;
  num? midyrYr2Tr1Gpa;
  String? midyrYr2Tr1Gd;
  num? mockexYr1Tr2;
  num? mockexYr1Tr2TchrId;
  String? mockexYr1Tr2TchrNm;
  String? mockexYr1Tr2Gpa;
  String? mockexYr1Tr2Gd;
  String? mockexYr2Tr2;
  num? mockexYr2Tr2TchrId;
  String? mockexYr2Tr2TchrNm;
  num? mockexYr2Tr2Gpa;
  String? mockexYr2Tr2Gd;
  String? prdMidtrmYr1Trm1;
  dynamic prdMidtrmYr1Trm1TchrId;
  String? prdMidtrmYr1Trm1TchrNm;
  dynamic prdMidtrmYr1Trm1Gpa;
  String? prdMidtrmYr1Trm1Gd;
  String? prdMidtrmYr2Trm1;
  num? prdMidtrmYr2Trm1TchrId;
  String? prdMidtrmYr2Trm1TchrNm;
  num? prdMidtrmYr2Trm1Gpa;
  String? prdMidtrmYr2Trm1Gd;
  String? presentPercentageYr1Trm1;
  String? presentPercentageYr1Tr2;
  String? presentPercentageYr2Tr1;
  String? presentPercentageYr2Tr2;
  String? avgYr1Trm1Cgpa;
  String? avgYr1Trm2Cgpa;
  String? avgYr2Trm1Cgpa;
  String? avgYr2Trm2Cgpa;
  String? avgYr1Cgpa;
  String? avgYr2Cgpa;
  String? yr1Yr2Cgpa;
  num? subjectId;

  ReportsModelNew copyWith({
    num? systemId,
    String? subjectName,
    num? regionId,
    num? cityId,
    num? branchId,
    num? sectionId,
    String? stdName,
    num? midtrmYr1Trm1,
    num? midtrmYr1Trm1TchrId,
    String? midtrmYr1Trm1TchrNm,
    String? midtrmYr1Trm1Gpa,
    String? midtrmYr1Trm1Gd,
    num? midtrmYr1Trm2,
    num? midtrmYr1Trm2TchrId,
    String? midtrmYr1Trm2TchrNm,
    String? midtrmYr1Trm2Gpa,
    String? midtrmYr1Trm2Gd,
    dynamic midtrmYr2Trm1,
    String? midtrmYr2Trm1TchrId,
    String? midtrmYr2Trm1TchrNm,
    String? midtrmYr2Trm1Gpa,
    String? midtrmYr2Trm1Gd,
    String? midtrmYr2Trm2,
    String? midtrmYr2Trm2TchrId,
    String? midtrmYr2Trm2TchrNm,
    dynamic midtrmYr2Trm2Gpa,
    String? midtrmYr2Trm2Gd,
    num? midyrYr1Trm1,
    num? midyrYr1Trm1TchrId,
    String? midyrYr1Trm1TchrNm,
    String? midyrYr1Trm1Gpa,
    String? midyrYr1Trm1Gd,
    dynamic midyrYr2Tr1,
    num? midyrYr2Tr1TchrId,
    String? midyrYr2Tr1TchrNm,
    num? midyrYr2Tr1Gpa,
    String? midyrYr2Tr1Gd,
    num? mockexYr1Tr2,
    num? mockexYr1Tr2TchrId,
    String? mockexYr1Tr2TchrNm,
    String? mockexYr1Tr2Gpa,
    String? mockexYr1Tr2Gd,
    String? mockexYr2Tr2,
    num? mockexYr2Tr2TchrId,
    String? mockexYr2Tr2TchrNm,
    num? mockexYr2Tr2Gpa,
    String? mockexYr2Tr2Gd,
    String? prdMidtrmYr1Trm1,
    dynamic prdMidtrmYr1Trm1TchrId,
    String? prdMidtrmYr1Trm1TchrNm,
    dynamic prdMidtrmYr1Trm1Gpa,
    String? prdMidtrmYr1Trm1Gd,
    String? prdMidtrmYr2Trm1,
    num? prdMidtrmYr2Trm1TchrId,
    String? prdMidtrmYr2Trm1TchrNm,
    num? prdMidtrmYr2Trm1Gpa,
    String? prdMidtrmYr2Trm1Gd,
    String? presentPercentageYr1Trm1,
    String? presentPercentageYr1Tr2,
    String? presentPercentageYr2Tr1,
    String? presentPercentageYr2Tr2,
    String? avgYr1Trm1Cgpa,
    String? avgYr1Trm2Cgpa,
    String? avgYr2Trm1Cgpa,
    String? avgYr2Trm2Cgpa,
    String? avgYr1Cgpa,
    String? avgYr2Cgpa,
    String? yr1Yr2Cgpa,
    num? subjectId,
  }) =>
      ReportsModelNew(
        systemId: systemId ?? this.systemId,
        subjectName: subjectName ?? this.subjectName,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        sectionId: sectionId ?? this.sectionId,
        stdName: stdName ?? this.stdName,
        midtrmYr1Trm1: midtrmYr1Trm1 ?? this.midtrmYr1Trm1,
        midtrmYr1Trm1TchrId: midtrmYr1Trm1TchrId ?? this.midtrmYr1Trm1TchrId,
        midtrmYr1Trm1TchrNm: midtrmYr1Trm1TchrNm ?? this.midtrmYr1Trm1TchrNm,
        midtrmYr1Trm1Gpa: midtrmYr1Trm1Gpa ?? this.midtrmYr1Trm1Gpa,
        midtrmYr1Trm1Gd: midtrmYr1Trm1Gd ?? this.midtrmYr1Trm1Gd,
        midtrmYr1Trm2: midtrmYr1Trm2 ?? this.midtrmYr1Trm2,
        midtrmYr1Trm2TchrId: midtrmYr1Trm2TchrId ?? this.midtrmYr1Trm2TchrId,
        midtrmYr1Trm2TchrNm: midtrmYr1Trm2TchrNm ?? this.midtrmYr1Trm2TchrNm,
        midtrmYr1Trm2Gpa: midtrmYr1Trm2Gpa ?? this.midtrmYr1Trm2Gpa,
        midtrmYr1Trm2Gd: midtrmYr1Trm2Gd ?? this.midtrmYr1Trm2Gd,
        midtrmYr2Trm1: midtrmYr2Trm1 ?? this.midtrmYr2Trm1,
        midtrmYr2Trm1TchrId: midtrmYr2Trm1TchrId ?? this.midtrmYr2Trm1TchrId,
        midtrmYr2Trm1TchrNm: midtrmYr2Trm1TchrNm ?? this.midtrmYr2Trm1TchrNm,
        midtrmYr2Trm1Gpa: midtrmYr2Trm1Gpa ?? this.midtrmYr2Trm1Gpa,
        midtrmYr2Trm1Gd: midtrmYr2Trm1Gd ?? this.midtrmYr2Trm1Gd,
        midtrmYr2Trm2: midtrmYr2Trm2 ?? this.midtrmYr2Trm2,
        midtrmYr2Trm2TchrId: midtrmYr2Trm2TchrId ?? this.midtrmYr2Trm2TchrId,
        midtrmYr2Trm2TchrNm: midtrmYr2Trm2TchrNm ?? this.midtrmYr2Trm2TchrNm,
        midtrmYr2Trm2Gpa: midtrmYr2Trm2Gpa ?? this.midtrmYr2Trm2Gpa,
        midtrmYr2Trm2Gd: midtrmYr2Trm2Gd ?? this.midtrmYr2Trm2Gd,
        midyrYr1Trm1: midyrYr1Trm1 ?? this.midyrYr1Trm1,
        midyrYr1Trm1TchrId: midyrYr1Trm1TchrId ?? this.midyrYr1Trm1TchrId,
        midyrYr1Trm1TchrNm: midyrYr1Trm1TchrNm ?? this.midyrYr1Trm1TchrNm,
        midyrYr1Trm1Gpa: midyrYr1Trm1Gpa ?? this.midyrYr1Trm1Gpa,
        midyrYr1Trm1Gd: midyrYr1Trm1Gd ?? this.midyrYr1Trm1Gd,
        midyrYr2Tr1: midyrYr2Tr1 ?? this.midyrYr2Tr1,
        midyrYr2Tr1TchrId: midyrYr2Tr1TchrId ?? this.midyrYr2Tr1TchrId,
        midyrYr2Tr1TchrNm: midyrYr2Tr1TchrNm ?? this.midyrYr2Tr1TchrNm,
        midyrYr2Tr1Gpa: midyrYr2Tr1Gpa ?? this.midyrYr2Tr1Gpa,
        midyrYr2Tr1Gd: midyrYr2Tr1Gd ?? this.midyrYr2Tr1Gd,
        mockexYr1Tr2: mockexYr1Tr2 ?? this.mockexYr1Tr2,
        mockexYr1Tr2TchrId: mockexYr1Tr2TchrId ?? this.mockexYr1Tr2TchrId,
        mockexYr1Tr2TchrNm: mockexYr1Tr2TchrNm ?? this.mockexYr1Tr2TchrNm,
        mockexYr1Tr2Gpa: mockexYr1Tr2Gpa ?? this.mockexYr1Tr2Gpa,
        mockexYr1Tr2Gd: mockexYr1Tr2Gd ?? this.mockexYr1Tr2Gd,
        mockexYr2Tr2: mockexYr2Tr2 ?? this.mockexYr2Tr2,
        mockexYr2Tr2TchrId: mockexYr2Tr2TchrId ?? this.mockexYr2Tr2TchrId,
        mockexYr2Tr2TchrNm: mockexYr2Tr2TchrNm ?? this.mockexYr2Tr2TchrNm,
        mockexYr2Tr2Gpa: mockexYr2Tr2Gpa ?? this.mockexYr2Tr2Gpa,
        mockexYr2Tr2Gd: mockexYr2Tr2Gd ?? this.mockexYr2Tr2Gd,
        prdMidtrmYr1Trm1: prdMidtrmYr1Trm1 ?? this.prdMidtrmYr1Trm1,
        prdMidtrmYr1Trm1TchrId:
            prdMidtrmYr1Trm1TchrId ?? this.prdMidtrmYr1Trm1TchrId,
        prdMidtrmYr1Trm1TchrNm:
            prdMidtrmYr1Trm1TchrNm ?? this.prdMidtrmYr1Trm1TchrNm,
        prdMidtrmYr1Trm1Gpa: prdMidtrmYr1Trm1Gpa ?? this.prdMidtrmYr1Trm1Gpa,
        prdMidtrmYr1Trm1Gd: prdMidtrmYr1Trm1Gd ?? this.prdMidtrmYr1Trm1Gd,
        prdMidtrmYr2Trm1: prdMidtrmYr2Trm1 ?? this.prdMidtrmYr2Trm1,
        prdMidtrmYr2Trm1TchrId:
            prdMidtrmYr2Trm1TchrId ?? this.prdMidtrmYr2Trm1TchrId,
        prdMidtrmYr2Trm1TchrNm:
            prdMidtrmYr2Trm1TchrNm ?? this.prdMidtrmYr2Trm1TchrNm,
        prdMidtrmYr2Trm1Gpa: prdMidtrmYr2Trm1Gpa ?? this.prdMidtrmYr2Trm1Gpa,
        prdMidtrmYr2Trm1Gd: prdMidtrmYr2Trm1Gd ?? this.prdMidtrmYr2Trm1Gd,
        presentPercentageYr1Trm1:
            presentPercentageYr1Trm1 ?? this.presentPercentageYr1Trm1,
        presentPercentageYr1Tr2:
            presentPercentageYr1Tr2 ?? this.presentPercentageYr1Tr2,
        presentPercentageYr2Tr1:
            presentPercentageYr2Tr1 ?? this.presentPercentageYr2Tr1,
        presentPercentageYr2Tr2:
            presentPercentageYr2Tr2 ?? this.presentPercentageYr2Tr2,
        avgYr1Trm1Cgpa: avgYr1Trm1Cgpa ?? this.avgYr1Trm1Cgpa,
        avgYr1Trm2Cgpa: avgYr1Trm2Cgpa ?? this.avgYr1Trm2Cgpa,
        avgYr2Trm1Cgpa: avgYr2Trm1Cgpa ?? this.avgYr2Trm1Cgpa,
        avgYr2Trm2Cgpa: avgYr2Trm2Cgpa ?? this.avgYr2Trm2Cgpa,
        avgYr1Cgpa: avgYr1Cgpa ?? this.avgYr1Cgpa,
        avgYr2Cgpa: avgYr2Cgpa ?? this.avgYr2Cgpa,
        yr1Yr2Cgpa: yr1Yr2Cgpa ?? this.yr1Yr2Cgpa,
        subjectId: subjectId ?? this.subjectId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['system_id'] = systemId;
    map['subject_name'] = subjectName;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['branch_id'] = branchId;
    map['section_id'] = sectionId;
    map['std_name'] = stdName;
    map['midtrm_yr1_trm1'] = midtrmYr1Trm1;
    map['midtrm_yr1_trm1_tchr_id'] = midtrmYr1Trm1TchrId;
    map['midtrm_yr1_trm1_tchr_nm'] = midtrmYr1Trm1TchrNm;
    map['midtrm_yr1_trm1_gpa'] = midtrmYr1Trm1Gpa;
    map['midtrm_yr1_trm1_gd'] = midtrmYr1Trm1Gd;
    map['midtrm_yr1_trm2'] = midtrmYr1Trm2;
    map['midtrm_yr1_trm2_tchr_id'] = midtrmYr1Trm2TchrId;
    map['midtrm_yr1_trm2_tchr_nm'] = midtrmYr1Trm2TchrNm;
    map['midtrm_yr1_trm2_gpa'] = midtrmYr1Trm2Gpa;
    map['midtrm_yr1_trm2_gd'] = midtrmYr1Trm2Gd;
    map['midtrm_yr2_trm1'] = midtrmYr2Trm1;
    map['midtrm_yr2_trm1_tchr_id'] = midtrmYr2Trm1TchrId;
    map['midtrm_yr2_trm1_tchr_nm'] = midtrmYr2Trm1TchrNm;
    map['midtrm_yr2_trm1_gpa'] = midtrmYr2Trm1Gpa;
    map['midtrm_yr2_trm1_gd'] = midtrmYr2Trm1Gd;
    map['midtrm_yr2_trm2'] = midtrmYr2Trm2;
    map['midtrm_yr2_trm2_tchr_id'] = midtrmYr2Trm2TchrId;
    map['midtrm_yr2_trm2_tchr_nm'] = midtrmYr2Trm2TchrNm;
    map['midtrm_yr2_trm2_gpa'] = midtrmYr2Trm2Gpa;
    map['midtrm_yr2_trm2_gd'] = midtrmYr2Trm2Gd;
    map['midyr_yr1_trm1'] = midyrYr1Trm1;
    map['midyr_yr1_trm1_tchr_id'] = midyrYr1Trm1TchrId;
    map['midyr_yr1_trm1_tchr_nm'] = midyrYr1Trm1TchrNm;
    map['midyr_yr1_trm1_gpa'] = midyrYr1Trm1Gpa;
    map['midyr_yr1_trm1_gd'] = midyrYr1Trm1Gd;
    map['midyr_yr2_tr1'] = midyrYr2Tr1;
    map['midyr_yr2_tr1_tchr_id'] = midyrYr2Tr1TchrId;
    map['midyr_yr2_tr1_tchr_nm'] = midyrYr2Tr1TchrNm;
    map['midyr_yr2_tr1_gpa'] = midyrYr2Tr1Gpa;
    map['midyr_yr2_tr1_gd'] = midyrYr2Tr1Gd;
    map['mockex_yr1_tr2'] = mockexYr1Tr2;
    map['mockex_yr1_tr2_tchr_id'] = mockexYr1Tr2TchrId;
    map['mockex_yr1_tr2_tchr_nm'] = mockexYr1Tr2TchrNm;
    map['mockex_yr1_tr2_gpa'] = mockexYr1Tr2Gpa;
    map['mockex_yr1_tr2_gd'] = mockexYr1Tr2Gd;
    map['mockex_yr2_tr2'] = mockexYr2Tr2;
    map['mockex_yr2_tr2_tchr_id'] = mockexYr2Tr2TchrId;
    map['mockex_yr2_tr2_tchr_nm'] = mockexYr2Tr2TchrNm;
    map['mockex_yr2_tr2_gpa'] = mockexYr2Tr2Gpa;
    map['mockex_yr2_tr2_gd'] = mockexYr2Tr2Gd;
    map['prd_midtrm_yr1_trm1'] = prdMidtrmYr1Trm1;
    map['prd_midtrm_yr1_trm1_tchr_id'] = prdMidtrmYr1Trm1TchrId;
    map['prd_midtrm_yr1_trm1_tchr_nm'] = prdMidtrmYr1Trm1TchrNm;
    map['prd_midtrm_yr1_trm1_gpa'] = prdMidtrmYr1Trm1Gpa;
    map['prd_midtrm_yr1_trm1_gd'] = prdMidtrmYr1Trm1Gd;
    map['prd_midtrm_yr2_trm1'] = prdMidtrmYr2Trm1;
    map['prd_midtrm_yr2_trm1_tchr_id'] = prdMidtrmYr2Trm1TchrId;
    map['prd_midtrm_yr2_trm1_tchr_nm'] = prdMidtrmYr2Trm1TchrNm;
    map['prd_midtrm_yr2_trm1_gpa'] = prdMidtrmYr2Trm1Gpa;
    map['prd_midtrm_yr2_trm1_gd'] = prdMidtrmYr2Trm1Gd;
    map['present_percentage_yr1_trm1'] = presentPercentageYr1Trm1;
    map['present_percentage_yr1_tr2'] = presentPercentageYr1Tr2;
    map['present_percentage_yr2_tr1'] = presentPercentageYr2Tr1;
    map['present_percentage_yr2_tr2'] = presentPercentageYr2Tr2;
    map['avg_yr1_trm1_cgpa'] = avgYr1Trm1Cgpa;
    map['avg_yr1_trm2_cgpa'] = avgYr1Trm2Cgpa;
    map['avg_yr2_trm1_cgpa'] = avgYr2Trm1Cgpa;
    map['avg_yr2_trm2_cgpa'] = avgYr2Trm2Cgpa;
    map['avg_yr1_cgpa'] = avgYr1Cgpa;
    map['avg_yr2_cgpa'] = avgYr2Cgpa;
    map['yr1_yr2_cgpa'] = yr1Yr2Cgpa;
    map['subject_id'] = subjectId;
    return map;
  }
}
