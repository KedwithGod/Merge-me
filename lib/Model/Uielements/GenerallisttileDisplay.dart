import 'package:flutter/material.dart';
import 'package:mergeme/Model/Uielements/Generaltextdisplay.dart';

class GeneralListTileDisplay extends StatefulWidget {
  final Key listTilePlaceholderKey;
  final double listTileImageHeight;
  final double listTileImageWidth;
  final Function listTileOnPress;
  final Key listTileHeroKey;
  final double listTilePadding;
  final double listTileTopLeftRadius;
  final double listTileTopRightRadius;
  final double listTileBottomLeftRadius;
  final double listTileBottomRightRadius;
  final String listTileHeroTag;
  final String listTileAssetImage;
  final String titleInputText;
  final Color titleColor;
  final int titleNoOfTextLine;
  final double titleTextFontSize;
  final FontWeight titleTextFontWeight;
  final String titleTextSemanticLabel;
  final String subtitleInputText;
  final Color subtitleColor;
  final int subtitleNoOfTextLine;
  final double subtitleTextFontSize;
  final FontWeight subtitleTextFontWeight;
  final String subtitleTextSemanticLabel;
  final String trailingInputText;
  final Color trailingColor;
  final int trailingNoOfTextLine;
  final double trailingTextFontSize;
  final FontWeight trailingTextFontWeight;
  final String trailingTextSemanticLabel;

  GeneralListTileDisplay(
      this.listTileAssetImage,
      this.listTileBottomLeftRadius,
      this.listTileBottomRightRadius,
      this.listTileHeroKey,
      this.listTileHeroTag,
      this.listTileImageHeight,
      this.listTileImageWidth,
      this.listTileOnPress,
      this.listTilePadding,
      this.listTilePlaceholderKey,
      this.listTileTopLeftRadius,
      this.listTileTopRightRadius,
      this.subtitleColor,
      this.subtitleInputText,
      this.subtitleNoOfTextLine,
      this.subtitleTextFontSize,
      this.subtitleTextFontWeight,
      this.subtitleTextSemanticLabel,
      this.titleColor,
      this.titleInputText,
      this.titleNoOfTextLine,
      this.titleTextFontSize,
      this.titleTextFontWeight,
      this.titleTextSemanticLabel,
      this.trailingColor,
      this.trailingInputText,
      this.trailingNoOfTextLine,
      this.trailingTextFontSize,
      this.trailingTextFontWeight,
      this.trailingTextSemanticLabel);

  @override
  _GeneralListTileDisplayState createState() => _GeneralListTileDisplayState();
}

class _GeneralListTileDisplayState extends State<GeneralListTileDisplay> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
        child: ListTile(
      onTap: widget.listTileOnPress,
      leading: Hero(
          key: widget.listTileHeroKey,
          tag: widget.listTileHeroTag,
          child: Container(
              height: orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.width *
                      widget.listTileImageHeight /
                      667
                  : MediaQuery.of(context).size.height *
                      widget.listTileImageWidth /
                      375,
              width: orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.height *
                      widget.listTileImageHeight /
                      667
                  : MediaQuery.of(context).size.width *
                      widget.listTileImageWidth /
                      375,
              padding: EdgeInsets.all(
                orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.height * widget.listTilePadding / 667
                    : MediaQuery.of(context).size.width * widget.listTilePadding / 375,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        orientation == Orientation.landscape
                            ? MediaQuery.of(context).size.height *
                                (widget.listTileTopLeftRadius / 667)
                            : MediaQuery.of(context).size.width *
                                (widget.listTileTopLeftRadius / 375),
                      ),
                      topRight: Radius.circular(
                        orientation == Orientation.landscape
                            ? MediaQuery.of(context).size.height *
                                (widget.listTileTopRightRadius / 667)
                            : MediaQuery.of(context).size.width *
                                (widget.listTileTopRightRadius / 375),
                      ),
                      bottomLeft: Radius.circular(
                        orientation == Orientation.landscape
                            ? MediaQuery.of(context).size.height *
                                (widget.listTileBottomLeftRadius / 667)
                            : MediaQuery.of(context).size.width *
                                (widget.listTileBottomLeftRadius / 375),
                      ),
                      bottomRight: Radius.circular(
                        orientation == Orientation.landscape
                            ? MediaQuery.of(context).size.height *
                                (widget.listTileBottomRightRadius / 667)
                            : MediaQuery.of(context).size.width *
                                (widget.listTileBottomRightRadius / 375),
                      )),
                  image: DecorationImage(
                          image: AssetImage(widget.listTileAssetImage),
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        )))),
      title: FlatButton(
          color: Colors.white,
          onPressed: widget.listTileOnPress,
          padding: EdgeInsets.all(
            orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 10 / 667
                : MediaQuery.of(context).size.width * 10 / 375,
          ),
          child: GeneralTextDisplay(
              widget.titleInputText,
              widget.titleColor,
              widget.titleNoOfTextLine,
              widget.titleTextFontSize,
              widget.titleTextFontWeight,
              widget.titleTextSemanticLabel)),
      subtitle: GeneralTextDisplay(
          widget.subtitleInputText,
          widget.subtitleColor,
          widget.subtitleNoOfTextLine,
          widget.subtitleTextFontSize,
          widget.subtitleTextFontWeight,
          widget.subtitleTextSemanticLabel),
      trailing: GeneralTextDisplay(
          widget.trailingInputText,
          widget.trailingColor,
          widget.trailingNoOfTextLine,
          widget.trailingTextFontSize,
          widget.trailingTextFontWeight,
          widget.trailingTextSemanticLabel),
    ));
  }
}

/*bool loaded = false;

@override
void initState() {
  super.initState();
  widget.listTileAssetImage.image
      .resolve(ImageConfiguration())
      .addListener((i, b) {
    if (mounted) {
      setState(() => loaded = true);
    }
  });
  imagePlaceholder() {
      return Placeholder(
        key: widget.listTilePlaceholderKey,
        fallbackHeight: orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width * widget.listTileImageHeight / 667
            : MediaQuery.of(context).size.height * widget.listTileImageWidth / 375,
        fallbackWidth: orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * widget.listTileImageHeight / 667
            : MediaQuery.of(context).size.width * widget.listTileImageWidth / 375,
      );
    }
}*/
