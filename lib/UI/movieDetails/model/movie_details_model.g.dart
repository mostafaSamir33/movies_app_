// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsAdapter extends TypeAdapter<MovieDetails> {
  @override
  final int typeId = 0;

  @override
  MovieDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetails(
      id: fields[0] as int?,
      url: fields[1] as String?,
      imdbCode: fields[2] as String?,
      title: fields[3] as String?,
      titleEnglish: fields[4] as String?,
      titleLong: fields[5] as String?,
      slug: fields[6] as String?,
      year: fields[7] as int?,
      rating: fields[8] as double?,
      runtime: fields[9] as int?,
      genres: (fields[10] as List?)?.cast<String>(),
      likeCount: fields[11] as int?,
      descriptionIntro: fields[12] as String?,
      descriptionFull: fields[13] as String?,
      ytTrailerCode: fields[14] as String?,
      language: fields[15] as String?,
      mpaRating: fields[16] as String?,
      backgroundImage: fields[17] as String?,
      backgroundImageOriginal: fields[18] as String?,
      smallCoverImage: fields[19] as String?,
      mediumCoverImage: fields[20] as String?,
      largeCoverImage: fields[21] as String?,
      mediumScreenshotImage1: fields[22] as String?,
      mediumScreenshotImage2: fields[23] as String?,
      mediumScreenshotImage3: fields[24] as String?,
      largeScreenshotImage1: fields[25] as String?,
      largeScreenshotImage2: fields[26] as String?,
      largeScreenshotImage3: fields[27] as String?,
      cast: (fields[28] as List?)?.cast<Cast>(),
      torrents: (fields[29] as List?)?.cast<Torrents>(),
      dateUploaded: fields[30] as String?,
      dateUploadedUnix: fields[31] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetails obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.imdbCode)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.titleEnglish)
      ..writeByte(5)
      ..write(obj.titleLong)
      ..writeByte(6)
      ..write(obj.slug)
      ..writeByte(7)
      ..write(obj.year)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.runtime)
      ..writeByte(10)
      ..write(obj.genres)
      ..writeByte(11)
      ..write(obj.likeCount)
      ..writeByte(12)
      ..write(obj.descriptionIntro)
      ..writeByte(13)
      ..write(obj.descriptionFull)
      ..writeByte(14)
      ..write(obj.ytTrailerCode)
      ..writeByte(15)
      ..write(obj.language)
      ..writeByte(16)
      ..write(obj.mpaRating)
      ..writeByte(17)
      ..write(obj.backgroundImage)
      ..writeByte(18)
      ..write(obj.backgroundImageOriginal)
      ..writeByte(19)
      ..write(obj.smallCoverImage)
      ..writeByte(20)
      ..write(obj.mediumCoverImage)
      ..writeByte(21)
      ..write(obj.largeCoverImage)
      ..writeByte(22)
      ..write(obj.mediumScreenshotImage1)
      ..writeByte(23)
      ..write(obj.mediumScreenshotImage2)
      ..writeByte(24)
      ..write(obj.mediumScreenshotImage3)
      ..writeByte(25)
      ..write(obj.largeScreenshotImage1)
      ..writeByte(26)
      ..write(obj.largeScreenshotImage2)
      ..writeByte(27)
      ..write(obj.largeScreenshotImage3)
      ..writeByte(28)
      ..write(obj.cast)
      ..writeByte(29)
      ..write(obj.torrents)
      ..writeByte(30)
      ..write(obj.dateUploaded)
      ..writeByte(31)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TorrentsAdapter extends TypeAdapter<Torrents> {
  @override
  final int typeId = 2;

  @override
  Torrents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Torrents(
      url: fields[0] as String?,
      hash: fields[1] as String?,
      quality: fields[2] as String?,
      type: fields[3] as String?,
      isRepack: fields[4] as String?,
      videoCodec: fields[5] as String?,
      bitDepth: fields[6] as String?,
      audioChannels: fields[7] as String?,
      seeds: fields[8] as int?,
      peers: fields[9] as int?,
      size: fields[10] as String?,
      sizeBytes: fields[11] as int?,
      dateUploaded: fields[12] as String?,
      dateUploadedUnix: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Torrents obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.hash)
      ..writeByte(2)
      ..write(obj.quality)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.isRepack)
      ..writeByte(5)
      ..write(obj.videoCodec)
      ..writeByte(6)
      ..write(obj.bitDepth)
      ..writeByte(7)
      ..write(obj.audioChannels)
      ..writeByte(8)
      ..write(obj.seeds)
      ..writeByte(9)
      ..write(obj.peers)
      ..writeByte(10)
      ..write(obj.size)
      ..writeByte(11)
      ..write(obj.sizeBytes)
      ..writeByte(12)
      ..write(obj.dateUploaded)
      ..writeByte(13)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TorrentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CastAdapter extends TypeAdapter<Cast> {
  @override
  final int typeId = 1;

  @override
  Cast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cast(
      name: fields[0] as String?,
      characterName: fields[1] as String?,
      urlSmallImage: fields[2] as String?,
      imdbCode: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cast obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.characterName)
      ..writeByte(2)
      ..write(obj.urlSmallImage)
      ..writeByte(3)
      ..write(obj.imdbCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
