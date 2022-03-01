import 'package:bikel_bela/models/product.dart';
import 'package:bikel_bela/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  var _editedProduct = Product(
    id: '',
    title: '',
    description: '',
    price: 0.0,
    imageUrl: '',
  );

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

  void _saveProduct() {
    _forkey.currentState!.save();
    Provider.of<Products>(
      context,
      listen: false,
    ).addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User Products"),
        actions: [
          IconButton(
            onPressed: () {
              _saveProduct();
            },
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
                  decoration: const InputDecoration(
                    labelText: "Title",
                  ),
                  textInputAction: TextInputAction.next,
                  focusNode: _titleFocusNode,
                  validator: (value) {},
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: '',
                      title: value!,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Price",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_titleFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: '',
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value!),
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Description",
                  ),
                  maxLines: 4,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: '',
                      title: _editedProduct.title,
                      description: value!,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                const SizedBox(height: 12),
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
                          ? const Text('Image url')
                          : Image.network(_imageUrlController.text),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _imageUrlController,
                        decoration: const InputDecoration(
                          labelText: 'image url',
                        ),
                        focusNode: _imageFocusNode,
                        textInputAction: TextInputAction.done,
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: '',
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: value!,
                          );
                        },
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
