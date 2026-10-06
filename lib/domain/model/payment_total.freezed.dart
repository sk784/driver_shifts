// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_total.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentTotal {

 int get count; int get revenue;
/// Create a copy of PaymentTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentTotalCopyWith<PaymentTotal> get copyWith => _$PaymentTotalCopyWithImpl<PaymentTotal>(this as PaymentTotal, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentTotal&&(identical(other.count, count) || other.count == count)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}


@override
int get hashCode => Object.hash(runtimeType,count,revenue);

@override
String toString() {
  return 'PaymentTotal(count: $count, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class $PaymentTotalCopyWith<$Res>  {
  factory $PaymentTotalCopyWith(PaymentTotal value, $Res Function(PaymentTotal) _then) = _$PaymentTotalCopyWithImpl;
@useResult
$Res call({
 int count, int revenue
});




}
/// @nodoc
class _$PaymentTotalCopyWithImpl<$Res>
    implements $PaymentTotalCopyWith<$Res> {
  _$PaymentTotalCopyWithImpl(this._self, this._then);

  final PaymentTotal _self;
  final $Res Function(PaymentTotal) _then;

/// Create a copy of PaymentTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? revenue = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentTotal].
extension PaymentTotalPatterns on PaymentTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentTotal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentTotal value)  $default,){
final _that = this;
switch (_that) {
case _PaymentTotal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentTotal value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentTotal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int revenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentTotal() when $default != null:
return $default(_that.count,_that.revenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int revenue)  $default,) {final _that = this;
switch (_that) {
case _PaymentTotal():
return $default(_that.count,_that.revenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int revenue)?  $default,) {final _that = this;
switch (_that) {
case _PaymentTotal() when $default != null:
return $default(_that.count,_that.revenue);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentTotal implements PaymentTotal {
  const _PaymentTotal({required this.count, required this.revenue});
  

@override final  int count;
@override final  int revenue;

/// Create a copy of PaymentTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentTotalCopyWith<_PaymentTotal> get copyWith => __$PaymentTotalCopyWithImpl<_PaymentTotal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentTotal&&(identical(other.count, count) || other.count == count)&&(identical(other.revenue, revenue) || other.revenue == revenue));
}


@override
int get hashCode => Object.hash(runtimeType,count,revenue);

@override
String toString() {
  return 'PaymentTotal(count: $count, revenue: $revenue)';
}


}

/// @nodoc
abstract mixin class _$PaymentTotalCopyWith<$Res> implements $PaymentTotalCopyWith<$Res> {
  factory _$PaymentTotalCopyWith(_PaymentTotal value, $Res Function(_PaymentTotal) _then) = __$PaymentTotalCopyWithImpl;
@override @useResult
$Res call({
 int count, int revenue
});




}
/// @nodoc
class __$PaymentTotalCopyWithImpl<$Res>
    implements _$PaymentTotalCopyWith<$Res> {
  __$PaymentTotalCopyWithImpl(this._self, this._then);

  final _PaymentTotal _self;
  final $Res Function(_PaymentTotal) _then;

/// Create a copy of PaymentTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? revenue = null,}) {
  return _then(_PaymentTotal(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
