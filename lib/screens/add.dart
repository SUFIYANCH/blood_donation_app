import 'package:blood_donation_app/colors/colors.dart';
import 'package:blood_donation_app/providers/provider.dart';
import 'package:blood_donation_app/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddUser extends ConsumerStatefulWidget {
  const AddUser({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddUserState();
}

class _AddUserState extends ConsumerState<AddUser> {
  final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(isEditProvider) ? "Update Donor" : 'Add Donors'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ref.watch(nameProvider),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Donor Name'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ref.watch(phoneProvider),
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Phone Number'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('select your blood group'),
                  ),
                  items: bloodGroups
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (val) {
                    ref.read(bloodgrpProvider.notifier).state = val;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    ref.watch(isEditProvider)
                        ? await Service().updateDonor(
                            ref.watch(nameProvider).text,
                            ref.watch(phoneProvider).text,
                            ref.watch(bloodgrpProvider).toString(),
                            ref.watch(idProvider).toString())
                        : await Service().addDonor(
                            ref.watch(nameProvider).text,
                            ref.watch(phoneProvider).text,
                            ref.watch(bloodgrpProvider).toString(),
                          );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  child: Text(
                    ref.watch(isEditProvider) ? 'Update' : 'Submit',
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
