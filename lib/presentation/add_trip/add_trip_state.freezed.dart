// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_trip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddTripState {

/// День, в который добавляем поездку (выбранный на главном экране).
 DateTime get date; TimeOfDay? get start; TimeOfDay? get end;/// Окончание после полуночи — ночная поездка.
 bool get isEndNextDay; String get amount; String get commission; PaymentMethod get payment; Map<AddTripField, String> get fieldErrors;/// Ошибка, не относящаяся к конкретному полю (сеть, пересечение).
 String? get message; bool get isSubmitting; bool get isSaved;
/// Create a copy of AddTripState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTripStateCopyWith<AddTripState> get copyWith => _$AddTripStateCopyWithImpl<AddTripState>(this as AddTripState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTripState&&(identical(other.date, date) || other.date == date)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.isEndNextDay, isEndNextDay) || other.isEndNextDay == isEndNextDay)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.message, message) || other.message == message)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,date,start,end,isEndNextDay,amount,commission,payment,const DeepCollectionEquality().hash(fieldErrors),message,isSubmitting,isSaved);

@override
String toString() {
  return 'AddTripState(date: $date, start: $start, end: $end, isEndNextDay: $isEndNextDay, amount: $amount, commission: $commission, payment: $payment, fieldErrors: $fieldErrors, message: $message, isSubmitting: $isSubmitting, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $AddTripStateCopyWith<$Res>  {
  factory $AddTripStateCopyWith(AddTripState value, $Res Function(AddTripState) _then) = _$AddTripStateCopyWithImpl;
@useResult
$Res call({
 DateTime date, TimeOfDay? start, TimeOfDay? end, bool isEndNextDay, String amount, String commission, PaymentMethod payment, Map<AddTripField, String> fieldErrors, String? message, bool isSubmitting, bool isSaved
});




}
/// @nodoc
class _$AddTripStateCopyWithImpl<$Res>
    implements $AddTripStateCopyWith<$Res> {
  _$AddTripStateCopyWithImpl(this._self, this._then);

  final AddTripState _self;
  final $Res Function(AddTripState) _then;

/// Create a copy of AddTripState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? start = freezed,Object? end = freezed,Object? isEndNextDay = null,Object? amount = null,Object? commission = null,Object? payment = null,Object? fieldErrors = null,Object? message = freezed,Object? isSubmitting = null,Object? isSaved = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isEndNextDay: null == isEndNextDay ? _self.isEndNextDay : isEndNextDay // ignore: cast_nullable_to_non_nullable
as bool,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as String,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<AddTripField, String>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddTripState].
extension AddTripStatePatterns on AddTripState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTripState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTripState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTripState value)  $default,){
final _that = this;
switch (_that) {
case _AddTripState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTripState value)?  $default,){
final _that = this;
switch (_that) {
case _AddTripState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  TimeOfDay? start,  TimeOfDay? end,  bool isEndNextDay,  String amount,  String commission,  PaymentMethod payment,  Map<AddTripField, String> fieldErrors,  String? message,  bool isSubmitting,  bool isSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTripState() when $default != null:
return $default(_that.date,_that.start,_that.end,_that.isEndNextDay,_that.amount,_that.commission,_that.payment,_that.fieldErrors,_that.message,_that.isSubmitting,_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  TimeOfDay? start,  TimeOfDay? end,  bool isEndNextDay,  String amount,  String commission,  PaymentMethod payment,  Map<AddTripField, String> fieldErrors,  String? message,  bool isSubmitting,  bool isSaved)  $default,) {final _that = this;
switch (_that) {
case _AddTripState():
return $default(_that.date,_that.start,_that.end,_that.isEndNextDay,_that.amount,_that.commission,_that.payment,_that.fieldErrors,_that.message,_that.isSubmitting,_that.isSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  TimeOfDay? start,  TimeOfDay? end,  bool isEndNextDay,  String amount,  String commission,  PaymentMethod payment,  Map<AddTripField, String> fieldErrors,  String? message,  bool isSubmitting,  bool isSaved)?  $default,) {final _that = this;
switch (_that) {
case _AddTripState() when $default != null:
return $default(_that.date,_that.start,_that.end,_that.isEndNextDay,_that.amount,_that.commission,_that.payment,_that.fieldErrors,_that.message,_that.isSubmitting,_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class _AddTripState implements AddTripState {
  const _AddTripState({required this.date, this.start, this.end, this.isEndNextDay = false, this.amount = '', this.commission = '', this.payment = PaymentMethod.card, final  Map<AddTripField, String> fieldErrors = const {}, this.message, this.isSubmitting = false, this.isSaved = false}): _fieldErrors = fieldErrors;
  

/// День, в который добавляем поездку (выбранный на главном экране).
@override final  DateTime date;
@override final  TimeOfDay? start;
@override final  TimeOfDay? end;
/// Окончание после полуночи — ночная поездка.
@override@JsonKey() final  bool isEndNextDay;
@override@JsonKey() final  String amount;
@override@JsonKey() final  String commission;
@override@JsonKey() final  PaymentMethod payment;
 final  Map<AddTripField, String> _fieldErrors;
@override@JsonKey() Map<AddTripField, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

/// Ошибка, не относящаяся к конкретному полю (сеть, пересечение).
@override final  String? message;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSaved;

/// Create a copy of AddTripState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTripStateCopyWith<_AddTripState> get copyWith => __$AddTripStateCopyWithImpl<_AddTripState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTripState&&(identical(other.date, date) || other.date == date)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.isEndNextDay, isEndNextDay) || other.isEndNextDay == isEndNextDay)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&(identical(other.message, message) || other.message == message)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,date,start,end,isEndNextDay,amount,commission,payment,const DeepCollectionEquality().hash(_fieldErrors),message,isSubmitting,isSaved);

@override
String toString() {
  return 'AddTripState(date: $date, start: $start, end: $end, isEndNextDay: $isEndNextDay, amount: $amount, commission: $commission, payment: $payment, fieldErrors: $fieldErrors, message: $message, isSubmitting: $isSubmitting, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$AddTripStateCopyWith<$Res> implements $AddTripStateCopyWith<$Res> {
  factory _$AddTripStateCopyWith(_AddTripState value, $Res Function(_AddTripState) _then) = __$AddTripStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, TimeOfDay? start, TimeOfDay? end, bool isEndNextDay, String amount, String commission, PaymentMethod payment, Map<AddTripField, String> fieldErrors, String? message, bool isSubmitting, bool isSaved
});




}
/// @nodoc
class __$AddTripStateCopyWithImpl<$Res>
    implements _$AddTripStateCopyWith<$Res> {
  __$AddTripStateCopyWithImpl(this._self, this._then);

  final _AddTripState _self;
  final $Res Function(_AddTripState) _then;

/// Create a copy of AddTripState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? start = freezed,Object? end = freezed,Object? isEndNextDay = null,Object? amount = null,Object? commission = null,Object? payment = null,Object? fieldErrors = null,Object? message = freezed,Object? isSubmitting = null,Object? isSaved = null,}) {
  return _then(_AddTripState(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isEndNextDay: null == isEndNextDay ? _self.isEndNextDay : isEndNextDay // ignore: cast_nullable_to_non_nullable
as bool,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as String,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentMethod,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<AddTripField, String>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
