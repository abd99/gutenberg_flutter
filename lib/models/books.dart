class BooksModel {
  int count;
  String next;
  Null previous;
  List<Results> results;

  BooksModel({this.count, this.next, this.previous, this.results});

  BooksModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = List<Results>();
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int id;
  String title;
  List<Authors> authors;
  List<String> subjects;
  List<String> bookshelves;
  List<String> languages;
  bool copyright;
  String mediaType;
  Formats formats;
  int downloadCount;

  Results(
      {this.id,
      this.title,
      this.authors,
      this.subjects,
      this.bookshelves,
      this.languages,
      this.copyright,
      this.mediaType,
      this.formats,
      this.downloadCount});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = List<Authors>();
      json['authors'].forEach((v) {
        authors.add(Authors.fromJson(v));
      });
    }
    subjects = json['subjects'].cast<String>();
    bookshelves = json['bookshelves'].cast<String>();
    languages = json['languages'].cast<String>();
    copyright = json['copyright'];
    mediaType = json['media_type'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    downloadCount = json['download_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.authors != null) {
      data['authors'] = this.authors.map((v) => v.toJson()).toList();
    }
    data['subjects'] = this.subjects;
    data['bookshelves'] = this.bookshelves;
    data['languages'] = this.languages;
    data['copyright'] = this.copyright;
    data['media_type'] = this.mediaType;
    if (this.formats != null) {
      data['formats'] = this.formats.toJson();
    }
    data['download_count'] = this.downloadCount;
    return data;
  }
}

class Authors {
  String name;
  int birthYear;
  int deathYear;

  Authors({this.name, this.birthYear, this.deathYear});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthYear = json['birth_year'];
    deathYear = json['death_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['birth_year'] = this.birthYear;
    data['death_year'] = this.deathYear;
    return data;
  }
}

class Formats {
  String applicationEpubZip;
  String textPlainCharsetUtf8;
  String imageJpeg;
  String applicationZip;
  String applicationRdfXml;
  String textHtmlCharsetUtf8;
  String applicationXMobipocketEbook;
  String textPlainCharsetUsAscii;
  String textPlainCharsetIso88591;
  String textHtmlCharsetIso88591;
  String textHtmlCharsetUsAscii;
  String textPlain;
  String textRtf;
  String textHtml;
  String applicationPdf;

  Formats(
      {this.applicationEpubZip,
      this.textPlainCharsetUtf8,
      this.imageJpeg,
      this.applicationZip,
      this.applicationRdfXml,
      this.textHtmlCharsetUtf8,
      this.applicationXMobipocketEbook,
      this.textPlainCharsetUsAscii,
      this.textPlainCharsetIso88591,
      this.textHtmlCharsetIso88591,
      this.textHtmlCharsetUsAscii,
      this.textPlain,
      this.textRtf,
      this.textHtml,
      this.applicationPdf});

  Formats.fromJson(Map<String, dynamic> json) {
    applicationEpubZip = json['application/epub+zip'];
    textPlainCharsetUtf8 = json['text/plain; charset=utf-8'];
    imageJpeg = json['image/jpeg'];
    applicationZip = json['application/zip'];
    applicationRdfXml = json['application/rdf+xml'];
    textHtmlCharsetUtf8 = json['text/html; charset=utf-8'];
    applicationXMobipocketEbook = json['application/x-mobipocket-ebook'];
    textPlainCharsetUsAscii = json['text/plain; charset=us-ascii'];
    textPlainCharsetIso88591 = json['text/plain; charset=iso-8859-1'];
    textHtmlCharsetIso88591 = json['text/html; charset=iso-8859-1'];
    textHtmlCharsetUsAscii = json['text/html; charset=us-ascii'];
    textPlain = json['text/plain'];
    textRtf = json['text/rtf'];
    textHtml = json['text/html'];
    applicationPdf = json['application/pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['application/epub+zip'] = this.applicationEpubZip;
    data['text/plain; charset=utf-8'] = this.textPlainCharsetUtf8;
    data['image/jpeg'] = this.imageJpeg;
    data['application/zip'] = this.applicationZip;
    data['application/rdf+xml'] = this.applicationRdfXml;
    data['text/html; charset=utf-8'] = this.textHtmlCharsetUtf8;
    data['application/x-mobipocket-ebook'] = this.applicationXMobipocketEbook;
    data['text/plain; charset=us-ascii'] = this.textPlainCharsetUsAscii;
    data['text/plain; charset=iso-8859-1'] = this.textPlainCharsetIso88591;
    data['text/html; charset=iso-8859-1'] = this.textHtmlCharsetIso88591;
    data['text/html; charset=us-ascii'] = this.textHtmlCharsetUsAscii;
    data['text/plain'] = this.textPlain;
    data['text/rtf'] = this.textRtf;
    data['text/html'] = this.textHtml;
    data['application/pdf'] = this.applicationPdf;
    return data;
  }
}
