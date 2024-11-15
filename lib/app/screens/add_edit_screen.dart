import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask1/app/bloc/offering_bloc.dart';
import '../model/offering_model.dart';

class AddEditOfferingScreen extends StatefulWidget {
  final OfferingModel? offeringModel;
  final int? index; // Add index parameter

  const AddEditOfferingScreen({super.key, this.offeringModel, this.index});

  @override
  _AddEditOfferingScreenState createState() => _AddEditOfferingScreenState();
}

class _AddEditOfferingScreenState extends State<AddEditOfferingScreen> {
  final _formKey = GlobalKey<FormState>();

  // Initialize fields for form data
  late String practitionerName;
  late String title;
  late String description;
  late String category;
  late String duration;
  late String type;
  late int price;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with offering data if editing
    final offering = widget.offeringModel;
    context.read<OfferingBloc>().nameController.text =
        offering?.practitionerName ?? '';
    context.read<OfferingBloc>().titleController.text = offering?.title ?? '';
    context.read<OfferingBloc>().desController.text =
        offering?.description ?? '';
    context.read<OfferingBloc>().priceController.text =
        offering?.price.toString() ?? '';

    category = offering?.category ?? 'Mental';
    duration = offering?.duration ?? '';
    type = offering?.type ?? 'In-Person';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.offeringModel == null ? 'Add Offering' : 'Update Offering'),
      ),
      body: BlocConsumer<OfferingBloc, OfferingState>(
        listener: (context, state) {
          if (state.status == OfferingStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(widget.offeringModel == null
                    ? "Offering added successfully!"
                    : "Offering updated successfully!"),
              ),
            );
            context.read<OfferingBloc>().titleController.clear();
            context.read<OfferingBloc>().nameController.clear();
            context.read<OfferingBloc>().desController.clear();
            context.read<OfferingBloc>().priceController.clear();
            Navigator.pop(context);
          } else if (state.status == OfferingStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    label: 'Practitioner Name',
                    controller: context.read<OfferingBloc>().nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                    onSaved: (value) => practitionerName = value!,
                  ),
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    label: 'Title',
                    controller: context.read<OfferingBloc>().titleController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a title' : null,
                    onSaved: (value) => title = value!,
                  ),
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    label: 'Description',
                    controller: context.read<OfferingBloc>().desController,
                    maxLines: 3,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a description' : null,
                    onSaved: (value) => description = value!,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: category,
                    decoration: _inputDecoration('Category'),
                    items: ['Spiritual', 'Mental', 'Emotional']
                        .map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => category = value!),
                  ),
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    label: 'Duration',
                    initialValue: duration,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a duration' : null,
                    onSaved: (value) => duration = value!,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Type:', style: theme.textTheme.bodyLarge),
                      const SizedBox(width: 10),
                      _buildRadioButton('In-Person'),
                      _buildRadioButton('Online'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    label: 'Price',
                    controller: context.read<OfferingBloc>().priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) =>
                        value == null || int.tryParse(value) == null
                            ? 'Please enter a valid price'
                            : null,
                    onSaved: (value) => price = int.parse(value!),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label:
                        Text(widget.offeringModel == null ? 'Save' : 'Update'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _onSubmit,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    TextEditingController? controller,
    String? initialValue,
    int maxLines = 1,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: _inputDecoration(label),
      validator: validator,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: type,
          onChanged: (val) => setState(() => type = val!),
        ),
        Text(value),
      ],
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final offering = OfferingModel(
        practitionerName: practitionerName,
        title: title,
        description: description,
        category: category,
        duration: duration,
        type: type,
        price: price,
      );

      if (widget.offeringModel == null) {
        context.read<OfferingBloc>().add(
              OfferingEvent.addOffering(offeringModelAdd: offering),
            );
      } else {
        context.read<OfferingBloc>().add(
              OfferingEvent.updateOffering(
                offeringModelUpdate: offering,
                indexUpdate: widget.index,
              ),
            );
      }
    }
  }
}
