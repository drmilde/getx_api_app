import 'package:flutter/material.dart';

class AdressEingabeScreen extends StatefulWidget {
  const AdressEingabeScreen({Key? key}) : super(key: key);

  @override
  AdressEingabeScreenState createState() {
    return AdressEingabeScreenState();
  }
}

class AdressEingabeScreenState extends State<AdressEingabeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  late TextFormField _field;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _field = TextFormField(
      controller: _controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _field,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${_controller.text}")),
                  );
                }
              },
              child: const Text('Suche'),
            ),
          ),
        ],
      ),
    );
  }
}
