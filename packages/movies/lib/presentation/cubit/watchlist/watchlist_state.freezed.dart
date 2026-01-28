// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistStatusState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistStatusState()';
}


}

/// @nodoc
class $WatchlistStatusStateCopyWith<$Res>  {
$WatchlistStatusStateCopyWith(WatchlistStatusState _, $Res Function(WatchlistStatusState) __);
}


/// Adds pattern-matching-related methods to [WatchlistStatusState].
extension WatchlistStatusStatePatterns on WatchlistStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _IsAdded value)?  isAdded,TResult Function( _Message value)?  message,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _IsAdded() when isAdded != null:
return isAdded(_that);case _Message() when message != null:
return message(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _IsAdded value)  isAdded,required TResult Function( _Message value)  message,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _IsAdded():
return isAdded(_that);case _Message():
return message(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _IsAdded value)?  isAdded,TResult? Function( _Message value)?  message,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _IsAdded() when isAdded != null:
return isAdded(_that);case _Message() when message != null:
return message(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( bool isAdded)?  isAdded,TResult Function( String message)?  message,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _IsAdded() when isAdded != null:
return isAdded(_that.isAdded);case _Message() when message != null:
return message(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( bool isAdded)  isAdded,required TResult Function( String message)  message,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _IsAdded():
return isAdded(_that.isAdded);case _Message():
return message(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( bool isAdded)?  isAdded,TResult? Function( String message)?  message,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _IsAdded() when isAdded != null:
return isAdded(_that.isAdded);case _Message() when message != null:
return message(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WatchlistStatusState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistStatusState.initial()';
}


}




/// @nodoc


class _Loading implements WatchlistStatusState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WatchlistStatusState.loading()';
}


}




/// @nodoc


class _IsAdded implements WatchlistStatusState {
  const _IsAdded(this.isAdded);
  

 final  bool isAdded;

/// Create a copy of WatchlistStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsAddedCopyWith<_IsAdded> get copyWith => __$IsAddedCopyWithImpl<_IsAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsAdded&&(identical(other.isAdded, isAdded) || other.isAdded == isAdded));
}


@override
int get hashCode => Object.hash(runtimeType,isAdded);

@override
String toString() {
  return 'WatchlistStatusState.isAdded(isAdded: $isAdded)';
}


}

/// @nodoc
abstract mixin class _$IsAddedCopyWith<$Res> implements $WatchlistStatusStateCopyWith<$Res> {
  factory _$IsAddedCopyWith(_IsAdded value, $Res Function(_IsAdded) _then) = __$IsAddedCopyWithImpl;
@useResult
$Res call({
 bool isAdded
});




}
/// @nodoc
class __$IsAddedCopyWithImpl<$Res>
    implements _$IsAddedCopyWith<$Res> {
  __$IsAddedCopyWithImpl(this._self, this._then);

  final _IsAdded _self;
  final $Res Function(_IsAdded) _then;

/// Create a copy of WatchlistStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isAdded = null,}) {
  return _then(_IsAdded(
null == isAdded ? _self.isAdded : isAdded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Message implements WatchlistStatusState {
  const _Message(this.message);
  

 final  String message;

/// Create a copy of WatchlistStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WatchlistStatusState.message(message: $message)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $WatchlistStatusStateCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of WatchlistStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Message(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
