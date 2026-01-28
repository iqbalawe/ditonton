// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TVSeriesTable {

 int get id; String? get name; String? get posterPath; String? get overview;
/// Create a copy of TVSeriesTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TVSeriesTableCopyWith<TVSeriesTable> get copyWith => _$TVSeriesTableCopyWithImpl<TVSeriesTable>(this as TVSeriesTable, _$identity);

  /// Serializes this TVSeriesTable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TVSeriesTable&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,posterPath,overview);

@override
String toString() {
  return 'TVSeriesTable(id: $id, name: $name, posterPath: $posterPath, overview: $overview)';
}


}

/// @nodoc
abstract mixin class $TVSeriesTableCopyWith<$Res>  {
  factory $TVSeriesTableCopyWith(TVSeriesTable value, $Res Function(TVSeriesTable) _then) = _$TVSeriesTableCopyWithImpl;
@useResult
$Res call({
 int id, String? name, String? posterPath, String? overview
});




}
/// @nodoc
class _$TVSeriesTableCopyWithImpl<$Res>
    implements $TVSeriesTableCopyWith<$Res> {
  _$TVSeriesTableCopyWithImpl(this._self, this._then);

  final TVSeriesTable _self;
  final $Res Function(TVSeriesTable) _then;

/// Create a copy of TVSeriesTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? posterPath = freezed,Object? overview = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TVSeriesTable].
extension TVSeriesTablePatterns on TVSeriesTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TVSeriesTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TVSeriesTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TVSeriesTable value)  $default,){
final _that = this;
switch (_that) {
case _TVSeriesTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TVSeriesTable value)?  $default,){
final _that = this;
switch (_that) {
case _TVSeriesTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? name,  String? posterPath,  String? overview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TVSeriesTable() when $default != null:
return $default(_that.id,_that.name,_that.posterPath,_that.overview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? name,  String? posterPath,  String? overview)  $default,) {final _that = this;
switch (_that) {
case _TVSeriesTable():
return $default(_that.id,_that.name,_that.posterPath,_that.overview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? name,  String? posterPath,  String? overview)?  $default,) {final _that = this;
switch (_that) {
case _TVSeriesTable() when $default != null:
return $default(_that.id,_that.name,_that.posterPath,_that.overview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TVSeriesTable extends TVSeriesTable {
  const _TVSeriesTable({required this.id, this.name, this.posterPath, this.overview}): super._();
  factory _TVSeriesTable.fromJson(Map<String, dynamic> json) => _$TVSeriesTableFromJson(json);

@override final  int id;
@override final  String? name;
@override final  String? posterPath;
@override final  String? overview;

/// Create a copy of TVSeriesTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TVSeriesTableCopyWith<_TVSeriesTable> get copyWith => __$TVSeriesTableCopyWithImpl<_TVSeriesTable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TVSeriesTableToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TVSeriesTable&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,posterPath,overview);

@override
String toString() {
  return 'TVSeriesTable(id: $id, name: $name, posterPath: $posterPath, overview: $overview)';
}


}

/// @nodoc
abstract mixin class _$TVSeriesTableCopyWith<$Res> implements $TVSeriesTableCopyWith<$Res> {
  factory _$TVSeriesTableCopyWith(_TVSeriesTable value, $Res Function(_TVSeriesTable) _then) = __$TVSeriesTableCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name, String? posterPath, String? overview
});




}
/// @nodoc
class __$TVSeriesTableCopyWithImpl<$Res>
    implements _$TVSeriesTableCopyWith<$Res> {
  __$TVSeriesTableCopyWithImpl(this._self, this._then);

  final _TVSeriesTable _self;
  final $Res Function(_TVSeriesTable) _then;

/// Create a copy of TVSeriesTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? posterPath = freezed,Object? overview = freezed,}) {
  return _then(_TVSeriesTable(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
