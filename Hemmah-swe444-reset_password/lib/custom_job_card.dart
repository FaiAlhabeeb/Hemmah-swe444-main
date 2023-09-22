import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// class Job {
//   final String id;
//   final String position;
//   final String workplaceType;
//   final String jobType;
//   final String location;
//   final String companyId;
//   Job({
//     required this.id,
//     required this.position,
//     required this.workplaceType,
//     required this.jobType,
//     required this.location,
//     required this.companyId,
//
//   });
// }

class CustomJobCard extends StatelessWidget {
  final void Function() onDelete;
  final String position;
  final String workplaceType;
  final String jobType;
  final String location;
  final String description;

  CustomJobCard({
    /*required this.job,*/
    required this.onDelete,
    required this.position,
    required this.workplaceType,
    required this.jobType,
    required this.location,
    required this.description,
  });

  get jobData => null;

  delete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this job?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: onDelete,
              // () {
              // onDelete; // Call the onDelete callback with the job parameter
              // Navigator.of(context).pop(); // Close the dialog
              // },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,
        // dragDismissible: true,
        // dismissible: DismissiblePane(onDismissed: () {
        //   delete(context);
        // }),
        children: [
          SlidableAction(
            onPressed: (context) {
              delete(context);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        elevation: 3,
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // job.position,
                position,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Playfair Displa',
                  fontWeight: FontWeight.w600,
                  height: 1.88,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 6),
              Container(
                color: Colors.grey[300], // Grey line
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      jobType,
                      style: const TextStyle(
                        color: Color(0xFF585858),
                        fontSize: 20,
                        fontFamily: 'Playfair Displa',
                        fontWeight: FontWeight.w500,
                        height: 1.88,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      workplaceType,
                      style: const TextStyle(
                        color: Color(0xFF585858),
                        fontSize: 20,
                        fontFamily: 'Playfair Displa',
                        fontWeight: FontWeight.w500,
                        height: 1.88,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Color.fromARGB(255, 62, 6, 245),
                  fontSize: 20,
                  fontFamily: 'Playfair Displa',
                  fontWeight: FontWeight.w500,
                  height: 2.14,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
