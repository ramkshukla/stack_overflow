import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/brewary/controller/brewary_bloc.dart';
import 'package:stack_overflow/module/brewary/controller/brewary_state.dart';
import 'package:stack_overflow/module/brewary/controller/breway_event.dart';

class OrientView extends StatelessWidget {
  const OrientView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrewaryBloc(),
      //..add(GetOrientData()),
      child: const OrientUI(),
    );
  }
}

class OrientUI extends StatefulWidget {
  const OrientUI({super.key});

  @override
  State<OrientUI> createState() => _OrientUIState();
}

class _OrientUIState extends State<OrientUI> {
  final ScrollController scrollController = ScrollController();
  String selectedFromDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String selectedToDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        context.read<BrewaryBloc>().add(GetDateFilterData(
            fromDate: selectedFromDate, toDate: selectedToDate));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrewaryBloc, BrewaryState>(
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Orient"), centerTitle: true),
          body: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: DateTimeFormField(
                      decoration: const InputDecoration(labelText: 'From Date'),
                      onChanged: (DateTime? value) {
                        selectedFromDate =
                            DateFormat('dd-MMM-yyyy').format(value!);
                      },
                    ),
                  ),
                  Expanded(
                    child: DateTimeFormField(
                      decoration: const InputDecoration(labelText: 'To Date'),
                      onChanged: (DateTime? value) {
                        selectedToDate =
                            DateFormat('dd-MMM-yyyy').format(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<BrewaryBloc>().add(
                        GetDateFilterData(
                          fromDate: selectedFromDate,
                          toDate: selectedToDate,
                        ),
                      );
                },
                child: const Text("Submit"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.programAccountStatementDetails.length,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "ID: ${state.programAccountStatementDetails[index].transactionId}"),
                          Text(
                              "Type: ${state.programAccountStatementDetails[index].transactionType}"),
                          Text(
                              "Date: ${state.programAccountStatementDetails[index].transactionDate}"),
                          Text(
                              "InvoiceNo: ${state.programAccountStatementDetails[index].invoiceNo}"),
                          Text(
                              "BUName: ${state.programAccountStatementDetails[index].buName}"),
                        ],
                      ),
                    );
                  },
                ),
              ),
              state.filterDataLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox()
            ],
          ),
        );
      }),
    );
  }
}
