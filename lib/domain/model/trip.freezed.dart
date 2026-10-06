// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Trip {

 String get id; TripTime get start; TripTime get end; int get amount; PaymentMethod get payment; int get commission;
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCopyWith<Trip> get copyWith => _$TripCopyWithImpl<Trip>(this as Trip, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.commission, commission) || other.commission == commission));
}


@override
int get hashCode => Object.hash(runtimeType,id,start,end,amount,payment,commission);

@override
String toString() {
  return 'Trip(id: $id, start: $start, end: $end, amount: $amount, payment: $payment, commission: $commission)';
}


}

/// @nodoc
abstract mixin class $TripCopyWith<$Res>  {
  factory $TripCopyWith(Trip value, $Res Function(Trip) _then) = _$TripCopyWithImpl;
@useResult
$Res call({
 String id, TripTime start, TripTime end, int amount, PaymentMethod payment, int commission
});


$TripTimeCopyWith<$Res> get start;$TripTimeCopyWith<$Res> get end;

}
/// @nodoc
class _$TripCopyWithImpl<$Res>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._self, this._then);

  final Trip _self;
  final $Res Function(Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? start = null,Object? end = null,Object? amount = null,Object? payment = null,Object? commission = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TripTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TripTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripTimeCopyWith<$Res> get start {
  
  return $TripTimeCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripTimeCopyWith<$Res> get end {
  
  return $TripTimeCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}


/// Adds pattern-matching-related methods to [Trip].
extension TripPatterns on Trip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trip value)  $default,){
final _that = this;
switch (_that) {
case _Trip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trip value)?  $default,){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TripTime start,  TripTime end,  int amount,  PaymentMethod payment,  int commission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.amount,_that.payment,_that.commission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TripTime start,  TripTime end,  int amount,  PaymentMethod payment,  int commission)  $default,) {final _that = this;
switch (_that) {
case _Trip():
return $default(_that.id,_that.start,_that.end,_that.amount,_that.payment,_that.commission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TripTime start,  TripTime end,  int amount,  PaymentMethod payment,  int commission)?  $default,) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.amount,_that.payment,_that.commission);case _:
  return null;

}
}

}

/// @nodoc


class _Trip extends Trip {
  const _Trip({required this.id, required this.start, required this.end, required this.amount, required this.payment, required this.commission}): super._();
  

@override final  String id;
@override final  TripTime start;
@override final  TripTime end;
@override final  int amount;
@override final  PaymentMethod payment;
@override final  int commission;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCopyWith<_Trip> get copyWith => __$TripCopyWithImpl<_Trip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.commission, commission) || other.commission == commission));
}


@override
int get hashCode => Object.hash(runtimeType,id,start,end,amount,payment,commission);

@override
String toString() {
  return 'Trip(id: $id, start: $start, end: $end, amount: $amount, payment: $payment, commission: $commission)';
}


}

/// @nodoc
abstract mixin class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) _then) = __$TripCopyWithImpl;
@override @useResult
$Res call({
 String id, TripTime start, TripTime end, int amount, PaymentMethod payment, int commission
});


@override $TripTimeCopyWith<$Res> get start;@override $TripTimeCopyWith<$Res> get end;

}
/// @nodoc
class __$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(this._self, this._then);

  final _Trip _self;
  final $Res Function(_Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? amount = null,Object? payment = null,Object? commission = null,}) {
  return _then(_Trip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TripTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TripTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripTimeCopyWith<$Res> get start {
  
  return $TripTimeCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TripTimeCopyWith<$Res> get end {
  
  return $TripTimeCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}

// dart format on
