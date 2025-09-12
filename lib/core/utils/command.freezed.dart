// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommandState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandState<$T>()';
}


}

/// @nodoc
class $CommandStateCopyWith<T,$Res>  {
$CommandStateCopyWith(CommandState<T> _, $Res Function(CommandState<T>) __);
}


/// Adds pattern-matching-related methods to [CommandState].
extension CommandStatePatterns<T> on CommandState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle<T> value)?  idle,TResult Function( Executing<T> value)?  executing,TResult Function( Succeeded<T> value)?  succeeded,TResult Function( Failed<T> value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Executing() when executing != null:
return executing(_that);case Succeeded() when succeeded != null:
return succeeded(_that);case Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle<T> value)  idle,required TResult Function( Executing<T> value)  executing,required TResult Function( Succeeded<T> value)  succeeded,required TResult Function( Failed<T> value)  failed,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case Executing():
return executing(_that);case Succeeded():
return succeeded(_that);case Failed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle<T> value)?  idle,TResult? Function( Executing<T> value)?  executing,TResult? Function( Succeeded<T> value)?  succeeded,TResult? Function( Failed<T> value)?  failed,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case Executing() when executing != null:
return executing(_that);case Succeeded() when succeeded != null:
return succeeded(_that);case Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  executing,TResult Function( T value)?  succeeded,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Executing() when executing != null:
return executing();case Succeeded() when succeeded != null:
return succeeded(_that.value);case Failed() when failed != null:
return failed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  executing,required TResult Function( T value)  succeeded,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case Executing():
return executing();case Succeeded():
return succeeded(_that.value);case Failed():
return failed(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  executing,TResult? Function( T value)?  succeeded,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case Executing() when executing != null:
return executing();case Succeeded() when succeeded != null:
return succeeded(_that.value);case Failed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Idle<T> extends CommandState<T> {
  const Idle(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandState<$T>.idle()';
}


}




/// @nodoc


class Executing<T> extends CommandState<T> {
  const Executing(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Executing<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandState<$T>.executing()';
}


}




/// @nodoc


class Succeeded<T> extends CommandState<T> {
  const Succeeded(this.value): super._();
  

 final  T value;

/// Create a copy of CommandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucceededCopyWith<T, Succeeded<T>> get copyWith => _$SucceededCopyWithImpl<T, Succeeded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Succeeded<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'CommandState<$T>.succeeded(value: $value)';
}


}

/// @nodoc
abstract mixin class $SucceededCopyWith<T,$Res> implements $CommandStateCopyWith<T, $Res> {
  factory $SucceededCopyWith(Succeeded<T> value, $Res Function(Succeeded<T>) _then) = _$SucceededCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$SucceededCopyWithImpl<T,$Res>
    implements $SucceededCopyWith<T, $Res> {
  _$SucceededCopyWithImpl(this._self, this._then);

  final Succeeded<T> _self;
  final $Res Function(Succeeded<T>) _then;

/// Create a copy of CommandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(Succeeded<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Failed<T> extends CommandState<T> {
  const Failed(this.message): super._();
  

 final  String message;

/// Create a copy of CommandState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<T, Failed<T>> get copyWith => _$FailedCopyWithImpl<T, Failed<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CommandState<$T>.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<T,$Res> implements $CommandStateCopyWith<T, $Res> {
  factory $FailedCopyWith(Failed<T> value, $Res Function(Failed<T>) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailedCopyWithImpl<T,$Res>
    implements $FailedCopyWith<T, $Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed<T> _self;
  final $Res Function(Failed<T>) _then;

/// Create a copy of CommandState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failed<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
