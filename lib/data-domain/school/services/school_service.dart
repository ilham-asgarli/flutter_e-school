import 'package:emekteb/core/init/network/IResponseModel.dart';
import 'package:emekteb/data-domain/school/modules/class_yearly_result_controller.dart';
import 'package:emekteb/data-domain/school/modules/student_controller.dart';
import 'package:emekteb/data-domain/school/modules/timetable_controller.dart';
import 'package:emekteb/data-domain/school/modules/week_yearly_controller.dart';
import 'package:emekteb/data-domain/school/modules/year_controller.dart';
import 'package:emekteb/data-domain/school/modules/yearly_controller.dart';

import '../../../core/init/network/core_http.dart';
import '../../../utils/app/constants/api/api_url_constants.dart';
import '../../../utils/app/constants/enums/http_request_enum.dart';
import '../modules/class_yearly_controller.dart';
import '../modules/scheduler_controller.dart';
import 'ISchoolService.dart';

class SchoolService extends ISchoolService {
  @override
  Future<IResponseModel<YearlyController>> fetchYearList(accessToken) async {
    IResponseModel<YearlyController> response = await CoreHttp.instance.send(
      ApiUrlConstants.yearly,
      type: HttpTypes.GET,
      parseModel: YearlyController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<ClassYearlyController>> fetchClassList(
    String? accessToken,
    String? yearId,
  ) async {
    String url = ApiUrlConstants.classYearly(yearId: yearId);

    IResponseModel<ClassYearlyController> response =
        await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: ClassYearlyController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<ClassYearlyController>> fetchClassListForParent(
    String? accessToken,
    String? yearId,
    String? studentId,
  ) async {
    String url = ApiUrlConstants.classYearlyForParent(
      yearId: yearId,
      studentId: studentId,
    );

    IResponseModel<ClassYearlyController> response =
        await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: ClassYearlyController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<ClassYearlyResultController>> fetchClassForParent(
    String? accessToken,
    String? classId,
  ) async {
    String url = ApiUrlConstants.classYearlyResultForParent(classId: classId);

    IResponseModel<ClassYearlyResultController> response =
        await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: ClassYearlyResultController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<WeekYearlyController>> fetchWeekList(
    String? accessToken,
    String? yearId,
  ) async {
    String url = ApiUrlConstants.weekYearly(yearId: yearId);

    IResponseModel<WeekYearlyController> response =
        await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: WeekYearlyController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<SchedulerController>> fetchScheduler(
    String? accessToken,
    String? classYearId,
    String? weekId,
  ) async {
    String url =
        ApiUrlConstants.scheduler(classYearId: classYearId, weekId: weekId);

    IResponseModel<SchedulerController> response = await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: SchedulerController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<YearController>> fetchYearByYearId(
    String? accessToken,
    String? yearId,
  ) async {
    String url = ApiUrlConstants.yearlyById(yearId: yearId);

    IResponseModel<YearController> response = await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: YearController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<TimetableController>> fetchTimetable(
    String? accessToken,
    String? customerId,
    String? yearId,
    int? monthId,
  ) async {
    String url = ApiUrlConstants.timetable(
      customerId: customerId,
      yearId: yearId,
      monthId: monthId,
    );

    IResponseModel<TimetableController> response = await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: TimetableController(),
      accessToken: accessToken,
    );

    return response;
  }

  @override
  Future<IResponseModel<StudentController>> fetchStudents(
    String? accessToken,
  ) async {
    String url = ApiUrlConstants.student;

    IResponseModel<StudentController> response = await CoreHttp.instance.send(
      url,
      type: HttpTypes.GET,
      parseModel: StudentController(),
      accessToken: accessToken,
    );

    return response;
  }
}
