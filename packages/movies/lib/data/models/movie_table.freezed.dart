// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieTable {

 int get id; String? get title; String? get posterPath; String? get overview;
/// Create a copy of MovieTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieTableCopyWith<MovieTable> get copyWith => _$MovieTableCopyWithImpl<MovieTable>(this as MovieTable, _$identity);

  /// Serializes this MovieTable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieTable&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,posterPath,overview);

@override
String toString() {
  return 'MovieTable(id: $id, title: $title, posterPath: $posterPath, overview: $overview)';
}


}

/// @nodoc
abstract mixin class $MovieTableCopyWith<$Res>  {
  factory $MovieTableCopyWith(MovieTable value, $Res Function(MovieTable) _then) = _$MovieTableCopyWithImpl;
@useResult
$Res call({
 int id, String? title, String? posterPath, String? overview
});




}
/// @nodoc
class _$MovieTableCopyWithImpl<$Res>
    implements $MovieTableCopyWith<$Res> {
  _$MovieTableCopyWithImpl(this._self, this._then);

  final MovieTable _self;
  final $Res Function(MovieTable) _then;

/// Create a copy of MovieTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = freezed,Object? posterPath = freezed,Object? overview = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieTable].
extension MovieTablePatterns on MovieTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieTable value)  $default,){
final _that = this;
switch (_that) {
case _MovieTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieTable value)?  $default,){
final _that = this;
switch (_that) {
case _MovieTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? title,  String? posterPath,  String? overview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieTable() when $default != null:
return $default(_that.id,_that.title,_that.posterPath,_that.overview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? title,  String? posterPath,  String? overview)  $default,) {final _that = this;
switch (_that) {
case _MovieTable():
return $default(_that.id,_that.title,_that.posterPath,_that.overview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? title,  String? posterPath,  String? overview)?  $default,) {final _that = this;
switch (_that) {
case _MovieTable() when $default != null:
return $default(_that.id,_that.title,_that.posterPath,_that.overview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieTable extends MovieTable {
  const _MovieTable({required this.id, this.title, this.posterPath, this.overview}): super._();
  factory _MovieTable.fromJson(Map<String, dynamic> json) => _$MovieTableFromJson(json);

@override final  int id;
@override final  String? title;
@override final  String? posterPath;
@override final  String? overview;

/// Create a copy of MovieTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieTableCopyWith<_MovieTable> get copyWith => __$MovieTableCopyWithImpl<_MovieTable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieTableToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieTable&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,posterPath,overview);

@override
String toString() {
  return 'MovieTable(id: $id, title: $title, posterPath: $posterPath, overview: $overview)';
}


}

/// @nodoc
abstract mixin class _$MovieTableCopyWith<$Res> implements $MovieTableCopyWith<$Res> {
  factory _$MovieTableCopyWith(_MovieTable value, $Res Function(_MovieTable) _then) = __$MovieTableCopyWithImpl;
@override @useResult
$Res call({
 int id, String? title, String? posterPath, String? overview
});




}
/// @nodoc
class __$MovieTableCopyWithImpl<$Res>
    implements _$MovieTableCopyWith<$Res> {
  __$MovieTableCopyWithImpl(this._self, this._then);

  final _MovieTable _self;
  final $Res Function(_MovieTable) _then;

/// Create a copy of MovieTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? posterPath = freezed,Object? overview = freezed,}) {
  return _then(_MovieTable(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
