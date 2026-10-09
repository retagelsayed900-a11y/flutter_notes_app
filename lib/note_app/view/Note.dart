import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/note_app/cubit/cubit/note_cubit.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _controller =
      TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Show Add or Update dialog
  Future<void> _showNoteDialog({
    required BuildContext context,
    int? index,
    String? initialText,
  }) async {
    final cubit = context.read<NoteCubit>();
    final formKey = GlobalKey<FormState>();

    _controller.text = initialText ?? '';

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            index == null ? 'Add Note' : 'Update Note',
          ),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: _controller,
              autofocus: true,
              maxLines: 4,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: 'Enter your note',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a note';
                }

                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                final text = _controller.text.trim();

                if (index == null) {
                  await cubit.addNote(text);
                } else {
                  await cubit.updateNote(index, text);
                }

                if (dialogContext.mounted) {
                  Navigator.pop(dialogContext);
                }

                _controller.clear();
              },
              child: Text(
                index == null ? 'Add' : 'Update',
              ),
            ),
          ],
        );
      },
    );

    _controller.clear();
  }

  // Confirm before deleting all notes
  Future<void> _confirmClearAll(
    BuildContext context,
  ) async {
    final cubit = context.read<NoteCubit>();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Clear All Notes'),
          content: const Text(
            'Are you sure you want to delete all notes?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('Delete All'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await cubit.clearAllNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Note App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => _confirmClearAll(context),
            child: const Text('Clear All'),
          ),
        ],
      ),

      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NoteErrorState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () {
                        context.read<NoteCubit>().getNotes();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is NoteEmptyState ||
              state is NoteInitial) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.note_alt_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'There are no notes yet',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text('Tap + to add your first note'),
                ],
              ),
            );
          }

          if (state is NoteSuccessState) {
            final notes = state.notes;

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: index.isEven
                      ? Colors.blue.shade50
                      : Colors.teal.shade50,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      notes[index],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      _showNoteDialog(
                        context: context,
                        index: index,
                        initialText: notes[index],
                      );
                    },
                    trailing: IconButton(
                      tooltip: 'Delete note',
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        context.read<NoteCubit>()
                            .deleteNote(index);
                      },
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNoteDialog(context: context);
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}



