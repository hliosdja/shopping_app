import '../../config/network/failure.dart';

abstract class RequestStatus<T> {
  final T? data;
  final Failure? error;

  const RequestStatus({this.data, this.error});
}

class RequestSuccess<T> extends RequestStatus<T> {
  const RequestSuccess(T data) : super(data: data);
}

class RequestFailed<T> extends RequestStatus<T> {
  const RequestFailed(Failure error) : super(error: error);
}