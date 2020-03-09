import 'package:flutter/material.dart';
import './notes_list.dart';

class NotesListState extends State<NotesList> {
  List<String> _notesItems = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List'),
      ),
      body: _buildNotesList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddNoteScreen,
        tooltip: 'Add Note',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _pushAddNoteScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add a new note')
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addNotesItem(val);
                Navigator.pop(context);
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to note...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
          );
        }
      )
    );
  }

  //This function is called everytime floating button is pressed
  void _addNotesItem(String note) {
    //Adding the setState() line tells app that state has changed,
    //triggering a re-render of the list
    if (note.length > 0) {
      setState(() => _notesItems.add(note));
    }
  }

  Widget _buildNotesList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        //itemBuilder will be called to fill up the notesList with note items
        if (index < _notesItems.length) {
          return _buildNoteItem(_notesItems[index], index);
        }
        return null;
      },
    );
  }

  Widget _buildNoteItem(String noteText, int index) {
    return new ListTile(
      title: new Text(noteText),
      onTap: () => _promptRemoveNoteItem(index),
    );
  }

  void _removeNoteItem(int index) {
    setState(() => _notesItems.removeAt(index));
  }

  void _promptRemoveNoteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Container(
            child: Text('Mark "${_notesItems[index]}" as done?'),
          ),
          actions: <Widget> [
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            new FlatButton(
              child: new Text('MARK AS DONE'),
              onPressed: () {
                _removeNoteItem(index);
                Navigator.of(context).pop();
              }
            ),
          ]
        );
      }
    );
  }
}