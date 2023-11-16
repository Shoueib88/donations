import 'package:donations/view/feedback/controller/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(FeedbackDialog());

class FeedbackDialog extends StatelessWidget {
  FeedbackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedbackController());
    return AlertDialog(
      content: Form(
          key: controller.formState,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.feedback,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Please Enter Your Feedback',
                  filled: true,
                ),
                maxLength: 500,
                maxLines: 5,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Not Valid ';
                  }
                  return null;
                },
              ))),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              if (controller.formState.currentState!.validate()) {
                String message;

                try {
                  controller.setData();

                  message = 'Feedback sent successfully';
                } catch (e) {
                  message = 'Error when sending feedback';
                }

                // Show a snackbar with the result
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                Navigator.pop(context);
              }
            },
            child: Text('Send'))
      ],
    );
  }
}
