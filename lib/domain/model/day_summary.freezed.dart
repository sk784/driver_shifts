// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DaySummary {

 int get tripsCount; int get revenue; int get commission;/// «На руки» = выручка − комиссия.
 int get net; PaymentTotal get cash; PaymentTotal get card;
/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaySummaryCopyWith<DaySummary> get copyWith => _$DaySummaryCopyWithImpl<DaySummary>(this as DaySummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaySummary&&(identical(other.tripsCount, tripsCount) || other.tripsCount == tripsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.net, net) || other.net == net)&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.card, card) || other.card == card));
}


@override
int get hashCode => Object.hash(runtimeType,tripsCount,revenue,commission,net,cash,card);

@override
String toString() {
  return 'DaySummary(tripsCount: $tripsCount, revenue: $revenue, commission: $commission, net: $net, cash: $cash, card: $card)';
}


}

/// @nodoc
abstract mixin class $DaySummaryCopyWith<$Res>  {
  factory $DaySummaryCopyWith(DaySummary value, $Res Function(DaySummary) _then) = _$DaySummaryCopyWithImpl;
@useResult
$Res call({
 int tripsCount, int revenue, int commission, int net, PaymentTotal cash, PaymentTotal card
});


$PaymentTotalCopyWith<$Res> get cash;$PaymentTotalCopyWith<$Res> get card;

}
/// @nodoc
class _$DaySummaryCopyWithImpl<$Res>
    implements $DaySummaryCopyWith<$Res> {
  _$DaySummaryCopyWithImpl(this._self, this._then);

  final DaySummary _self;
  final $Res Function(DaySummary) _then;

/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripsCount = null,Object? revenue = null,Object? commission = null,Object? net = null,Object? cash = null,Object? card = null,}) {
  return _then(_self.copyWith(
tripsCount: null == tripsCount ? _self.tripsCount : tripsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as int,net: null == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as int,cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as PaymentTotal,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentTotal,
  ));
}
/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentTotalCopyWith<$Res> get cash {
  
  return $PaymentTotalCopyWith<$Res>(_self.cash, (value) {
    return _then(_self.copyWith(cash: value));
  });
}/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentTotalCopyWith<$Res> get card {
  
  return $PaymentTotalCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// Adds pattern-matching-related methods to [DaySummary].
extension DaySummaryPatterns on DaySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DaySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DaySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DaySummary value)  $default,){
final _that = this;
switch (_that) {
case _DaySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DaySummary value)?  $default,){
final _that = this;
switch (_that) {
case _DaySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tripsCount,  int revenue,  int commission,  int net,  PaymentTotal cash,  PaymentTotal card)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DaySummary() when $default != null:
return $default(_that.tripsCount,_that.revenue,_that.commission,_that.net,_that.cash,_that.card);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tripsCount,  int revenue,  int commission,  int net,  PaymentTotal cash,  PaymentTotal card)  $default,) {final _that = this;
switch (_that) {
case _DaySummary():
return $default(_that.tripsCount,_that.revenue,_that.commission,_that.net,_that.cash,_that.card);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tripsCount,  int revenue,  int commission,  int net,  PaymentTotal cash,  PaymentTotal card)?  $default,) {final _that = this;
switch (_that) {
case _DaySummary() when $default != null:
return $default(_that.tripsCount,_that.revenue,_that.commission,_that.net,_that.cash,_that.card);case _:
  return null;

}
}

}

/// @nodoc


class _DaySummary implements DaySummary {
  const _DaySummary({required this.tripsCount, required this.revenue, required this.commission, required this.net, required this.cash, required this.card});
  

@override final  int tripsCount;
@override final  int revenue;
@override final  int commission;
/// «На руки» = выручка − комиссия.
@override final  int net;
@override final  PaymentTotal cash;
@override final  PaymentTotal card;

/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaySummaryCopyWith<_DaySummary> get copyWith => __$DaySummaryCopyWithImpl<_DaySummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaySummary&&(identical(other.tripsCount, tripsCount) || other.tripsCount == tripsCount)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.net, net) || other.net == net)&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.card, card) || other.card == card));
}


@override
int get hashCode => Object.hash(runtimeType,tripsCount,revenue,commission,net,cash,card);

@override
String toString() {
  return 'DaySummary(tripsCount: $tripsCount, revenue: $revenue, commission: $commission, net: $net, cash: $cash, card: $card)';
}


}

/// @nodoc
abstract mixin class _$DaySummaryCopyWith<$Res> implements $DaySummaryCopyWith<$Res> {
  factory _$DaySummaryCopyWith(_DaySummary value, $Res Function(_DaySummary) _then) = __$DaySummaryCopyWithImpl;
@override @useResult
$Res call({
 int tripsCount, int revenue, int commission, int net, PaymentTotal cash, PaymentTotal card
});


@override $PaymentTotalCopyWith<$Res> get cash;@override $PaymentTotalCopyWith<$Res> get card;

}
/// @nodoc
class __$DaySummaryCopyWithImpl<$Res>
    implements _$DaySummaryCopyWith<$Res> {
  __$DaySummaryCopyWithImpl(this._self, this._then);

  final _DaySummary _self;
  final $Res Function(_DaySummary) _then;

/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripsCount = null,Object? revenue = null,Object? commission = null,Object? net = null,Object? cash = null,Object? card = null,}) {
  return _then(_DaySummary(
tripsCount: null == tripsCount ? _self.tripsCount : tripsCount // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as int,net: null == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as int,cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as PaymentTotal,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentTotal,
  ));
}

/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentTotalCopyWith<$Res> get cash {
  
  return $PaymentTotalCopyWith<$Res>(_self.cash, (value) {
    return _then(_self.copyWith(cash: value));
  });
}/// Create a copy of DaySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentTotalCopyWith<$Res> get card {
  
  return $PaymentTotalCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}

// dart format on
