// // ignore_for_file: unused_import, deprecated_member_use

// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// import '../models/item.dart';

// Future<void> generateAndPrintInvoice(
//     List<Item> cartItems, double totalPrice) async {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('Restaurant Invoice',
//                 style: const pw.TextStyle(fontSize: 24)),
//             pw.SizedBox(height: 20),
//             pw.Table.fromTextArray(
//               context: context,
//               data: <List<String>>[
//                 <String>['Item', 'Price'],
//                 ...cartItems.map((item) =>
//                     [item.name, '\$${item.price.toStringAsFixed(2)}']),
//               ],
//             ),
//             pw.Divider(),
//             pw.Container(
//               alignment: pw.Alignment.centerRight,
//               child: pw.Text('Total: \$${totalPrice.toStringAsFixed(2)}',
//                   style: const pw.TextStyle(fontSize: 18)),
//             ),
//           ],
//         );
//       },
//     ),
//   );

//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => pdf.save(),
//   );
// }

// // ignore_for_file: deprecated_member_use, use_build_context_synchronously

// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter/material.dart'; // Add this import for showDialog
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:file_picker/file_picker.dart';

// import '../models/item.dart';

// Future<pw.Font> loadFont(String path) async {
//   final fontData = await rootBundle.load(path);
//   return pw.Font.ttf(fontData);
// }

// Future<void> generateAndPrintInvoice(
//     List<Item> cartItems, double totalPrice, String tableNumber) async {
//   final pdf = pw.Document();

//   final robotoRegular = await loadFont('assets/fonts/Roboto-Regular.ttf');
//   final robotoBold = await loadFont('assets/fonts/Roboto-Bold.ttf');

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.center,
//           children: [
//             pw.Container(
//               child: pw.Text('Restaurant Invoice',
//                   textAlign: pw.TextAlign.center,
//                   style: pw.TextStyle(
//                     fontSize: 24,
//                     font: robotoBold,
//                   )),
//             ),
//             pw.SizedBox(height: 10),
//             pw.Text('Table Number: $tableNumber',
//                 style: pw.TextStyle(fontSize: 18, font: robotoRegular)),
//             pw.SizedBox(height: 20),
//             pw.Table.fromTextArray(
//               cellAlignment: pw.Alignment.center,
//               context: context,
//               data: <List<String>>[
//                 <String>['Item', 'Quantity', 'Price', 'Total Price'],
//                 ...cartItems.map((item) => [
//                       item.name,
//                       '${item.quantity}', // Assuming 'Item' has a quantity property
//                       '\$${item.price.toStringAsFixed(2)}',
//                       '\$${(item.price * item.quantity).toStringAsFixed(2)}'
//                     ]),
//               ],
//               cellStyle: pw.TextStyle(font: robotoRegular),
//               headerStyle: pw.TextStyle(font: robotoBold),
//             ),
//             pw.Divider(),
//             pw.Container(
//               alignment: pw.Alignment.center,
//               child: pw.Text('Total: \$${totalPrice.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontSize: 18, font: robotoBold)),
//             ),
//           ],
//         );
//       },
//     ),
//   );

//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/invoice.pdf");
//   await file.writeAsBytes(await pdf.save());

//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => pdf.save(),
//   );
// }

// Future<void> downloadInvoice(
//   BuildContext context,
//   List<Item> cartItems,
//   double totalPrice,
//   String tableNumber,
// ) async {
//   final pdf = pw.Document();

//   final robotoRegular = await loadFont('assets/fonts/Roboto-Regular.ttf');
//   final robotoBold = await loadFont('assets/fonts/Roboto-Bold.ttf');

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.center,
//           children: [
//             pw.Text('Restaurant Invoice',
//                 textAlign: pw.TextAlign.center,
//                 style: pw.TextStyle(fontSize: 24, font: robotoBold)),

//             pw.SizedBox(height: 20),
//             pw.Table.fromTextArray(
//               cellAlignment: pw.Alignment.center,
//               context: context,
//               data: <List<String>>[
//                 <String>['Item', 'Quantity', 'Price', 'Total Price'],
//                 ...cartItems.map((item) => [
//                       item.name,
//                       '${item.quantity}', // Assuming 'Item' has a quantity property
//                       '\$${item.price.toStringAsFixed(2)}',
//                       '\$${(item.price * item.quantity).toStringAsFixed(2)}'
//                     ]),
//               ],
//               cellStyle: pw.TextStyle(font: robotoRegular),
//               headerStyle: pw.TextStyle(font: robotoBold),
//             ),
//             // pw.Divider(),
//             pw.SizedBox(height: 20),
//             pw.Text('Table Number: $tableNumber',
//                 style: pw.TextStyle(fontSize: 18, font: robotoRegular)),
//             pw.SizedBox(height: 20),
//             pw.Container(
//               alignment: pw.Alignment.center,
//               child: pw.Text('Total cost: \$${totalPrice.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontSize: 18, font: robotoBold)),
//             ),
//           ],
//         );
//       },
//     ),
//   );

//   String? outputFile = await FilePicker.platform.saveFile(
//     dialogTitle: 'Save Invoice',
//     fileName: 'invoice.pdf',
//     type: FileType.custom,
//     allowedExtensions: ['pdf'],
//   );

//   if (outputFile != null) {
//     if (!outputFile.endsWith('.pdf')) {
//       outputFile += '.pdf';
//     }

//     try {
//       final file = File(outputFile);
//       await file.writeAsBytes(await pdf.save());
//     } catch (e) {
//       if (e is FileSystemException && e.osError?.errorCode == 32) {
//         await showDialog<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('File In Use'),
//               content: const Text(
//                   'The file is already open or in use by another process. Please close the file and try saving again.'),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         rethrow;
//       }
//     }
//   }
// }

// ignore_for_file: deprecated_member_use, use_build_context_synchronously, unused_import

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

import '../models/item.dart';
import '../models/settings.dart';

Future<pw.Font> loadFont(String path) async {
  final fontData = await rootBundle.load(path);
  return pw.Font.ttf(fontData);
}

Future<void> generateAndPrintInvoice(List<Item> cartItems, double totalPrice,
    String tableNumber, String restaurantName) async {
  final pdf = pw.Document();

  final robotoRegular = await loadFont('assets/fonts/Roboto-Regular.ttf');
  final robotoBold = await loadFont('assets/fonts/Roboto-Bold.ttf');

  final now = DateTime.now();
  final formattedDate = DateFormat('yyyy-MM-dd').format(now); // Format the date
  final formattedTime =
      DateFormat('hh:mm a').format(now); // Format the time in AM/PM

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              child: pw.Text(restaurantName,
                  style: pw.TextStyle(
                    fontSize: 24,
                    font: robotoBold,
                  )),
            ),
            pw.SizedBox(height: 10),
            pw.Text('Table Number: $tableNumber',
                style: pw.TextStyle(fontSize: 18, font: robotoRegular)),
            pw.Text('Date: $formattedDate',
                style: pw.TextStyle(fontSize: 14, font: robotoRegular)),
            pw.Text('Time: $formattedTime',
                style: pw.TextStyle(fontSize: 14, font: robotoRegular)),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              cellAlignment: pw.Alignment.center,
              context: context,
              data: <List<String>>[
                <String>['Item', 'Quantity', 'Price', 'Total Price'],
                ...cartItems.map((item) => [
                      item.name,
                      '${item.quantity}', // Assuming 'Item' has a quantity property
                      '\$${item.price.toStringAsFixed(2)}',
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}'
                    ]),
              ],
              cellStyle: pw.TextStyle(font: robotoRegular),
              headerStyle: pw.TextStyle(font: robotoBold),
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: pw.TextStyle(fontSize: 18, font: robotoBold)),
            ),
          ],
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/invoice.pdf");
  await file.writeAsBytes(await pdf.save());

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}

Future<void> downloadInvoice(
  BuildContext context,
  List<Item> cartItems,
  double totalPrice,
  String tableNumber,
  String restaurantName,
) async {
  final pdf = pw.Document();

  final robotoRegular = await loadFont('assets/fonts/Roboto-Regular.ttf');
  final robotoBold = await loadFont('assets/fonts/Roboto-Bold.ttf');

  final now = DateTime.now();
  final formattedDate = DateFormat('yyyy-MM-dd').format(now); // Format the date
  final formattedTime =
      DateFormat('hh:mm a').format(now); // Format the time in AM/PM

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(restaurantName,
                    style: pw.TextStyle(fontSize: 24, font: robotoBold))),
            pw.SizedBox(height: 20),
            pw.Text('Table Number: $tableNumber',
                style: pw.TextStyle(fontSize: 18, font: robotoRegular)),
            pw.Text('Date: $formattedDate',
                style: pw.TextStyle(fontSize: 14, font: robotoRegular)),
            pw.Text('Time: $formattedTime',
                style: pw.TextStyle(fontSize: 14, font: robotoRegular)),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              cellAlignment: pw.Alignment.center,
              context: context,
              data: <List<String>>[
                <String>['Item', 'Quantity', 'Price', 'Total Price'],
                ...cartItems.map((item) => [
                      item.name,
                      '${item.quantity}', // Assuming 'Item' has a quantity property
                      '\$${item.price.toStringAsFixed(2)}',
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}'
                    ]),
              ],
              cellStyle: pw.TextStyle(font: robotoRegular),
              headerStyle: pw.TextStyle(font: robotoBold),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Text('Total cost: \$${totalPrice.toStringAsFixed(2)}',
                  style: pw.TextStyle(fontSize: 18, font: robotoBold)),
            ),
          ],
        );
      },
    ),
  );

  String? outputFile = await FilePicker.platform.saveFile(
    dialogTitle: 'Save Invoice',
    fileName: 'invoice.pdf',
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (outputFile != null) {
    if (!outputFile.endsWith('.pdf')) {
      outputFile += '.pdf';
    }

    try {
      final file = File(outputFile);
      await file.writeAsBytes(await pdf.save());
    } catch (e) {
      if (e is FileSystemException && e.osError?.errorCode == 32) {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('File In Use'),
              content: const Text(
                  'The file is already open or in use by another process. Please close the file and try saving again.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        rethrow;
      }
    }
  }
}
