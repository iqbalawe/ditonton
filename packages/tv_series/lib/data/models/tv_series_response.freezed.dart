// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TVSeriesResponse {

 List<TVSeriesModel> get results;
/// Create a copy of TVSeriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TVSeriesResponseCopyWith<TVSeriesResponse> get copyWith => _$TVSeriesResponseCopyWithImpl<TVSeriesResponse>(this as TVSeriesResponse, _$identity);

  /// Serializes this TVSeriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TVSeriesResponse&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'TVSeriesResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class $TVSeriesResponseCopyWith<$Res>  {
  factory $TVSeriesResponseCopyWith(TVSeriesResponse value, $Res Function(TVSeriesResponse) _then) = _$TVSeriesResponseCopyWithImpl;
@useResult
$Res call({
 List<TVSeriesModel> results
});




}
/// @nodoc
class _$TVSeriesResponseCopyWithImpl<$Res>
    implements $TVSeriesResponseCopyWith<$Res> {
  _$TVSeriesResponseCopyWithImpl(this._self, this._then);

  final TVSeriesResponse _self;
  final $Res Function(TVSeriesResponse) _then;

/// Create a copy of TVSeriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<TVSeriesModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TVSeriesResponse].
extension TVSeriesResponsePatterns on TVSeriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TVSeriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TVSeriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TVSeriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _TVSeriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TVSeriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TVSeriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TVSeriesModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TVSeriesResponse() when $default != null:
return $default(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TVSeriesModel> results)  $default,) {final _that = this;
switch (_that) {
case _TVSeriesResponse():
return $default(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TVSeriesModel> results)?  $default,) {final _that = this;
switch (_that) {
case _TVSeriesResponse() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TVSeriesResponse implements TVSeriesResponse {
  const _TVSeriesResponse({required final  List<TVSeriesModel> results}): _results = results;
  factory _TVSeriesResponse.fromJson(Map<String, dynamic> json) => _$TVSeriesResponseFromJson(json);

 final  List<TVSeriesModel> _results;
@override List<TVSeriesModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of TVSeriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TVSeriesResponseCopyWith<_TVSeriesResponse> get copyWith => __$TVSeriesResponseCopyWithImpl<_TVSeriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TVSeriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TVSeriesResponse&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'TVSeriesResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class _$TVSeriesResponseCopyWith<$Res> implements $TVSeriesResponseCopyWith<$Res> {
  factory _$TVSeriesResponseCopyWith(_TVSeriesResponse value, $Res Function(_TVSeriesResponse) _then) = __$TVSeriesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TVSeriesModel> results
});




}
/// @nodoc
class __$TVSeriesResponseCopyWithImpl<$Res>
    implements _$TVSeriesResponseCopyWith<$Res> {
  __$TVSeriesResponseCopyWithImpl(this._self, this._then);

  final _TVSeriesResponse _self;
  final $Res Function(_TVSeriesResponse) _then;

/// Create a copy of TVSeriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_TVSeriesResponse(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<TVSeriesModel>,
  ));
}


}

// dart format on
