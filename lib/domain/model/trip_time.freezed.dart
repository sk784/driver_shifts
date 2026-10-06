// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripTime {

/// Абсолютный момент, UTC.
 DateTime get instant; Duration get offset;
/// Create a copy of TripTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripTimeCopyWith<TripTime> get copyWith => _$TripTimeCopyWithImpl<TripTime>(this as TripTime, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripTime&&(identical(other.instant, instant) || other.instant == instant)&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,instant,offset);

@override
String toString() {
  return 'TripTime(instant: $instant, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $TripTimeCopyWith<$Res>  {
  factory $TripTimeCopyWith(TripTime value, $Res Function(TripTime) _then) = _$TripTimeCopyWithImpl;
@useResult
$Res call({
 DateTime instant, Duration offset
});




}
/// @nodoc
class _$TripTimeCopyWithImpl<$Res>
    implements $TripTimeCopyWith<$Res> {
  _$TripTimeCopyWithImpl(this._self, this._then);

  final TripTime _self;
  final $Res Function(TripTime) _then;

/// Create a copy of TripTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? instant = null,Object? offset = null,}) {
  return _then(_self.copyWith(
instant: null == instant ? _self.instant : instant // ignore: cast_nullable_to_non_nullable
as DateTime,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [TripTime].
extension TripTimePatterns on TripTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripTime() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripTime value)  $default,){
final _that = this;
switch (_that) {
case _TripTime():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripTime value)?  $default,){
final _that = this;
switch (_that) {
case _TripTime() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime instant,  Duration offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripTime() when $default != null:
return $default(_that.instant,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime instant,  Duration offset)  $default,) {final _that = this;
switch (_that) {
case _TripTime():
return $default(_that.instant,_that.offset);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime instant,  Duration offset)?  $default,) {final _that = this;
switch (_that) {
case _TripTime() when $default != null:
return $default(_that.instant,_that.offset);case _:
  return null;

}
}

}

/// @nodoc


class _TripTime extends TripTime {
  const _TripTime({required this.instant, required this.offset}): super._();
  

/// Абсолютный момент, UTC.
@override final  DateTime instant;
@override final  Duration offset;

/// Create a copy of TripTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripTimeCopyWith<_TripTime> get copyWith => __$TripTimeCopyWithImpl<_TripTime>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripTime&&(identical(other.instant, instant) || other.instant == instant)&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,instant,offset);

@override
String toString() {
  return 'TripTime(instant: $instant, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$TripTimeCopyWith<$Res> implements $TripTimeCopyWith<$Res> {
  factory _$TripTimeCopyWith(_TripTime value, $Res Function(_TripTime) _then) = __$TripTimeCopyWithImpl;
@override @useResult
$Res call({
 DateTime instant, Duration offset
});




}
/// @nodoc
class __$TripTimeCopyWithImpl<$Res>
    implements _$TripTimeCopyWith<$Res> {
  __$TripTimeCopyWithImpl(this._self, this._then);

  final _TripTime _self;
  final $Res Function(_TripTime) _then;

/// Create a copy of TripTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instant = null,Object? offset = null,}) {
  return _then(_TripTime(
instant: null == instant ? _self.instant : instant // ignore: cast_nullable_to_non_nullable
as DateTime,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
