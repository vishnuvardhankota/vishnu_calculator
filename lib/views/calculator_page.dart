import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:vishnu_calculator/service/calculation_service.dart';
import '../widgets/constants.dart';

class CalCulatorPage extends StatefulWidget {
  const CalCulatorPage({super.key});

  @override
  State<CalCulatorPage> createState() => _CalCulatorPageState();
}

class _CalCulatorPageState extends State<CalCulatorPage> {
  bool isDarkTheme = false;
  String equation = "0";
  String result = "0";
  String expressionValue = "0";
  List<String> calculationsymbols = ["÷", "x", "-", "+", "."];
  List<String> calculations = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    calculations = await CalculationService().getCalculations();
  }

  // calculator display
  Widget calcDisplay() {
    return Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (equation != "0")
              Container(
                alignment: Alignment.topRight,
                child: AutoSizeText(
                  equation,
                  style: TextStyle(
                    fontSize: 40,
                    color: isDarkTheme ? Colors.white : Colors.black54,
                  ),
                  minFontSize: 20,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
              ),
            Container(
              alignment: Alignment.topRight,
              child: AutoSizeText(
                result,
                style: TextStyle(
                  fontSize: 50,
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
                minFontSize: 25,
                maxLines: 20,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // calculator keypad with all buttons
  Widget calcKeypad() {
    return SizedBox(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height / 2
          : MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  'AC',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
              calcbutton(
                  '⌫',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
              calcbutton(
                  '',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
              calcbutton(
                  '÷',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '7',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '8',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '9',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  'x',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '4',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '5',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '6',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '-',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '1',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '2',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '3',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '+',
                  isDarkTheme
                      ? darkThemealculationButtonsBackgroundColor
                      : lightThemealculationButtonsBackgroundColor,
                  isDarkTheme
                      ? darkThemealculationButtonsColor
                      : lightThemecalculationButtonsColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '00',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '0',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '.',
                  isDarkTheme
                      ? darkThemeKeypadBackgroundColor
                      : lightThemeKeypadBackgroundColor,
                  isDarkTheme
                      ? darkThemeKeypadColor
                      : lightThemeKeypadtextColor),
              calcbutton(
                  '=',
                  isDarkTheme
                      ? darkThemeSubmitButtonBackgroundColor
                      : lightThemeSubmitButtonBackgroundColor,
                  lightThemeSubmitButtonColor),
            ],
          ),
        ],
      ),
    );
  }

  // store calculations through service
  storeData(String calculation) {
    if (calculations.length == 5) {
      calculations.removeAt(4);
    }
    calculations.insert(0, calculation);
    CalculationService().storeCalculation(calculations);
  }

  // onbutton clicked function
  onPressed(String buttonText) {
    setState(() {
      if (result == "0" &&
          (buttonText == "x" || buttonText == "÷" || buttonText == "+")) {
        return;
      } else if (result == "0" && buttonText == ".") {
        result = result + buttonText;
      } else if (result == "0" && buttonText == "-") {
        result = "${buttonText}0";
      } else if (result == "-0") {
        result = result.replaceAll("0", buttonText);
      } else if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        if (result.length == 1) {
          result = "0";
        } else if (result[0] == "-" && result.length == 2) {
          result = "0";
        } else {
          result = result.substring(0, result.length - 1);
        }
      } else if (buttonText == "=") {
        if (calculationsymbols.contains(result[result.length - 1])) {
          result = result.substring(0, result.length - 1);
        }
        expressionValue = result;
        expressionValue = expressionValue.replaceAll("÷", "/");
        expressionValue = expressionValue.replaceAll("x", "*");
        try {
          Parser p = Parser();
          Expression expression = p.parse(expressionValue);
          ContextModel contextModel = ContextModel();
          equation = result + buttonText;
          result =
              "${BigInt.from(expression.evaluate(EvaluationType.VECTOR, contextModel))}";
          storeData(equation + result);
        } catch (err) {
          result = err.toString();
        }
      } else {
        if (result == "0") {
          result = buttonText;
        } else if (calculationsymbols.contains(result[result.length - 1]) &&
            calculationsymbols.contains(buttonText)) {
          return;
        } else {
          result = result + buttonText;
        }
      }
    });
  }

  // button style
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return TextButton(
      onPressed: () {
        onPressed(btntxt);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 22,
          color: txtcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: isDarkTheme ? Colors.grey[900] : null,
          title: const Text("Calculator"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      barrierColor:
                          isDarkTheme ? Colors.white.withOpacity(0.1) : null,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              isDarkTheme ? Colors.black : Colors.white,
                          title: Text("History(last 5)",
                              style: TextStyle(
                                  color:
                                      isDarkTheme ? Colors.white : Colors.black,
                                  fontSize: 18)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: calculations
                                .map(
                                  (value) => Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        value,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            color: isDarkTheme
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 18),
                                      )),
                                )
                                .toList(),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"))
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.history)),
            IconButton(
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
                icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // Calculator display
                    calcDisplay(),
                    Divider(
                      color: isDarkTheme ? Colors.white : Colors.black,
                    ),
                    // Calculator keypad
                    calcKeypad()
                  ],
                )
              : Row(
                  children: <Widget>[
                    // Calculator display
                    calcDisplay(),
                    VerticalDivider(
                      color: isDarkTheme ? Colors.white : Colors.black,
                    ),
                    // Calculator keypad
                    calcKeypad()
                  ],
                ),
        ));
  }
}
