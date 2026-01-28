// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailResponse {

 bool get adult; String get backdropPath; int get budget; List<GenreModel> get genres; String get homepage; int get id; String get imdbId; List<String> get originCountry; String get originalLanguage; String get originalTitle; String get overview; double get popularity; String get posterPath; String get releaseDate; int get revenue; int get runtime; String get status; String get tagline; String get title; bool get video; double get voteAverage; int get voteCount;
/// Create a copy of MovieDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailResponseCopyWith<MovieDetailResponse> get copyWith => _$MovieDetailResponseCopyWithImpl<MovieDetailResponse>(this as MovieDetailResponse, _$identity);

  /// Serializes this MovieDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailResponse&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other.originCountry, originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,budget,const DeepCollectionEquality().hash(genres),homepage,id,imdbId,const DeepCollectionEquality().hash(originCountry),originalLanguage,originalTitle,overview,popularity,posterPath,releaseDate,revenue,runtime,status,tagline,title,video,voteAverage,voteCount]);

@override
String toString() {
  return 'MovieDetailResponse(adult: $adult, backdropPath: $backdropPath, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $MovieDetailResponseCopyWith<$Res>  {
  factory $MovieDetailResponseCopyWith(MovieDetailResponse value, $Res Function(MovieDetailResponse) _then) = _$MovieDetailResponseCopyWithImpl;
@useResult
$Res call({
 bool adult, String backdropPath, int budget, List<GenreModel> genres, String homepage, int id, String imdbId, List<String> originCountry, String originalLanguage, String originalTitle, String overview, double popularity, String posterPath, String releaseDate, int revenue, int runtime, String status, String tagline, String title, bool video, double voteAverage, int voteCount
});




}
/// @nodoc
class _$MovieDetailResponseCopyWithImpl<$Res>
    implements $MovieDetailResponseCopyWith<$Res> {
  _$MovieDetailResponseCopyWithImpl(this._self, this._then);

  final MovieDetailResponse _self;
  final $Res Function(MovieDetailResponse) _then;

/// Create a copy of MovieDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? backdropPath = null,Object? budget = null,Object? genres = null,Object? homepage = null,Object? id = null,Object? imdbId = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalTitle = null,Object? overview = null,Object? popularity = null,Object? posterPath = null,Object? releaseDate = null,Object? revenue = null,Object? runtime = null,Object? status = null,Object? tagline = null,Object? title = null,Object? video = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailResponse].
extension MovieDetailResponsePatterns on MovieDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult,  String backdropPath,  int budget,  List<GenreModel> genres,  String homepage,  int id,  String imdbId,  List<String> originCountry,  String originalLanguage,  String originalTitle,  String overview,  double popularity,  String posterPath,  String releaseDate,  int revenue,  int runtime,  String status,  String tagline,  String title,  bool video,  double voteAverage,  int voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailResponse() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.releaseDate,_that.revenue,_that.runtime,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult,  String backdropPath,  int budget,  List<GenreModel> genres,  String homepage,  int id,  String imdbId,  List<String> originCountry,  String originalLanguage,  String originalTitle,  String overview,  double popularity,  String posterPath,  String releaseDate,  int revenue,  int runtime,  String status,  String tagline,  String title,  bool video,  double voteAverage,  int voteCount)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailResponse():
return $default(_that.adult,_that.backdropPath,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.releaseDate,_that.revenue,_that.runtime,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult,  String backdropPath,  int budget,  List<GenreModel> genres,  String homepage,  int id,  String imdbId,  List<String> originCountry,  String originalLanguage,  String originalTitle,  String overview,  double popularity,  String posterPath,  String releaseDate,  int revenue,  int runtime,  String status,  String tagline,  String title,  bool video,  double voteAverage,  int voteCount)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailResponse() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.budget,_that.genres,_that.homepage,_that.id,_that.imdbId,_that.originCountry,_that.originalLanguage,_that.originalTitle,_that.overview,_that.popularity,_that.posterPath,_that.releaseDate,_that.revenue,_that.runtime,_that.status,_that.tagline,_that.title,_that.video,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MovieDetailResponse implements MovieDetailResponse {
  const _MovieDetailResponse({required this.adult, required this.backdropPath, required this.budget, required final  List<GenreModel> genres, required this.homepage, required this.id, required this.imdbId, required final  List<String> originCountry, required this.originalLanguage, required this.originalTitle, required this.overview, required this.popularity, required this.posterPath, required this.releaseDate, required this.revenue, required this.runtime, required this.status, required this.tagline, required this.title, required this.video, required this.voteAverage, required this.voteCount}): _genres = genres,_originCountry = originCountry;
  factory _MovieDetailResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailResponseFromJson(json);

@override final  bool adult;
@override final  String backdropPath;
@override final  int budget;
 final  List<GenreModel> _genres;
@override List<GenreModel> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override final  String homepage;
@override final  int id;
@override final  String imdbId;
 final  List<String> _originCountry;
@override List<String> get originCountry {
  if (_originCountry is EqualUnmodifiableListView) return _originCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originCountry);
}

@override final  String originalLanguage;
@override final  String originalTitle;
@override final  String overview;
@override final  double popularity;
@override final  String posterPath;
@override final  String releaseDate;
@override final  int revenue;
@override final  int runtime;
@override final  String status;
@override final  String tagline;
@override final  String title;
@override final  bool video;
@override final  double voteAverage;
@override final  int voteCount;

/// Create a copy of MovieDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailResponseCopyWith<_MovieDetailResponse> get copyWith => __$MovieDetailResponseCopyWithImpl<_MovieDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailResponse&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&const DeepCollectionEquality().equals(other._originCountry, _originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.title, title) || other.title == title)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,budget,const DeepCollectionEquality().hash(_genres),homepage,id,imdbId,const DeepCollectionEquality().hash(_originCountry),originalLanguage,originalTitle,overview,popularity,posterPath,releaseDate,revenue,runtime,status,tagline,title,video,voteAverage,voteCount]);

@override
String toString() {
  return 'MovieDetailResponse(adult: $adult, backdropPath: $backdropPath, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailResponseCopyWith<$Res> implements $MovieDetailResponseCopyWith<$Res> {
  factory _$MovieDetailResponseCopyWith(_MovieDetailResponse value, $Res Function(_MovieDetailResponse) _then) = __$MovieDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 bool adult, String backdropPath, int budget, List<GenreModel> genres, String homepage, int id, String imdbId, List<String> originCountry, String originalLanguage, String originalTitle, String overview, double popularity, String posterPath, String releaseDate, int revenue, int runtime, String status, String tagline, String title, bool video, double voteAverage, int voteCount
});




}
/// @nodoc
class __$MovieDetailResponseCopyWithImpl<$Res>
    implements _$MovieDetailResponseCopyWith<$Res> {
  __$MovieDetailResponseCopyWithImpl(this._self, this._then);

  final _MovieDetailResponse _self;
  final $Res Function(_MovieDetailResponse) _then;

/// Create a copy of MovieDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? backdropPath = null,Object? budget = null,Object? genres = null,Object? homepage = null,Object? id = null,Object? imdbId = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalTitle = null,Object? overview = null,Object? popularity = null,Object? posterPath = null,Object? releaseDate = null,Object? revenue = null,Object? runtime = null,Object? status = null,Object? tagline = null,Object? title = null,Object? video = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_MovieDetailResponse(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imdbId: null == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self._originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
