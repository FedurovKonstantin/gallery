import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class AddDataTag extends StatefulWidget {
  final String title;
  final bool isNew;
  final TextEditingController controller;
  final Function addFunc;
  final String id;
  final Function removeFunc;
  AddDataTag({
    this.removeFunc,
    this.addFunc,
    this.id,
    this.title,
    this.isNew,
    this.controller,
  });

  @override
  _AddDataTagState createState() => _AddDataTagState();
}

class _AddDataTagState extends State<AddDataTag> {
  bool showIcon = true;
  String text = "";
  FocusNode _focus = new FocusNode();
  @override
  void initState() {
    _focus.addListener(() {
      if (_focus.hasFocus) {
        setState(() {
          showIcon = false;
        });
      } else {
        setState(() {
          showIcon = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isNew
        ? Container(
            height: Helpers.responsiveHeight(25, context),
            constraints: BoxConstraints(
              minWidth: Helpers.responsiveWidth(80, context),
              maxWidth: Helpers.responsiveWidth(167, context),
            ),
            child: IntrinsicWidth(
              child: TextFormField(
                focusNode: _focus,
                minLines: 1,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: Helpers.responsiveHeight(12, context),
                    ),
                controller: widget.controller,
                cursorColor: Colors.black,
                cursorWidth: 1,
                onFieldSubmitted: (value) {
                  if (value.trim().length != 0) {
                    widget.addFunc();
                  }
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    top: Helpers.responsiveHeight(5, context),
                    bottom: Helpers.responsiveHeight(7, context),
                    right: Helpers.responsiveWidth(10, context),
                    left: Helpers.responsiveWidth(10, context),
                  ),
                  labelText: 'New',
                  labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: Helpers.responsiveHeight(12, context),
                        color: grey,
                      ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIconConstraints: BoxConstraints(
                      // maxWidth: 15,
                      // minWidth: 15,
                      ),
                  prefixIcon: showIcon
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: Helpers.responsiveWidth(9, context),
                            right: Helpers.responsiveWidth(7, context),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: Helpers.responsiveHeight(20, context),
                          ),
                        )
                      : null,
                  filled: true,
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffC4C4C4),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: purple,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(
              horizontal: Helpers.responsiveWidth(10, context),
            ),
            height: Helpers.responsiveHeight(25, context),
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(
                Helpers.responsiveHeight(16, context),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 167,
                  ),
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                          fontSize: Helpers.responsiveHeight(12, context),
                        ),
                  ),
                ),
                SizedBox(
                  width: Helpers.responsiveWidth(5, context),
                ),
                GestureDetector(
                  onTap: () {
                    widget.removeFunc(widget.id);
                  },
                  child: Icon(
                    Icons.close,
                    size: Helpers.responsiveHeight(20, context),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
  }
}
