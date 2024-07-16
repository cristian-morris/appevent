import 'package:digitalevent/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showFilters = false;
  String? selectedCategory;
  DateTime? selectedDate;
  String? selectedLocation;
  List<Evento> eventos = [];
  List<Evento> filteredEventos = [];

  final List<String> categories = [
    'Conferencia',
    'Feria',
    'Taller',
    'Tecnología',
    'Literatura',
    'Música'
  ];

  @override
  void initState() {
    super.initState();
    fetchEvento().then((data) {
      setState(() {
        eventos = data;
        filteredEventos = data;
      });
    });
  }

  void toggleFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filtrar eventos',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
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
                            setModalState(() {
                              selectedCategory = selected ? category : null;
                            });
                            setState(() {
                              applyFilters();
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
                      children: eventos.map((evento) {
                        final dateString = formatDate(evento.fechaInicio);
                        return ChoiceChip(
                          label: Text(dateString),
                          selected: selectedDate?.toString().split(' ')[0] ==
                              dateString,
                          selectedColor: Colors.purpleAccent,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedDate =
                                  selected ? evento.fechaInicio : null;
                            });
                            setState(() {
                              applyFilters();
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
                      children: eventos.map((evento) {
                        return ChoiceChip(
                          label: Text(evento.ubicacion),
                          selected: selectedLocation == evento.ubicacion,
                          selectedColor: Colors.purpleAccent,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedLocation =
                                  selected ? evento.ubicacion : null;
                            });
                            setState(() {
                              applyFilters();
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Aplicar filtros'),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void applyFilters() {
    setState(() {
      filteredEventos = eventos.where((evento) {
        final matchesCategory = selectedCategory == null ||
            evento.categoriaNombre == selectedCategory;
        final matchesDate = selectedDate == null ||
            evento.fechaInicio.isAtSameMomentAs(selectedDate!);
        final matchesLocation =
            selectedLocation == null || evento.ubicacion == selectedLocation;
        return matchesCategory && matchesDate && matchesLocation;
      }).toList();
    });
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Widget buildEventCard(Evento evento) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Color.fromRGBO(186, 104, 200, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              evento.imagenUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              evento.nombre,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            if (evento.categoriaNombre == 'Gratis')
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Gratis',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (evento.tipoEvento == 'Privado' &&
                evento.categoriaNombre != 'Gratis')
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Privado',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 5),
            // Text('Categoría: ${evento.categoriaNombre}'),
            Text('Fecha: ${formatDate(evento.fechaInicio)}'),
            Text('Ubicación: ${evento.ubicacion}'),
          ],
        ),
      ),
    );
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
                  contentPadding: EdgeInsets.all(0),
                ),
                onChanged: (query) {
                  setState(() {
                    filteredEventos = eventos.where((evento) {
                      return evento.nombre
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList();
                  });
                },
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
                          child: Text('Filtrar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredEventos.length,
                itemBuilder: (context, index) {
                  return buildEventCard(filteredEventos[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
