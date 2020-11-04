import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutenberg_flutter/models/book.dart';
import 'package:gutenberg_flutter/models/catalog.dart';
import 'package:gutenberg_flutter/widgets/book_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogPage extends StatefulWidget {
  static final routeName = '/catalog';

  final category;

  const CatalogPage({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  CatalogModel catalogModel = CatalogModel();
  List<Results> results = [];
  String query = '';
  TextEditingController controller = TextEditingController();

  void searchBooks() async {
    var bookData =
        await catalogModel.getBooks(widget.category.toString().toLowerCase());
    BookFetch booksFetched = BookFetch.fromJson(bookData);
    print(booksFetched);
    setState(() {
      results = booksFetched.results;
    });
  }

  void searchQuery(String query) async {
    var bookData = await catalogModel.searchBooks(
        widget.category.toString().toLowerCase(), query);
    BookFetch booksFetched = BookFetch.fromJson(bookData);
    print(booksFetched);
    setState(() {
      if (results.isEmpty) results = booksFetched.results;
    });
  }

  @override
  void initState() {
    super.initState();
    searchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        textTheme: Theme.of(context).textTheme,
        toolbarHeight: 175.0,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Column(
            children: [
              ListTile(
                leading: InkWell(
                  child: SvgPicture.asset('assets/Back.svg'),
                  onTap: () => Navigator.pop(context),
                ),
                title: Text(
                  widget.category,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF0F0F6),
                    focusColor: Color(0xFFF0F0F6),
                    prefixIcon: SvgPicture.asset(
                      'assets/Search.svg',
                      fit: BoxFit.none,
                    ),
                    suffixIcon: query.isNotEmpty
                        ? InkWell(
                            child: SvgPicture.asset(
                              'assets/Cancel.svg',
                              fit: BoxFit.none,
                            ),
                            onTap: () {
                              controller.clear();
                              searchBooks();
                            },
                          )
                        : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      results.clear();
                      query = value;
                    });
                    query.isEmpty ? searchBooks() : searchQuery(query);
                  },
                  onSubmitted: (value) {
                    setState(() {
                      results.clear();
                      query = value;
                    });
                    query.isEmpty ? searchBooks() : searchQuery(query);
                  },
                ),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(200),
        ),
      ),
      body: results.isNotEmpty
          ? GridView.builder(
              itemCount: results.length,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (114 / (162 + 75)),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  child: BookCard(
                    title: results[index].title,
                    author: results[index].authors.isNotEmpty
                        ? results[index].authors[0].name
                        : '',
                    imgURL: results[index].formats.imageJpeg,
                  ),
                  onTap: () {
                    Formats formats = results[index].formats;
                    showBook(formats);
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void showBook(Formats formats) {
    if (formats.textHtml != null)
      launch(formats.textHtml);
    else if (formats.textHtmlCharsetIso88591 != null)
      launch(formats.textHtmlCharsetIso88591);
    else if (formats.textHtmlCharsetUsAscii != null)
      launch(formats.textHtmlCharsetUsAscii);
    else if (formats.textHtmlCharsetUtf8 != null)
      launch(formats.textHtmlCharsetUtf8);
    else if (formats.applicationPdf != null)
      launch(formats.applicationPdf);
    else if (formats.textPlain != null)
      launch(formats.textPlain);
    else if (formats.textPlainCharsetIso88591 = null)
      launch(formats.textPlainCharsetIso88591);
    else if (formats.textPlainCharsetUsAscii != null)
      launch(formats.textPlainCharsetUsAscii);
    else
      _showMyDialog();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No viewable version available'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
