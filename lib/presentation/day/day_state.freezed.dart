// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayState {

 DateTime get date;
/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayStateCopyWith<DayState> get copyWith => _$DayStateCopyWithImpl<DayState>(this as DayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayState&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'DayState(date: $date)';
}


}

/// @nodoc
abstract mixin class $DayStateCopyWith<$Res>  {
  factory $DayStateCopyWith(DayState value, $Res Function(DayState) _then) = _$DayStateCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$DayStateCopyWithImpl<$Res>
    implements $DayStateCopyWith<$Res> {
  _$DayStateCopyWithImpl(this._self, this._then);

  final DayState _self;
  final $Res Function(DayState) _then;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DayState].
extension DayStatePatterns on DayState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DayLoading value)?  loading,TResult Function( DaySuccess value)?  success,TResult Function( DayFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DayLoading() when loading != null:
return loading(_that);case DaySuccess() when success != null:
return success(_that);case DayFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DayLoading value)  loading,required TResult Function( DaySuccess value)  success,required TResult Function( DayFailure value)  failure,}){
final _that = this;
switch (_that) {
case DayLoading():
return loading(_that);case DaySuccess():
return success(_that);case DayFailure():
return failure(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DayLoading value)?  loading,TResult? Function( DaySuccess value)?  success,TResult? Function( DayFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DayLoading() when loading != null:
return loading(_that);case DaySuccess() when success != null:
return success(_that);case DayFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date)?  loading,TResult Function( DateTime date,  DayReport report)?  success,TResult Function( DateTime date,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DayLoading() when loading != null:
return loading(_that.date);case DaySuccess() when success != null:
return success(_that.date,_that.report);case DayFailure() when failure != null:
return failure(_that.date,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date)  loading,required TResult Function( DateTime date,  DayReport report)  success,required TResult Function( DateTime date,  String message)  failure,}) {final _that = this;
switch (_that) {
case DayLoading():
return loading(_that.date);case DaySuccess():
return success(_that.date,_that.report);case DayFailure():
return failure(_that.date,_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date)?  loading,TResult? Function( DateTime date,  DayReport report)?  success,TResult? Function( DateTime date,  String message)?  failure,}) {final _that = this;
switch (_that) {
case DayLoading() when loading != null:
return loading(_that.date);case DaySuccess() when success != null:
return success(_that.date,_that.report);case DayFailure() when failure != null:
return failure(_that.date,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DayLoading implements DayState {
  const DayLoading({required this.date});
  

@override final  DateTime date;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayLoadingCopyWith<DayLoading> get copyWith => _$DayLoadingCopyWithImpl<DayLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayLoading&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'DayState.loading(date: $date)';
}


}

/// @nodoc
abstract mixin class $DayLoadingCopyWith<$Res> implements $DayStateCopyWith<$Res> {
  factory $DayLoadingCopyWith(DayLoading value, $Res Function(DayLoading) _then) = _$DayLoadingCopyWithImpl;
@override @useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$DayLoadingCopyWithImpl<$Res>
    implements $DayLoadingCopyWith<$Res> {
  _$DayLoadingCopyWithImpl(this._self, this._then);

  final DayLoading _self;
  final $Res Function(DayLoading) _then;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(DayLoading(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class DaySuccess implements DayState {
  const DaySuccess({required this.date, required this.report});
  

@override final  DateTime date;
 final  DayReport report;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaySuccessCopyWith<DaySuccess> get copyWith => _$DaySuccessCopyWithImpl<DaySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaySuccess&&(identical(other.date, date) || other.date == date)&&(identical(other.report, report) || other.report == report));
}


@override
int get hashCode => Object.hash(runtimeType,date,report);

@override
String toString() {
  return 'DayState.success(date: $date, report: $report)';
}


}

/// @nodoc
abstract mixin class $DaySuccessCopyWith<$Res> implements $DayStateCopyWith<$Res> {
  factory $DaySuccessCopyWith(DaySuccess value, $Res Function(DaySuccess) _then) = _$DaySuccessCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, DayReport report
});


$DayReportCopyWith<$Res> get report;

}
/// @nodoc
class _$DaySuccessCopyWithImpl<$Res>
    implements $DaySuccessCopyWith<$Res> {
  _$DaySuccessCopyWithImpl(this._self, this._then);

  final DaySuccess _self;
  final $Res Function(DaySuccess) _then;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? report = null,}) {
  return _then(DaySuccess(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as DayReport,
  ));
}

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayReportCopyWith<$Res> get report {
  
  return $DayReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}

/// @nodoc


class DayFailure implements DayState {
  const DayFailure({required this.date, required this.message});
  

@override final  DateTime date;
 final  String message;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayFailureCopyWith<DayFailure> get copyWith => _$DayFailureCopyWithImpl<DayFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayFailure&&(identical(other.date, date) || other.date == date)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,date,message);

@override
String toString() {
  return 'DayState.failure(date: $date, message: $message)';
}


}

/// @nodoc
abstract mixin class $DayFailureCopyWith<$Res> implements $DayStateCopyWith<$Res> {
  factory $DayFailureCopyWith(DayFailure value, $Res Function(DayFailure) _then) = _$DayFailureCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String message
});




}
/// @nodoc
class _$DayFailureCopyWithImpl<$Res>
    implements $DayFailureCopyWith<$Res> {
  _$DayFailureCopyWithImpl(this._self, this._then);

  final DayFailure _self;
  final $Res Function(DayFailure) _then;

/// Create a copy of DayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? message = null,}) {
  return _then(DayFailure(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
