import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showFilters = false;
  String? selectedCategory;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  String? selectedLocation;
  String? selectedPriceRange;

  final List<String> categories = [
    'Cumpleaños',
    'Feria',
    'Curso',
    'Conferencia'
  ];
  final List<TimeOfDay> times = [
    TimeOfDay(hour: 12, minute: 0),
    TimeOfDay(hour: 17, minute: 0),
    TimeOfDay(hour: 19, minute: 0),
    TimeOfDay(hour: 21, minute: 0)
  ];
  final List<String> dates = ['2024-07-01', '2024-07-02', '2024-07-03'];
  final List<String> locations = [
    'Nueva York',
    'Los Ángeles',
    'Chicago',
    'Houston'
  ];
  final List<String> priceRanges = [
    'Gratis',
    '\$1-\$50',
    '\$51-\$100',
    'Más de \$100'
  ];

  void toggleFilters() {
    setState(() {
      showFilters = !showFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(0)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: toggleFilters,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: showFilters
                              ? Row(
                                  children: [
                                    Text('Filtrar'),
                                    SizedBox(width: 8),
                                    Icon(Icons.close),
                                  ],
                                )
                              : Text('Filtrar'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text('Botón 1'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text('Botón 2'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text('Botón 3'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (showFilters)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text('Categorías',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 8.0,
                        children: categories.map((category) {
                          return ChoiceChip(
                            label: Text(category),
                            selected: selectedCategory == category,
                            selectedColor: Colors.purpleAccent,
                            onSelected: (selected) {
                              setState(() {
                                selectedCategory = selected ? category : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text('Horas',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 8.0,
                        children: times.map((time) {
                          return ChoiceChip(
                            label: Text('${time.format(context)}'),
                            selected: selectedTime == time,
                            selectedColor: Colors.purpleAccent,
                            onSelected: (selected) {
                              setState(() {
                                selectedTime = selected ? time : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text('Fechas',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 8.0,
                        children: dates.map((date) {
                          return ChoiceChip(
                            label: Text(date),
                            selected:
                                selectedDate?.toString().split(' ')[0] == date,
                            selectedColor: Colors.purpleAccent,
                            onSelected: (selected) {
                              setState(() {
                                selectedDate =
                                    selected ? DateTime.parse(date) : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text('Ubicaciones',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 8.0,
                        children: locations.map((location) {
                          return ChoiceChip(
                            label: Text(location),
                            selected: selectedLocation == location,
                            selectedColor: Colors.purpleAccent,
                            onSelected: (selected) {
                              setState(() {
                                selectedLocation = selected ? location : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text('Rango de Precios',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 8.0,
                        children: priceRanges.map((priceRange) {
                          return ChoiceChip(
                            label: Text(priceRange),
                            selected: selectedPriceRange == priceRange,
                            selectedColor: Colors.purpleAccent,
                            onSelected: (selected) {
                              setState(() {
                                selectedPriceRange =
                                    selected ? priceRange : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
