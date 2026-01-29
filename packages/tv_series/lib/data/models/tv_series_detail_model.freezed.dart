// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_series_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TVSeriesDetailResponse {

 bool get adult; String get backdropPath; List<dynamic> get episodeRunTime; String get firstAirDate; List<GenreModel> get genres; String get homepage; int get id; bool get inProduction; List<String> get languages; String get lastAirDate; String get name; dynamic get nextEpisodeToAir; int get numberOfEpisodes; int get numberOfSeasons; List<String> get originCountry; String get originalLanguage; String get originalName; String get overview; double get popularity; String get posterPath; List<SeasonModel> get seasons; String get status; String get tagline; String get type; double get voteAverage; int get voteCount;
/// Create a copy of TVSeriesDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TVSeriesDetailResponseCopyWith<TVSeriesDetailResponse> get copyWith => _$TVSeriesDetailResponseCopyWithImpl<TVSeriesDetailResponse>(this as TVSeriesDetailResponse, _$identity);

  /// Serializes this TVSeriesDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TVSeriesDetailResponse&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other.episodeRunTime, episodeRunTime)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.inProduction, inProduction) || other.inProduction == inProduction)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.lastAirDate, lastAirDate) || other.lastAirDate == lastAirDate)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.nextEpisodeToAir, nextEpisodeToAir)&&(identical(other.numberOfEpisodes, numberOfEpisodes) || other.numberOfEpisodes == numberOfEpisodes)&&(identical(other.numberOfSeasons, numberOfSeasons) || other.numberOfSeasons == numberOfSeasons)&&const DeepCollectionEquality().equals(other.originCountry, originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.type, type) || other.type == type)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,const DeepCollectionEquality().hash(episodeRunTime),firstAirDate,const DeepCollectionEquality().hash(genres),homepage,id,inProduction,const DeepCollectionEquality().hash(languages),lastAirDate,name,const DeepCollectionEquality().hash(nextEpisodeToAir),numberOfEpisodes,numberOfSeasons,const DeepCollectionEquality().hash(originCountry),originalLanguage,originalName,overview,popularity,posterPath,const DeepCollectionEquality().hash(seasons),status,tagline,type,voteAverage,voteCount]);

@override
String toString() {
  return 'TVSeriesDetailResponse(adult: $adult, backdropPath: $backdropPath, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, name: $name, nextEpisodeToAir: $nextEpisodeToAir, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, seasons: $seasons, status: $status, tagline: $tagline, type: $type, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $TVSeriesDetailResponseCopyWith<$Res>  {
  factory $TVSeriesDetailResponseCopyWith(TVSeriesDetailResponse value, $Res Function(TVSeriesDetailResponse) _then) = _$TVSeriesDetailResponseCopyWithImpl;
@useResult
$Res call({
 bool adult, String backdropPath, List<dynamic> episodeRunTime, String firstAirDate, List<GenreModel> genres, String homepage, int id, bool inProduction, List<String> languages, String lastAirDate, String name, dynamic nextEpisodeToAir, int numberOfEpisodes, int numberOfSeasons, List<String> originCountry, String originalLanguage, String originalName, String overview, double popularity, String posterPath, List<SeasonModel> seasons, String status, String tagline, String type, double voteAverage, int voteCount
});




}
/// @nodoc
class _$TVSeriesDetailResponseCopyWithImpl<$Res>
    implements $TVSeriesDetailResponseCopyWith<$Res> {
  _$TVSeriesDetailResponseCopyWithImpl(this._self, this._then);

  final TVSeriesDetailResponse _self;
  final $Res Function(TVSeriesDetailResponse) _then;

/// Create a copy of TVSeriesDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? backdropPath = null,Object? episodeRunTime = null,Object? firstAirDate = null,Object? genres = null,Object? homepage = null,Object? id = null,Object? inProduction = null,Object? languages = null,Object? lastAirDate = null,Object? name = null,Object? nextEpisodeToAir = freezed,Object? numberOfEpisodes = null,Object? numberOfSeasons = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalName = null,Object? overview = null,Object? popularity = null,Object? posterPath = null,Object? seasons = null,Object? status = null,Object? tagline = null,Object? type = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,episodeRunTime: null == episodeRunTime ? _self.episodeRunTime : episodeRunTime // ignore: cast_nullable_to_non_nullable
as List<dynamic>,firstAirDate: null == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,inProduction: null == inProduction ? _self.inProduction : inProduction // ignore: cast_nullable_to_non_nullable
as bool,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,lastAirDate: null == lastAirDate ? _self.lastAirDate : lastAirDate // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nextEpisodeToAir: freezed == nextEpisodeToAir ? _self.nextEpisodeToAir : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
as dynamic,numberOfEpisodes: null == numberOfEpisodes ? _self.numberOfEpisodes : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
as int,numberOfSeasons: null == numberOfSeasons ? _self.numberOfSeasons : numberOfSeasons // ignore: cast_nullable_to_non_nullable
as int,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,seasons: null == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TVSeriesDetailResponse].
extension TVSeriesDetailResponsePatterns on TVSeriesDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TVSeriesDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TVSeriesDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TVSeriesDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _TVSeriesDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TVSeriesDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TVSeriesDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adult,  String backdropPath,  List<dynamic> episodeRunTime,  String firstAirDate,  List<GenreModel> genres,  String homepage,  int id,  bool inProduction,  List<String> languages,  String lastAirDate,  String name,  dynamic nextEpisodeToAir,  int numberOfEpisodes,  int numberOfSeasons,  List<String> originCountry,  String originalLanguage,  String originalName,  String overview,  double popularity,  String posterPath,  List<SeasonModel> seasons,  String status,  String tagline,  String type,  double voteAverage,  int voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TVSeriesDetailResponse() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.episodeRunTime,_that.firstAirDate,_that.genres,_that.homepage,_that.id,_that.inProduction,_that.languages,_that.lastAirDate,_that.name,_that.nextEpisodeToAir,_that.numberOfEpisodes,_that.numberOfSeasons,_that.originCountry,_that.originalLanguage,_that.originalName,_that.overview,_that.popularity,_that.posterPath,_that.seasons,_that.status,_that.tagline,_that.type,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adult,  String backdropPath,  List<dynamic> episodeRunTime,  String firstAirDate,  List<GenreModel> genres,  String homepage,  int id,  bool inProduction,  List<String> languages,  String lastAirDate,  String name,  dynamic nextEpisodeToAir,  int numberOfEpisodes,  int numberOfSeasons,  List<String> originCountry,  String originalLanguage,  String originalName,  String overview,  double popularity,  String posterPath,  List<SeasonModel> seasons,  String status,  String tagline,  String type,  double voteAverage,  int voteCount)  $default,) {final _that = this;
switch (_that) {
case _TVSeriesDetailResponse():
return $default(_that.adult,_that.backdropPath,_that.episodeRunTime,_that.firstAirDate,_that.genres,_that.homepage,_that.id,_that.inProduction,_that.languages,_that.lastAirDate,_that.name,_that.nextEpisodeToAir,_that.numberOfEpisodes,_that.numberOfSeasons,_that.originCountry,_that.originalLanguage,_that.originalName,_that.overview,_that.popularity,_that.posterPath,_that.seasons,_that.status,_that.tagline,_that.type,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adult,  String backdropPath,  List<dynamic> episodeRunTime,  String firstAirDate,  List<GenreModel> genres,  String homepage,  int id,  bool inProduction,  List<String> languages,  String lastAirDate,  String name,  dynamic nextEpisodeToAir,  int numberOfEpisodes,  int numberOfSeasons,  List<String> originCountry,  String originalLanguage,  String originalName,  String overview,  double popularity,  String posterPath,  List<SeasonModel> seasons,  String status,  String tagline,  String type,  double voteAverage,  int voteCount)?  $default,) {final _that = this;
switch (_that) {
case _TVSeriesDetailResponse() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.episodeRunTime,_that.firstAirDate,_that.genres,_that.homepage,_that.id,_that.inProduction,_that.languages,_that.lastAirDate,_that.name,_that.nextEpisodeToAir,_that.numberOfEpisodes,_that.numberOfSeasons,_that.originCountry,_that.originalLanguage,_that.originalName,_that.overview,_that.popularity,_that.posterPath,_that.seasons,_that.status,_that.tagline,_that.type,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TVSeriesDetailResponse implements TVSeriesDetailResponse {
  const _TVSeriesDetailResponse({required this.adult, required this.backdropPath, required final  List<dynamic> episodeRunTime, required this.firstAirDate, required final  List<GenreModel> genres, required this.homepage, required this.id, required this.inProduction, required final  List<String> languages, required this.lastAirDate, required this.name, required this.nextEpisodeToAir, required this.numberOfEpisodes, required this.numberOfSeasons, required final  List<String> originCountry, required this.originalLanguage, required this.originalName, required this.overview, required this.popularity, required this.posterPath, required final  List<SeasonModel> seasons, required this.status, required this.tagline, required this.type, required this.voteAverage, required this.voteCount}): _episodeRunTime = episodeRunTime,_genres = genres,_languages = languages,_originCountry = originCountry,_seasons = seasons;
  factory _TVSeriesDetailResponse.fromJson(Map<String, dynamic> json) => _$TVSeriesDetailResponseFromJson(json);

@override final  bool adult;
@override final  String backdropPath;
 final  List<dynamic> _episodeRunTime;
@override List<dynamic> get episodeRunTime {
  if (_episodeRunTime is EqualUnmodifiableListView) return _episodeRunTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodeRunTime);
}

@override final  String firstAirDate;
 final  List<GenreModel> _genres;
@override List<GenreModel> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override final  String homepage;
@override final  int id;
@override final  bool inProduction;
 final  List<String> _languages;
@override List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override final  String lastAirDate;
@override final  String name;
@override final  dynamic nextEpisodeToAir;
@override final  int numberOfEpisodes;
@override final  int numberOfSeasons;
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
@override final  String posterPath;
 final  List<SeasonModel> _seasons;
@override List<SeasonModel> get seasons {
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seasons);
}

@override final  String status;
@override final  String tagline;
@override final  String type;
@override final  double voteAverage;
@override final  int voteCount;

/// Create a copy of TVSeriesDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TVSeriesDetailResponseCopyWith<_TVSeriesDetailResponse> get copyWith => __$TVSeriesDetailResponseCopyWithImpl<_TVSeriesDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TVSeriesDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TVSeriesDetailResponse&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other._episodeRunTime, _episodeRunTime)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.id, id) || other.id == id)&&(identical(other.inProduction, inProduction) || other.inProduction == inProduction)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.lastAirDate, lastAirDate) || other.lastAirDate == lastAirDate)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.nextEpisodeToAir, nextEpisodeToAir)&&(identical(other.numberOfEpisodes, numberOfEpisodes) || other.numberOfEpisodes == numberOfEpisodes)&&(identical(other.numberOfSeasons, numberOfSeasons) || other.numberOfSeasons == numberOfSeasons)&&const DeepCollectionEquality().equals(other._originCountry, _originCountry)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.type, type) || other.type == type)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,const DeepCollectionEquality().hash(_episodeRunTime),firstAirDate,const DeepCollectionEquality().hash(_genres),homepage,id,inProduction,const DeepCollectionEquality().hash(_languages),lastAirDate,name,const DeepCollectionEquality().hash(nextEpisodeToAir),numberOfEpisodes,numberOfSeasons,const DeepCollectionEquality().hash(_originCountry),originalLanguage,originalName,overview,popularity,posterPath,const DeepCollectionEquality().hash(_seasons),status,tagline,type,voteAverage,voteCount]);

@override
String toString() {
  return 'TVSeriesDetailResponse(adult: $adult, backdropPath: $backdropPath, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, name: $name, nextEpisodeToAir: $nextEpisodeToAir, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, seasons: $seasons, status: $status, tagline: $tagline, type: $type, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$TVSeriesDetailResponseCopyWith<$Res> implements $TVSeriesDetailResponseCopyWith<$Res> {
  factory _$TVSeriesDetailResponseCopyWith(_TVSeriesDetailResponse value, $Res Function(_TVSeriesDetailResponse) _then) = __$TVSeriesDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 bool adult, String backdropPath, List<dynamic> episodeRunTime, String firstAirDate, List<GenreModel> genres, String homepage, int id, bool inProduction, List<String> languages, String lastAirDate, String name, dynamic nextEpisodeToAir, int numberOfEpisodes, int numberOfSeasons, List<String> originCountry, String originalLanguage, String originalName, String overview, double popularity, String posterPath, List<SeasonModel> seasons, String status, String tagline, String type, double voteAverage, int voteCount
});




}
/// @nodoc
class __$TVSeriesDetailResponseCopyWithImpl<$Res>
    implements _$TVSeriesDetailResponseCopyWith<$Res> {
  __$TVSeriesDetailResponseCopyWithImpl(this._self, this._then);

  final _TVSeriesDetailResponse _self;
  final $Res Function(_TVSeriesDetailResponse) _then;

/// Create a copy of TVSeriesDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? backdropPath = null,Object? episodeRunTime = null,Object? firstAirDate = null,Object? genres = null,Object? homepage = null,Object? id = null,Object? inProduction = null,Object? languages = null,Object? lastAirDate = null,Object? name = null,Object? nextEpisodeToAir = freezed,Object? numberOfEpisodes = null,Object? numberOfSeasons = null,Object? originCountry = null,Object? originalLanguage = null,Object? originalName = null,Object? overview = null,Object? popularity = null,Object? posterPath = null,Object? seasons = null,Object? status = null,Object? tagline = null,Object? type = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_TVSeriesDetailResponse(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,episodeRunTime: null == episodeRunTime ? _self._episodeRunTime : episodeRunTime // ignore: cast_nullable_to_non_nullable
as List<dynamic>,firstAirDate: null == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as String,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,homepage: null == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,inProduction: null == inProduction ? _self.inProduction : inProduction // ignore: cast_nullable_to_non_nullable
as bool,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,lastAirDate: null == lastAirDate ? _self.lastAirDate : lastAirDate // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nextEpisodeToAir: freezed == nextEpisodeToAir ? _self.nextEpisodeToAir : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
as dynamic,numberOfEpisodes: null == numberOfEpisodes ? _self.numberOfEpisodes : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
as int,numberOfSeasons: null == numberOfSeasons ? _self.numberOfSeasons : numberOfSeasons // ignore: cast_nullable_to_non_nullable
as int,originCountry: null == originCountry ? _self._originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,seasons: null == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
