import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/offering_bloc.dart';
import '../model/offering_model.dart';
import 'add_edit_screen.dart';

class OfferingsListScreen extends StatefulWidget {
  const OfferingsListScreen({super.key});

  @override
  State<OfferingsListScreen> createState() => _OfferingsListScreenState();
}

class _OfferingsListScreenState extends State<OfferingsListScreen> {
  List<OfferingModel> offeringModel = []; // Initial empty list of offerings

  Future<void> _addOffering() async {
    final newOffering = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEditOfferingScreen()),
    );

    if (newOffering != null) {
      // Trigger Bloc event to add offering
      context.read<OfferingBloc>().add(
            OfferingEvent.addOffering(offeringModelAdd: newOffering),
          );
    }
  }

  @override
  void initState() {
    context.read<OfferingBloc>().add(const OfferingEvent.getOffering());
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offerings List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<OfferingBloc, OfferingState>(
          listener: (context, state) {
            if (state.status == OfferingStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error ?? 'Unknown error')),
              );
            } else if (state.status == OfferingStatus.updateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Offering updated successfully')),
              );
            }
          },
          builder: (context, state) {
            // Handle loading state
            if (state.status == OfferingStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Handle success state
            if (state.status == OfferingStatus.success) {
              offeringModel = state.offeringList;
            }
            return offeringModel.isEmpty
                ? const Center(
                    child: Text(
                      'No offerings found. Add some to get started!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: offeringModel.length,
                    itemBuilder: (context, index) {
                      final offering = offeringModel[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12.0),
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              offering.title?[0].toUpperCase() ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            offering.title ?? "No Title",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                'Practitioner: ${offering.practitionerName ?? "Unknown"}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Type: ${offering.type ?? "N/A"}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () async {
                                  final updatedOffering = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddEditOfferingScreen(
                                        offeringModel: offering,
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  context.read<OfferingBloc>().add(
                                      OfferingEvent.removeOffering(
                                          index: index));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addOffering,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          "Add Offering",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
