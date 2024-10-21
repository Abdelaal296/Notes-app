import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import 'edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title=title ?? widget.note.title;
              widget.note.subtitle=subtitle ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetcHAllNotes();
              Navigator.pop(context);
            },
          
          ),
          const SizedBox(
            height: 50,
          ),
           CustomTextField(
            hintText: widget.note.title,
            onChanged: (value) {
              title=value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
           CustomTextField(
            hintText: widget.note.subtitle,
            maxLines: 5,
            onChanged: (value) {
              subtitle=value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
           EditNoteColorsList(note:widget.note,),
        ],
      ),
    );
  }
}


