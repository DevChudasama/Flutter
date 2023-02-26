import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  AddUser(this.map);

  Map? map;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  void initState() {
    super.initState();
    _logoController.text =
        widget.map == null ? "" : widget.map!['Logo'].toString();
    _airlineNameController.text =
        widget.map == null ? "" : widget.map!['AirlineName'].toString();
    _durationHController.text =
        widget.map == null ? "" : widget.map!['Duration_H'].toString();
    _durationMController.text =
        widget.map == null ? "" : widget.map!['Duration_M'].toString();
    _priceController.text =
        widget.map == null ? "" : widget.map!['Price'].toString();
    _SpriceController.text =
        widget.map == null ? "" : widget.map!['S_Price'].toString();
  }

  final _logoController = TextEditingController();
  final _airlineNameController = TextEditingController();
  final _durationHController = TextEditingController();
  final _durationMController = TextEditingController();
  final _priceController = TextEditingController();
  final _SpriceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = widget.map == null ? "Add" : "Update";
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Flight Details'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _logoController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Enter Image url';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Company Logo",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _airlineNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Enter AirLine Name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "AirLine Name",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _durationHController,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Enter Duration';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Duration in Hour",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _durationMController,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Enter Duration';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Duration in Minute",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Enter Price';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Price",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _SpriceController,
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'Enter discount price';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Discount Price",
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        if (widget.map == null) {
                          addFlight().then(
                            (value) => Navigator.of(context).pop(),
                          );
                        } else {
                          updateFlight(widget.map!['id']).then(
                            (value) => Navigator.of(context).pop(),
                          );
                        }
                      }
                    });
                  },
                  child: Text('$name Flight Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addFlight() async {
    Map map = {};
    map['Logo'] = _logoController.text;
    map['AirlineName'] = _airlineNameController.text;
    map['Duration_H'] = _durationHController.text;
    map['Duration_M'] = _durationMController.text;
    map['Price'] = _priceController.text;
    map['S_Price'] = _SpriceController.text;

    var response1 = await http.post(
        Uri.parse('https://63f8d83e1dc21d5465c8c351.mockapi.io/Flightdetails'),
        body: map);
    print(response1.body);
  }

  Future<void> updateFlight(id) async {
    Map map = {};
    map['Logo'] = _logoController.text;
    map['AirlineName'] = _airlineNameController.text;
    map['Duration_H'] = _durationHController.text;
    map['Duration_M'] = _durationMController.text;
    map['Price'] = _priceController.text;
    map['S_Price'] = _SpriceController.text;

    var response1 = await http.put(
        Uri.parse(
            'https://63f8d83e1dc21d5465c8c351.mockapi.io/Flightdetails/$id'),
        body: map);
    print(response1.body);
  }
}
