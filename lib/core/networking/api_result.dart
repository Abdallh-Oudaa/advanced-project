import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error_handling.dart';

part 'api_result.freezed.dart';



@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T  data) = _Sucesss<T>;

  const factory ApiResult.error(ErrorHandler errorHandler) = _Error<T>;
}
