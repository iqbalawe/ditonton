// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TVSeriesModel {

 bool get adult; String? get backdropPath; List<int> get genreIds; int get id; List<String> get originCountry; String get originalLanguage; String get originalName; String get overview; double get popularity; String? get posterPath; String? get firstAirDate; String get name; double get voteAverage; int get voteCount;
/// Create a copy of TVSeriesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TVSeriesModelCopyWith<TVSeriesModel> get copyWith => _$TVSeriesModelCopyWithImpl<TVSeriesModel>(this as TVSeriesModel, _$identity);

  /// Serializes this TVSeriesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TVSeriesModel&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.originCountry, originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,backdropPath,const DeepCollectionEquality().hash(genreIds),id,const DeepCollectionEquality().hash(originCountry),originalLanguage,originalName,overview,popularity,posterPath,firstAirDate,name,voteAverage,voteCount);

@override
String toString() {
  return 'TVSeriesModel(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, firstAirDate: $firstAirDate, name: $name, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $TVSeriesModelCopyWith<$Res>  {
  factory $TVSeriesModelCopyWith(TVSeriesModel value, $Res Function(TVSeriesModel) _then) = _$TVSeriesModelCopyWithImpl;
@useResult
$Res call({
 bool adult, String? backdropPath, List<int> genreIds, int id, List<String> originCountry, String originalLanguage, String originalName, String overview, double popularity, String? posterPath, String? firstAirDate, String name, double voteAverage, int voteCount
});




}
/// @nodoc
class _$TVSeriesModelCopyWithImpl<$Res>
    implements $TVSeriesModelCopyWith<$Res> {
  _$TVSeriesModelCopyWithImpl(this._self, this._then);

  final TVSeriesModel _self;
  final $Res Function(TVSeriesModel) _then;

/// Create a copy of TVSeriesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? backdropPath = freezed,Object? genreIds = null,Object? id = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalName = null,Object? overview = null,Object? popularity = null,Object? posterPath = freezed,Object? firstAirDate = freezed,Object? name = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,genreIds: null == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TVSeriesModel].
extension TVSeriesModelPatterns on TVSeriesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TVSeriesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TVSeriesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TVSeriesModel value)  $default,){
final _that = this;
switch (_that) {
case _TVSeriesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TVSeriesModel value)?  $default,){
final _that = this;
switch (_that) {
case _TVSeriesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult,  String? backdropPath,  List<int> genreIds,  int id,  List<String> originCountry,  String originalLanguage,  String originalName,  String overview,  double popularity,  String? posterPath,  String? firstAirDate,  String name,  double voteAverage,  int voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TVSeriesModel() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.genreIds,_that.id,_that.originCountry,_that.originalLanguage,_that.originalName,_that.overview,_that.popularity,_that.posterPath,_that.firstAirDate,_that.name,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult,  String? backdropPath,  List<int> genreIds,  int id,  List<String> originCountry,  String originalLanguage,  String originalName,  String overview,  double popularity,  String? posterPath,  String? firstAirDate,  String name,  double voteAverage,  int voteCount)  $default,) {final _that = this;
switch (_that) {
case _TVSeriesModel():
return $default(_that.adult,_that.backdropPath,_that.genreIds,_that.id,_that.originCountry,_that.originalLanguage,_that.originalName,_that.overview,_that.popularity,_that.posterPath,_that.firstAirDate,_that.name,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult,  String? backdropPath,  List<int> genreIds,  int id,  List<String> originCountry,  String originalLanguage,  String originalName,  String overview,  double popularity,  String? posterPath,  String? firstAirDate,  String name,  double voteAverage,  int voteCount)?  $default,) {final _that = this;
switch (_that) {
case _TVSeriesModel() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.genreIds,_that.id,_that.originCountry,_that.originalLanguage,_that.originalName,_that.overview,_that.popularity,_that.posterPath,_that.firstAirDate,_that.name,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TVSeriesModel implements TVSeriesModel {
  const _TVSeriesModel({this.adult = false, this.backdropPath, required final  List<int> genreIds, required this.id, required final  List<String> originCountry, required this.originalLanguage, required this.originalName, required this.overview, required this.popularity, this.posterPath, this.firstAirDate, required this.name, required this.voteAverage, required this.voteCount}): _genreIds = genreIds,_originCountry = originCountry;
  factory _TVSeriesModel.fromJson(Map<String, dynamic> json) => _$TVSeriesModelFromJson(json);

@override@JsonKey() final  bool adult;
@override final  String? backdropPath;
 final  List<int> _genreIds;
@override List<int> get genreIds {
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genreIds);
}

@override final  int id;
 final  List<String> _originCountry;
@override List<String> get originCountry {
  if (_originCountry is EqualUnmodifiableListView) return _originCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originCountry);
}

@override final  String originalLanguage;
@override final  String originalName;
@override final  String overview;
@override final  double popularity;
@override final  String? posterPath;
@override final  String? firstAirDate;
@override final  String name;
@override final  double voteAverage;
@override final  int voteCount;

/// Create a copy of TVSeriesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TVSeriesModelCopyWith<_TVSeriesModel> get copyWith => __$TVSeriesModelCopyWithImpl<_TVSeriesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TVSeriesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TVSeriesModel&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._originCountry, _originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,backdropPath,const DeepCollectionEquality().hash(_genreIds),id,const DeepCollectionEquality().hash(_originCountry),originalLanguage,originalName,overview,popularity,posterPath,firstAirDate,name,voteAverage,voteCount);

@override
String toString() {
  return 'TVSeriesModel(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, firstAirDate: $firstAirDate, name: $name, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$TVSeriesModelCopyWith<$Res> implements $TVSeriesModelCopyWith<$Res> {
  factory _$TVSeriesModelCopyWith(_TVSeriesModel value, $Res Function(_TVSeriesModel) _then) = __$TVSeriesModelCopyWithImpl;
@override @useResult
$Res call({
 bool adult, String? backdropPath, List<int> genreIds, int id, List<String> originCountry, String originalLanguage, String originalName, String overview, double popularity, String? posterPath, String? firstAirDate, String name, double voteAverage, int voteCount
});




}
/// @nodoc
class __$TVSeriesModelCopyWithImpl<$Res>
    implements _$TVSeriesModelCopyWith<$Res> {
  __$TVSeriesModelCopyWithImpl(this._self, this._then);

  final _TVSeriesModel _self;
  final $Res Function(_TVSeriesModel) _then;

/// Create a copy of TVSeriesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? backdropPath = freezed,Object? genreIds = null,Object? id = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalName = null,Object? overview = null,Object? popularity = null,Object? posterPath = freezed,Object? firstAirDate = freezed,Object? name = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_TVSeriesModel(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,genreIds: null == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,originCountry: null == originCountry ? _self._originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
