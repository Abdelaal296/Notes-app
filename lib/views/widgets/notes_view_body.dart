import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

import 'custom_note_item.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30.0),
      child: Column(
        children: const [
          SizedBox(height: 40,),
          CustomAppBar(text: 'Notes',icon: Icons.search,),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}




