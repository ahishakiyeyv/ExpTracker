import 'package:exptracker/screens/add_expense/blocs/get_categoriesbloc/get_categories_bloc.dart';
import 'package:exptracker/screens/add_expense/views/category_creation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add Expenses",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              TextFormField(
                controller: categoryController,
                readOnly: true,
                onTap: () {},
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      getCategoryCreation(context);
                    },
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                    builder: (context, state) {
                      if (state is GetCategoriesSuccess) {
                        return ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (context, int i) {
                            return Card(
                              child: ListTile(
                                  leading: Image.asset(
                                    'assets/${state.categories[i].icon}.png',
                                    scale: 2,
                                  ),
                                  title: Text('Food'),
                                  tileColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: dateController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      Duration(
                        days: 365,
                      ),
                    ),
                  );
                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yy').format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.clock,
                    size: 16,
                    color: Colors.grey,
                  ),
                  hintText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
