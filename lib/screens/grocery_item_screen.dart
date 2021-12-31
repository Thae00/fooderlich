import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/grocery_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating; //the user is creating or editing an item.

  GroceryItemScreen({
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // Add grocery item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  // Add initState()
  @override
  void initState() {
    super.initState();

    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  //Add dispose()
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //Add callback handler
            },
            icon: Icon(Icons.check),
          ),
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Add name TextField
            buildNameField(),
            // Add Importance selection
            buildImportanceField(),
            // Add date picker
            buildDateField(context),
            // Add time picker
            buildTimeField(context),
            SizedBox(
              height: 10,
            ),
            // Add color picker
            buildColorPicker(context),
            // Add slider
            SizedBox(
              height: 10,
            ),
            buildQuantityField(),
            //  Add Grocery Tile
            GroceryTitle(
              item: GroceryItem(
                id: 'previewMode',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Add buildNameField()
  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: "E.g. Apples, Banana, 1 Bag of salt",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
      ],
    );
  }

  //  Add buildImportanceField()
  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28),
        ),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              label: Text(
                'low',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              selected: _importance == Importance.low,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.low;
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'medium',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.medium,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.medium;
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.high,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.high;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  // ADD buildDateField()
  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              child: Text('Select'),
            ),
          ],
        ),
        Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}'),
      ],
    );
  }

  //  Add buildTimeField()
  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28),
            ),
            TextButton(
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
              child: Text('Select'),
            ),
          ],
        ),
        Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

  //  Add buildColorPicker()
  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    onColorChanged: (color) {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Select'),
        ),
      ],
    );
  }

  //  Add buildQuantityField()
  Widget buildQuantityField() {
    // 1
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            SizedBox(width: 16.0),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        // 3
        Slider(
          // 4
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          // 5
          value: _currentSliderValue.toDouble(),
          // 6
          min: 0.0,
          max: 100.0,
          // 7
          divisions: 100,
          // 8
          label: _currentSliderValue.toInt().toString(),
          // 9
          onChanged: (double value) {
            setState(
              () {
                _currentSliderValue = value.toInt();
              },
            );
          },
        ),
      ],
    );
  }
}
