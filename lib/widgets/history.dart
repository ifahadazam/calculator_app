import 'package:calculator/models/cal_provider.dart';
import 'package:calculator/widgets/confim_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
//Delete Single Card Confirmation
  deleteConfirmation() {
    showDialog(
        context: context,
        builder: (ctx) {
          return ConfirmDialog(onYes: () {
            context.read<CalProvider>().clearHistory();
            Navigator.of(context).pop();
          }, onNo: () {
            Navigator.of(context).pop();
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalProvider>(
      builder: (context, value, child) {
        return SafeArea(
            child: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'History',
                    style: GoogleFonts.merriweather(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff306688)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    value.ansList.isEmpty
                        ? const Text('')
                        : ElevatedButton(
                            onPressed: () {
                              deleteConfirmation();
                            },
                            child: Text(
                              'Clear History',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.withOpacity(0.9),
                              //     backgroundColor:
                              //         MaterialStatePropertyAll(Colors.blue[300])),
                            ))
                  ],
                ),
              ),
              value.ansList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Calculations Yet',
                          style:
                              TextStyle(color: Color(0xff306688), fontSize: 21),
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: value.queList.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff306688)
                                        .withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(15)),
                                child: ListTile(
                                  trailing: const Icon(
                                    Icons.copy,
                                    color: Colors.white,
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      value.queList[index],
                                      style: GoogleFonts.sansita(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      value.ansList[index],
                                      style: GoogleFonts.sansita(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ));
      },
    );
  }
}
