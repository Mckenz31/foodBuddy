import 'package:flutter/material.dart';
import '../models/food_items.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddIngredient extends StatefulWidget {
  const AddIngredient({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddIngredient();
  }
}

class _AddIngredient extends State<AddIngredient> {
  final apiUrl = "http://127.0.0.1:8000/api/products";
  final _productInput = TextEditingController();
  final _quantityInput = TextEditingController();
  DateTime? _expiredDate;
  final _categoryVal = Category.fruits;

  final yourSnackBarSuccess =
      const SnackBar(content: Text('Post created sucessfully.'));
  final yourSnackBarFailure =
      const SnackBar(content: Text('Post creation failed.'));

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": _productInput.text,
          "quantity": _quantityInput.text,
          "expiration_date": _expiredDate!.toIso8601String(),
          "category": _categoryVal.name
        }));
    print(response.body);

    if (mounted) {
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(yourSnackBarSuccess);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(yourSnackBarFailure);
      }
    }
  }

  void _expiryDate() async {
    final current = DateTime.now();
    final expire = DateTime(current.year + 5, current.month, current.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: current,
        lastDate: expire);
    setState(() {
      _expiredDate = pickedDate;
    });
  }

  void _onSubmit() {
    final doubleAmount = double.tryParse(_quantityInput.text);
    if (_productInput.text.trim().isEmpty ||
        doubleAmount == null ||
        _expiredDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid information'),
                content: const Text(
                    'Kindly enter a valid name, quantity, purchase date, and expiration date'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Close'))
                ],
              ));
      return;
    } else {
      // sendPostRequest();
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _productInput.dispose();
    _quantityInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/add_ingredient.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 120, 15, 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _productInput,
                    maxLength: 50,
                    decoration: const InputDecoration(label: Text('Name')),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _quantityInput,
                    maxLength: 5,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(label: Text('Quantity')),
                  ),
                ),
                // Expanded(
                //   child: TextField(
                //     controller: _quantityInput,
                //     keyboardType: const TextInputType.numberWithOptions(),
                //     decoration: const InputDecoration(
                //       label: Text('Quantity'),
                //       prefix: Text('\$ '),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_expiredDate == null
                          ? 'Expiration Date'
                          : formatter.format(_expiredDate!)),
                      IconButton(
                          onPressed: _expiryDate,
                          icon: const Icon(Icons.calendar_month)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _onSubmit();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
