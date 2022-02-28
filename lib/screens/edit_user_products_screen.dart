import 'package:flutter/material.dart';

class EditUserProductsScreen extends StatefulWidget {
  static const route = '-eups';
  const EditUserProductsScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProductsScreen> createState() => _EditUserProductsScreenState();
}

class _EditUserProductsScreenState extends State<EditUserProductsScreen> {
  final _titleFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _forkey = GlobalKey<FormState>();

  @override
  void initState() {
    _imageFocusNode.addListener(() {
      _updateImage();
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _imageFocusNode.dispose();
    _imageUrlController.removeListener(() {
      _updateImage();
    });
    super.dispose();
  }

  void _updateImage() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Products"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _forkey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                  textInputAction: TextInputAction.next,
                  focusNode: _titleFocusNode,
                  validator: (value) {},
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Price",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_titleFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Description",
                  ),
                  maxLines: 4,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? Text('Image url')
                          : Image.network(_imageUrlController.text),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _imageUrlController,
                        decoration: InputDecoration(
                          labelText: 'image url',
                        ),
                        focusNode: _imageFocusNode,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
