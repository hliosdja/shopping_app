import 'package:dio/dio.dart';

abstract class RequestStatus<T> {
  final T? data;
  final DioException? error;

  const RequestStatus({this.data, this.error});
}

class RequestSuccess<T> extends RequestStatus<T> {
  const RequestSuccess(T data) : super(data: data);
}

class RequestFailed<T> extends RequestStatus<T> {
  const RequestFailed(DioException error) : super(error: error);
}