// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowledgeSpan {

 String get text; bool get bold; bool get italic; bool get underline; bool get strike; bool get code; String? get link;
/// Create a copy of KnowledgeSpan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeSpanCopyWith<KnowledgeSpan> get copyWith => _$KnowledgeSpanCopyWithImpl<KnowledgeSpan>(this as KnowledgeSpan, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeSpan&&(identical(other.text, text) || other.text == text)&&(identical(other.bold, bold) || other.bold == bold)&&(identical(other.italic, italic) || other.italic == italic)&&(identical(other.underline, underline) || other.underline == underline)&&(identical(other.strike, strike) || other.strike == strike)&&(identical(other.code, code) || other.code == code)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,text,bold,italic,underline,strike,code,link);

@override
String toString() {
  return 'KnowledgeSpan(text: $text, bold: $bold, italic: $italic, underline: $underline, strike: $strike, code: $code, link: $link)';
}


}

/// @nodoc
abstract mixin class $KnowledgeSpanCopyWith<$Res>  {
  factory $KnowledgeSpanCopyWith(KnowledgeSpan value, $Res Function(KnowledgeSpan) _then) = _$KnowledgeSpanCopyWithImpl;
@useResult
$Res call({
 String text, bool bold, bool italic, bool underline, bool strike, bool code, String? link
});




}
/// @nodoc
class _$KnowledgeSpanCopyWithImpl<$Res>
    implements $KnowledgeSpanCopyWith<$Res> {
  _$KnowledgeSpanCopyWithImpl(this._self, this._then);

  final KnowledgeSpan _self;
  final $Res Function(KnowledgeSpan) _then;

/// Create a copy of KnowledgeSpan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? bold = null,Object? italic = null,Object? underline = null,Object? strike = null,Object? code = null,Object? link = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,bold: null == bold ? _self.bold : bold // ignore: cast_nullable_to_non_nullable
as bool,italic: null == italic ? _self.italic : italic // ignore: cast_nullable_to_non_nullable
as bool,underline: null == underline ? _self.underline : underline // ignore: cast_nullable_to_non_nullable
as bool,strike: null == strike ? _self.strike : strike // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as bool,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeSpan].
extension KnowledgeSpanPatterns on KnowledgeSpan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeSpan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeSpan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeSpan value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeSpan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeSpan value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeSpan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  bool bold,  bool italic,  bool underline,  bool strike,  bool code,  String? link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeSpan() when $default != null:
return $default(_that.text,_that.bold,_that.italic,_that.underline,_that.strike,_that.code,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  bool bold,  bool italic,  bool underline,  bool strike,  bool code,  String? link)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeSpan():
return $default(_that.text,_that.bold,_that.italic,_that.underline,_that.strike,_that.code,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  bool bold,  bool italic,  bool underline,  bool strike,  bool code,  String? link)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeSpan() when $default != null:
return $default(_that.text,_that.bold,_that.italic,_that.underline,_that.strike,_that.code,_that.link);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgeSpan implements KnowledgeSpan {
  const _KnowledgeSpan({required this.text, this.bold = false, this.italic = false, this.underline = false, this.strike = false, this.code = false, this.link});
  

@override final  String text;
@override@JsonKey() final  bool bold;
@override@JsonKey() final  bool italic;
@override@JsonKey() final  bool underline;
@override@JsonKey() final  bool strike;
@override@JsonKey() final  bool code;
@override final  String? link;

/// Create a copy of KnowledgeSpan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeSpanCopyWith<_KnowledgeSpan> get copyWith => __$KnowledgeSpanCopyWithImpl<_KnowledgeSpan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeSpan&&(identical(other.text, text) || other.text == text)&&(identical(other.bold, bold) || other.bold == bold)&&(identical(other.italic, italic) || other.italic == italic)&&(identical(other.underline, underline) || other.underline == underline)&&(identical(other.strike, strike) || other.strike == strike)&&(identical(other.code, code) || other.code == code)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,text,bold,italic,underline,strike,code,link);

@override
String toString() {
  return 'KnowledgeSpan(text: $text, bold: $bold, italic: $italic, underline: $underline, strike: $strike, code: $code, link: $link)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeSpanCopyWith<$Res> implements $KnowledgeSpanCopyWith<$Res> {
  factory _$KnowledgeSpanCopyWith(_KnowledgeSpan value, $Res Function(_KnowledgeSpan) _then) = __$KnowledgeSpanCopyWithImpl;
@override @useResult
$Res call({
 String text, bool bold, bool italic, bool underline, bool strike, bool code, String? link
});




}
/// @nodoc
class __$KnowledgeSpanCopyWithImpl<$Res>
    implements _$KnowledgeSpanCopyWith<$Res> {
  __$KnowledgeSpanCopyWithImpl(this._self, this._then);

  final _KnowledgeSpan _self;
  final $Res Function(_KnowledgeSpan) _then;

/// Create a copy of KnowledgeSpan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? bold = null,Object? italic = null,Object? underline = null,Object? strike = null,Object? code = null,Object? link = freezed,}) {
  return _then(_KnowledgeSpan(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,bold: null == bold ? _self.bold : bold // ignore: cast_nullable_to_non_nullable
as bool,italic: null == italic ? _self.italic : italic // ignore: cast_nullable_to_non_nullable
as bool,underline: null == underline ? _self.underline : underline // ignore: cast_nullable_to_non_nullable
as bool,strike: null == strike ? _self.strike : strike // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as bool,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$KnowledgeBlock {

 String get id;
/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeBlockCopyWith<KnowledgeBlock> get copyWith => _$KnowledgeBlockCopyWithImpl<KnowledgeBlock>(this as KnowledgeBlock, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeBlock&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'KnowledgeBlock(id: $id)';
}


}

/// @nodoc
abstract mixin class $KnowledgeBlockCopyWith<$Res>  {
  factory $KnowledgeBlockCopyWith(KnowledgeBlock value, $Res Function(KnowledgeBlock) _then) = _$KnowledgeBlockCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$KnowledgeBlockCopyWithImpl<$Res>
    implements $KnowledgeBlockCopyWith<$Res> {
  _$KnowledgeBlockCopyWithImpl(this._self, this._then);

  final KnowledgeBlock _self;
  final $Res Function(KnowledgeBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeBlock].
extension KnowledgeBlockPatterns on KnowledgeBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HeadingBlock value)?  heading,TResult Function( ParagraphBlock value)?  paragraph,TResult Function( BulletedListBlock value)?  bulletedList,TResult Function( NumberedListBlock value)?  numberedList,TResult Function( QuoteBlock value)?  quote,TResult Function( CalloutBlock value)?  callout,TResult Function( DividerBlock value)?  divider,TResult Function( ImageBlock value)?  image,TResult Function( FileBlock value)?  file,TResult Function( VideoBlock value)?  video,TResult Function( TableBlock value)?  table,TResult Function( UnknownBlock value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HeadingBlock() when heading != null:
return heading(_that);case ParagraphBlock() when paragraph != null:
return paragraph(_that);case BulletedListBlock() when bulletedList != null:
return bulletedList(_that);case NumberedListBlock() when numberedList != null:
return numberedList(_that);case QuoteBlock() when quote != null:
return quote(_that);case CalloutBlock() when callout != null:
return callout(_that);case DividerBlock() when divider != null:
return divider(_that);case ImageBlock() when image != null:
return image(_that);case FileBlock() when file != null:
return file(_that);case VideoBlock() when video != null:
return video(_that);case TableBlock() when table != null:
return table(_that);case UnknownBlock() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HeadingBlock value)  heading,required TResult Function( ParagraphBlock value)  paragraph,required TResult Function( BulletedListBlock value)  bulletedList,required TResult Function( NumberedListBlock value)  numberedList,required TResult Function( QuoteBlock value)  quote,required TResult Function( CalloutBlock value)  callout,required TResult Function( DividerBlock value)  divider,required TResult Function( ImageBlock value)  image,required TResult Function( FileBlock value)  file,required TResult Function( VideoBlock value)  video,required TResult Function( TableBlock value)  table,required TResult Function( UnknownBlock value)  unknown,}){
final _that = this;
switch (_that) {
case HeadingBlock():
return heading(_that);case ParagraphBlock():
return paragraph(_that);case BulletedListBlock():
return bulletedList(_that);case NumberedListBlock():
return numberedList(_that);case QuoteBlock():
return quote(_that);case CalloutBlock():
return callout(_that);case DividerBlock():
return divider(_that);case ImageBlock():
return image(_that);case FileBlock():
return file(_that);case VideoBlock():
return video(_that);case TableBlock():
return table(_that);case UnknownBlock():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HeadingBlock value)?  heading,TResult? Function( ParagraphBlock value)?  paragraph,TResult? Function( BulletedListBlock value)?  bulletedList,TResult? Function( NumberedListBlock value)?  numberedList,TResult? Function( QuoteBlock value)?  quote,TResult? Function( CalloutBlock value)?  callout,TResult? Function( DividerBlock value)?  divider,TResult? Function( ImageBlock value)?  image,TResult? Function( FileBlock value)?  file,TResult? Function( VideoBlock value)?  video,TResult? Function( TableBlock value)?  table,TResult? Function( UnknownBlock value)?  unknown,}){
final _that = this;
switch (_that) {
case HeadingBlock() when heading != null:
return heading(_that);case ParagraphBlock() when paragraph != null:
return paragraph(_that);case BulletedListBlock() when bulletedList != null:
return bulletedList(_that);case NumberedListBlock() when numberedList != null:
return numberedList(_that);case QuoteBlock() when quote != null:
return quote(_that);case CalloutBlock() when callout != null:
return callout(_that);case DividerBlock() when divider != null:
return divider(_that);case ImageBlock() when image != null:
return image(_that);case FileBlock() when file != null:
return file(_that);case VideoBlock() when video != null:
return video(_that);case TableBlock() when table != null:
return table(_that);case UnknownBlock() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  int level,  List<KnowledgeSpan> rich)?  heading,TResult Function( String id,  List<KnowledgeSpan> rich)?  paragraph,TResult Function( String id,  List<List<KnowledgeSpan>> items)?  bulletedList,TResult Function( String id,  List<List<KnowledgeSpan>> items)?  numberedList,TResult Function( String id,  List<KnowledgeSpan> rich)?  quote,TResult Function( String id,  List<KnowledgeSpan> rich,  String? emoji)?  callout,TResult Function( String id)?  divider,TResult Function( String id,  String fileId,  String? url,  DateTime? urlExpiresAt,  String? caption)?  image,TResult Function( String id,  String fileId,  String filename,  int sizeBytes,  String? url,  DateTime? urlExpiresAt)?  file,TResult Function( String id,  String provider,  String url,  String videoId)?  video,TResult Function( String id,  List<List<List<KnowledgeSpan>>> rows)?  table,TResult Function( String id,  String rawType)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HeadingBlock() when heading != null:
return heading(_that.id,_that.level,_that.rich);case ParagraphBlock() when paragraph != null:
return paragraph(_that.id,_that.rich);case BulletedListBlock() when bulletedList != null:
return bulletedList(_that.id,_that.items);case NumberedListBlock() when numberedList != null:
return numberedList(_that.id,_that.items);case QuoteBlock() when quote != null:
return quote(_that.id,_that.rich);case CalloutBlock() when callout != null:
return callout(_that.id,_that.rich,_that.emoji);case DividerBlock() when divider != null:
return divider(_that.id);case ImageBlock() when image != null:
return image(_that.id,_that.fileId,_that.url,_that.urlExpiresAt,_that.caption);case FileBlock() when file != null:
return file(_that.id,_that.fileId,_that.filename,_that.sizeBytes,_that.url,_that.urlExpiresAt);case VideoBlock() when video != null:
return video(_that.id,_that.provider,_that.url,_that.videoId);case TableBlock() when table != null:
return table(_that.id,_that.rows);case UnknownBlock() when unknown != null:
return unknown(_that.id,_that.rawType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  int level,  List<KnowledgeSpan> rich)  heading,required TResult Function( String id,  List<KnowledgeSpan> rich)  paragraph,required TResult Function( String id,  List<List<KnowledgeSpan>> items)  bulletedList,required TResult Function( String id,  List<List<KnowledgeSpan>> items)  numberedList,required TResult Function( String id,  List<KnowledgeSpan> rich)  quote,required TResult Function( String id,  List<KnowledgeSpan> rich,  String? emoji)  callout,required TResult Function( String id)  divider,required TResult Function( String id,  String fileId,  String? url,  DateTime? urlExpiresAt,  String? caption)  image,required TResult Function( String id,  String fileId,  String filename,  int sizeBytes,  String? url,  DateTime? urlExpiresAt)  file,required TResult Function( String id,  String provider,  String url,  String videoId)  video,required TResult Function( String id,  List<List<List<KnowledgeSpan>>> rows)  table,required TResult Function( String id,  String rawType)  unknown,}) {final _that = this;
switch (_that) {
case HeadingBlock():
return heading(_that.id,_that.level,_that.rich);case ParagraphBlock():
return paragraph(_that.id,_that.rich);case BulletedListBlock():
return bulletedList(_that.id,_that.items);case NumberedListBlock():
return numberedList(_that.id,_that.items);case QuoteBlock():
return quote(_that.id,_that.rich);case CalloutBlock():
return callout(_that.id,_that.rich,_that.emoji);case DividerBlock():
return divider(_that.id);case ImageBlock():
return image(_that.id,_that.fileId,_that.url,_that.urlExpiresAt,_that.caption);case FileBlock():
return file(_that.id,_that.fileId,_that.filename,_that.sizeBytes,_that.url,_that.urlExpiresAt);case VideoBlock():
return video(_that.id,_that.provider,_that.url,_that.videoId);case TableBlock():
return table(_that.id,_that.rows);case UnknownBlock():
return unknown(_that.id,_that.rawType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  int level,  List<KnowledgeSpan> rich)?  heading,TResult? Function( String id,  List<KnowledgeSpan> rich)?  paragraph,TResult? Function( String id,  List<List<KnowledgeSpan>> items)?  bulletedList,TResult? Function( String id,  List<List<KnowledgeSpan>> items)?  numberedList,TResult? Function( String id,  List<KnowledgeSpan> rich)?  quote,TResult? Function( String id,  List<KnowledgeSpan> rich,  String? emoji)?  callout,TResult? Function( String id)?  divider,TResult? Function( String id,  String fileId,  String? url,  DateTime? urlExpiresAt,  String? caption)?  image,TResult? Function( String id,  String fileId,  String filename,  int sizeBytes,  String? url,  DateTime? urlExpiresAt)?  file,TResult? Function( String id,  String provider,  String url,  String videoId)?  video,TResult? Function( String id,  List<List<List<KnowledgeSpan>>> rows)?  table,TResult? Function( String id,  String rawType)?  unknown,}) {final _that = this;
switch (_that) {
case HeadingBlock() when heading != null:
return heading(_that.id,_that.level,_that.rich);case ParagraphBlock() when paragraph != null:
return paragraph(_that.id,_that.rich);case BulletedListBlock() when bulletedList != null:
return bulletedList(_that.id,_that.items);case NumberedListBlock() when numberedList != null:
return numberedList(_that.id,_that.items);case QuoteBlock() when quote != null:
return quote(_that.id,_that.rich);case CalloutBlock() when callout != null:
return callout(_that.id,_that.rich,_that.emoji);case DividerBlock() when divider != null:
return divider(_that.id);case ImageBlock() when image != null:
return image(_that.id,_that.fileId,_that.url,_that.urlExpiresAt,_that.caption);case FileBlock() when file != null:
return file(_that.id,_that.fileId,_that.filename,_that.sizeBytes,_that.url,_that.urlExpiresAt);case VideoBlock() when video != null:
return video(_that.id,_that.provider,_that.url,_that.videoId);case TableBlock() when table != null:
return table(_that.id,_that.rows);case UnknownBlock() when unknown != null:
return unknown(_that.id,_that.rawType);case _:
  return null;

}
}

}

/// @nodoc


class HeadingBlock implements KnowledgeBlock {
  const HeadingBlock({required this.id, required this.level, required final  List<KnowledgeSpan> rich}): _rich = rich;
  

@override final  String id;
 final  int level;
 final  List<KnowledgeSpan> _rich;
 List<KnowledgeSpan> get rich {
  if (_rich is EqualUnmodifiableListView) return _rich;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rich);
}


/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeadingBlockCopyWith<HeadingBlock> get copyWith => _$HeadingBlockCopyWithImpl<HeadingBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeadingBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._rich, _rich));
}


@override
int get hashCode => Object.hash(runtimeType,id,level,const DeepCollectionEquality().hash(_rich));

@override
String toString() {
  return 'KnowledgeBlock.heading(id: $id, level: $level, rich: $rich)';
}


}

/// @nodoc
abstract mixin class $HeadingBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $HeadingBlockCopyWith(HeadingBlock value, $Res Function(HeadingBlock) _then) = _$HeadingBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, int level, List<KnowledgeSpan> rich
});




}
/// @nodoc
class _$HeadingBlockCopyWithImpl<$Res>
    implements $HeadingBlockCopyWith<$Res> {
  _$HeadingBlockCopyWithImpl(this._self, this._then);

  final HeadingBlock _self;
  final $Res Function(HeadingBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? level = null,Object? rich = null,}) {
  return _then(HeadingBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,rich: null == rich ? _self._rich : rich // ignore: cast_nullable_to_non_nullable
as List<KnowledgeSpan>,
  ));
}


}

/// @nodoc


class ParagraphBlock implements KnowledgeBlock {
  const ParagraphBlock({required this.id, required final  List<KnowledgeSpan> rich}): _rich = rich;
  

@override final  String id;
 final  List<KnowledgeSpan> _rich;
 List<KnowledgeSpan> get rich {
  if (_rich is EqualUnmodifiableListView) return _rich;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rich);
}


/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParagraphBlockCopyWith<ParagraphBlock> get copyWith => _$ParagraphBlockCopyWithImpl<ParagraphBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParagraphBlock&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._rich, _rich));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_rich));

@override
String toString() {
  return 'KnowledgeBlock.paragraph(id: $id, rich: $rich)';
}


}

/// @nodoc
abstract mixin class $ParagraphBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $ParagraphBlockCopyWith(ParagraphBlock value, $Res Function(ParagraphBlock) _then) = _$ParagraphBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, List<KnowledgeSpan> rich
});




}
/// @nodoc
class _$ParagraphBlockCopyWithImpl<$Res>
    implements $ParagraphBlockCopyWith<$Res> {
  _$ParagraphBlockCopyWithImpl(this._self, this._then);

  final ParagraphBlock _self;
  final $Res Function(ParagraphBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rich = null,}) {
  return _then(ParagraphBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rich: null == rich ? _self._rich : rich // ignore: cast_nullable_to_non_nullable
as List<KnowledgeSpan>,
  ));
}


}

/// @nodoc


class BulletedListBlock implements KnowledgeBlock {
  const BulletedListBlock({required this.id, required final  List<List<KnowledgeSpan>> items}): _items = items;
  

@override final  String id;
 final  List<List<KnowledgeSpan>> _items;
 List<List<KnowledgeSpan>> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulletedListBlockCopyWith<BulletedListBlock> get copyWith => _$BulletedListBlockCopyWithImpl<BulletedListBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulletedListBlock&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'KnowledgeBlock.bulletedList(id: $id, items: $items)';
}


}

/// @nodoc
abstract mixin class $BulletedListBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $BulletedListBlockCopyWith(BulletedListBlock value, $Res Function(BulletedListBlock) _then) = _$BulletedListBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, List<List<KnowledgeSpan>> items
});




}
/// @nodoc
class _$BulletedListBlockCopyWithImpl<$Res>
    implements $BulletedListBlockCopyWith<$Res> {
  _$BulletedListBlockCopyWithImpl(this._self, this._then);

  final BulletedListBlock _self;
  final $Res Function(BulletedListBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,}) {
  return _then(BulletedListBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<List<KnowledgeSpan>>,
  ));
}


}

/// @nodoc


class NumberedListBlock implements KnowledgeBlock {
  const NumberedListBlock({required this.id, required final  List<List<KnowledgeSpan>> items}): _items = items;
  

@override final  String id;
 final  List<List<KnowledgeSpan>> _items;
 List<List<KnowledgeSpan>> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberedListBlockCopyWith<NumberedListBlock> get copyWith => _$NumberedListBlockCopyWithImpl<NumberedListBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberedListBlock&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'KnowledgeBlock.numberedList(id: $id, items: $items)';
}


}

/// @nodoc
abstract mixin class $NumberedListBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $NumberedListBlockCopyWith(NumberedListBlock value, $Res Function(NumberedListBlock) _then) = _$NumberedListBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, List<List<KnowledgeSpan>> items
});




}
/// @nodoc
class _$NumberedListBlockCopyWithImpl<$Res>
    implements $NumberedListBlockCopyWith<$Res> {
  _$NumberedListBlockCopyWithImpl(this._self, this._then);

  final NumberedListBlock _self;
  final $Res Function(NumberedListBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,}) {
  return _then(NumberedListBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<List<KnowledgeSpan>>,
  ));
}


}

/// @nodoc


class QuoteBlock implements KnowledgeBlock {
  const QuoteBlock({required this.id, required final  List<KnowledgeSpan> rich}): _rich = rich;
  

@override final  String id;
 final  List<KnowledgeSpan> _rich;
 List<KnowledgeSpan> get rich {
  if (_rich is EqualUnmodifiableListView) return _rich;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rich);
}


/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteBlockCopyWith<QuoteBlock> get copyWith => _$QuoteBlockCopyWithImpl<QuoteBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteBlock&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._rich, _rich));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_rich));

@override
String toString() {
  return 'KnowledgeBlock.quote(id: $id, rich: $rich)';
}


}

/// @nodoc
abstract mixin class $QuoteBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $QuoteBlockCopyWith(QuoteBlock value, $Res Function(QuoteBlock) _then) = _$QuoteBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, List<KnowledgeSpan> rich
});




}
/// @nodoc
class _$QuoteBlockCopyWithImpl<$Res>
    implements $QuoteBlockCopyWith<$Res> {
  _$QuoteBlockCopyWithImpl(this._self, this._then);

  final QuoteBlock _self;
  final $Res Function(QuoteBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rich = null,}) {
  return _then(QuoteBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rich: null == rich ? _self._rich : rich // ignore: cast_nullable_to_non_nullable
as List<KnowledgeSpan>,
  ));
}


}

/// @nodoc


class CalloutBlock implements KnowledgeBlock {
  const CalloutBlock({required this.id, required final  List<KnowledgeSpan> rich, this.emoji}): _rich = rich;
  

@override final  String id;
 final  List<KnowledgeSpan> _rich;
 List<KnowledgeSpan> get rich {
  if (_rich is EqualUnmodifiableListView) return _rich;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rich);
}

 final  String? emoji;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalloutBlockCopyWith<CalloutBlock> get copyWith => _$CalloutBlockCopyWithImpl<CalloutBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalloutBlock&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._rich, _rich)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_rich),emoji);

@override
String toString() {
  return 'KnowledgeBlock.callout(id: $id, rich: $rich, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class $CalloutBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $CalloutBlockCopyWith(CalloutBlock value, $Res Function(CalloutBlock) _then) = _$CalloutBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, List<KnowledgeSpan> rich, String? emoji
});




}
/// @nodoc
class _$CalloutBlockCopyWithImpl<$Res>
    implements $CalloutBlockCopyWith<$Res> {
  _$CalloutBlockCopyWithImpl(this._self, this._then);

  final CalloutBlock _self;
  final $Res Function(CalloutBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rich = null,Object? emoji = freezed,}) {
  return _then(CalloutBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rich: null == rich ? _self._rich : rich // ignore: cast_nullable_to_non_nullable
as List<KnowledgeSpan>,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DividerBlock implements KnowledgeBlock {
  const DividerBlock({required this.id});
  

@override final  String id;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DividerBlockCopyWith<DividerBlock> get copyWith => _$DividerBlockCopyWithImpl<DividerBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DividerBlock&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'KnowledgeBlock.divider(id: $id)';
}


}

/// @nodoc
abstract mixin class $DividerBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $DividerBlockCopyWith(DividerBlock value, $Res Function(DividerBlock) _then) = _$DividerBlockCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DividerBlockCopyWithImpl<$Res>
    implements $DividerBlockCopyWith<$Res> {
  _$DividerBlockCopyWithImpl(this._self, this._then);

  final DividerBlock _self;
  final $Res Function(DividerBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DividerBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ImageBlock implements KnowledgeBlock {
  const ImageBlock({required this.id, required this.fileId, this.url, this.urlExpiresAt, this.caption});
  

@override final  String id;
 final  String fileId;
 final  String? url;
 final  DateTime? urlExpiresAt;
 final  String? caption;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageBlockCopyWith<ImageBlock> get copyWith => _$ImageBlockCopyWithImpl<ImageBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.caption, caption) || other.caption == caption));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileId,url,urlExpiresAt,caption);

@override
String toString() {
  return 'KnowledgeBlock.image(id: $id, fileId: $fileId, url: $url, urlExpiresAt: $urlExpiresAt, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $ImageBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $ImageBlockCopyWith(ImageBlock value, $Res Function(ImageBlock) _then) = _$ImageBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileId, String? url, DateTime? urlExpiresAt, String? caption
});




}
/// @nodoc
class _$ImageBlockCopyWithImpl<$Res>
    implements $ImageBlockCopyWith<$Res> {
  _$ImageBlockCopyWithImpl(this._self, this._then);

  final ImageBlock _self;
  final $Res Function(ImageBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileId = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? caption = freezed,}) {
  return _then(ImageBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FileBlock implements KnowledgeBlock {
  const FileBlock({required this.id, required this.fileId, required this.filename, required this.sizeBytes, this.url, this.urlExpiresAt});
  

@override final  String id;
 final  String fileId;
 final  String filename;
 final  int sizeBytes;
 final  String? url;
 final  DateTime? urlExpiresAt;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileBlockCopyWith<FileBlock> get copyWith => _$FileBlockCopyWithImpl<FileBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileId,filename,sizeBytes,url,urlExpiresAt);

@override
String toString() {
  return 'KnowledgeBlock.file(id: $id, fileId: $fileId, filename: $filename, sizeBytes: $sizeBytes, url: $url, urlExpiresAt: $urlExpiresAt)';
}


}

/// @nodoc
abstract mixin class $FileBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $FileBlockCopyWith(FileBlock value, $Res Function(FileBlock) _then) = _$FileBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileId, String filename, int sizeBytes, String? url, DateTime? urlExpiresAt
});




}
/// @nodoc
class _$FileBlockCopyWithImpl<$Res>
    implements $FileBlockCopyWith<$Res> {
  _$FileBlockCopyWithImpl(this._self, this._then);

  final FileBlock _self;
  final $Res Function(FileBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileId = null,Object? filename = null,Object? sizeBytes = null,Object? url = freezed,Object? urlExpiresAt = freezed,}) {
  return _then(FileBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class VideoBlock implements KnowledgeBlock {
  const VideoBlock({required this.id, required this.provider, required this.url, required this.videoId});
  

@override final  String id;
 final  String provider;
 final  String url;
 final  String videoId;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoBlockCopyWith<VideoBlock> get copyWith => _$VideoBlockCopyWithImpl<VideoBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.url, url) || other.url == url)&&(identical(other.videoId, videoId) || other.videoId == videoId));
}


@override
int get hashCode => Object.hash(runtimeType,id,provider,url,videoId);

@override
String toString() {
  return 'KnowledgeBlock.video(id: $id, provider: $provider, url: $url, videoId: $videoId)';
}


}

/// @nodoc
abstract mixin class $VideoBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $VideoBlockCopyWith(VideoBlock value, $Res Function(VideoBlock) _then) = _$VideoBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String provider, String url, String videoId
});




}
/// @nodoc
class _$VideoBlockCopyWithImpl<$Res>
    implements $VideoBlockCopyWith<$Res> {
  _$VideoBlockCopyWithImpl(this._self, this._then);

  final VideoBlock _self;
  final $Res Function(VideoBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provider = null,Object? url = null,Object? videoId = null,}) {
  return _then(VideoBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TableBlock implements KnowledgeBlock {
  const TableBlock({required this.id, required final  List<List<List<KnowledgeSpan>>> rows}): _rows = rows;
  

@override final  String id;
 final  List<List<List<KnowledgeSpan>>> _rows;
 List<List<List<KnowledgeSpan>>> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}


/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableBlockCopyWith<TableBlock> get copyWith => _$TableBlockCopyWithImpl<TableBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableBlock&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._rows, _rows));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_rows));

@override
String toString() {
  return 'KnowledgeBlock.table(id: $id, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $TableBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $TableBlockCopyWith(TableBlock value, $Res Function(TableBlock) _then) = _$TableBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, List<List<List<KnowledgeSpan>>> rows
});




}
/// @nodoc
class _$TableBlockCopyWithImpl<$Res>
    implements $TableBlockCopyWith<$Res> {
  _$TableBlockCopyWithImpl(this._self, this._then);

  final TableBlock _self;
  final $Res Function(TableBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rows = null,}) {
  return _then(TableBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<List<List<KnowledgeSpan>>>,
  ));
}


}

/// @nodoc


class UnknownBlock implements KnowledgeBlock {
  const UnknownBlock({required this.id, required this.rawType});
  

@override final  String id;
 final  String rawType;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownBlockCopyWith<UnknownBlock> get copyWith => _$UnknownBlockCopyWithImpl<UnknownBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.rawType, rawType) || other.rawType == rawType));
}


@override
int get hashCode => Object.hash(runtimeType,id,rawType);

@override
String toString() {
  return 'KnowledgeBlock.unknown(id: $id, rawType: $rawType)';
}


}

/// @nodoc
abstract mixin class $UnknownBlockCopyWith<$Res> implements $KnowledgeBlockCopyWith<$Res> {
  factory $UnknownBlockCopyWith(UnknownBlock value, $Res Function(UnknownBlock) _then) = _$UnknownBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, String rawType
});




}
/// @nodoc
class _$UnknownBlockCopyWithImpl<$Res>
    implements $UnknownBlockCopyWith<$Res> {
  _$UnknownBlockCopyWithImpl(this._self, this._then);

  final UnknownBlock _self;
  final $Res Function(UnknownBlock) _then;

/// Create a copy of KnowledgeBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rawType = null,}) {
  return _then(UnknownBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rawType: null == rawType ? _self.rawType : rawType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
