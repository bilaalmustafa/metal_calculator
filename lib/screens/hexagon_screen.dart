import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/hexagon_controller.dart';
import '../widgets/custom_textField_dropDown.dart';
import '../widgets/custom_text_field1.dart';
import '../widgets/custom_text_field2.dart';
import '../widgets/custom_toggle_button.dart';

class HexagonScreen extends StatefulWidget {
  const HexagonScreen({super.key});

  @override
  _MetalCalculatorScreenState createState() => _MetalCalculatorScreenState();
}

class _MetalCalculatorScreenState extends State<HexagonScreen> {
  late HexagonController hexagonController;

  double steel = 7.85; // Default for steel

  @override
  Widget build(BuildContext context) {
    hexagonController = Provider.of<HexagonController>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Metal Calculator")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/reactangle.png', // Replace with actual image
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),

              // Material Selector
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: hexagonController.selectedMaterial,
                      items: [
                        "Steel",
                        "Aluminum",
                        "Brass",
                        "Copper",
                        "Bronze",
                        "Zinc",
                        "Chromium",
                        "Lead",
                        "Iron",
                        "Gold",
                        "Magnesium",
                        "Nickel",
                        "Titanium",
                        "Tin",
                        "Teflon",
                        "Silver",
                        "Platinum",
                        "SS 304/310",
                        "SS 316/321",
                        "SS 410/430",
                        "Zirconium",
                        "Molybdenum"
                      ].map((String material) {
                        return DropdownMenuItem(
                          value: material,
                          child: Text(material),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            hexagonController.selectedMaterial = value!;
                            // Adjust density based on material
                            steel = {
                                  "Steel": 7.85,
                                  "Aluminum": 2.73,
                                  "Brass": 8.5,
                                  "Copper": 8.96,
                                  "Bronze": 8.7,
                                  "Zinc": 7.14,
                                  "Chromium": 7.19,
                                  "Lead": 11.34,
                                  "Iron": 7.87,
                                  "Gold": 19.32,
                                  "Magnesium": 1.74,
                                  "Nickel": 8.9,
                                  "Titanium": 4.5,
                                  "Tin": 7.3,
                                  "Teflon": 2.2,
                                  "Silver": 10.49,
                                  "Platinum": 21.45,
                                  "SS 304/310": 7.9,
                                  "SS 316/321": 8.0,
                                  "SS 410/430": 7.7,
                                  "Zirconium": 6.49,
                                  "Molybdenum": 10.2,
                                }[value] ??
                                0.0;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade400, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Add Metal",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                            child: customTextField2(
                                          'name',
                                          hexagonController.nameController,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text(
                                          "Density",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: customTextField1(
                                            'name',
                                            hexagonController.densityController,
                                            hexagonController
                                                .selectedUnitLength,
                                            (value) {
                                              hexagonController
                                                  .selectedUnitLength = value!;
                                            },
                                            ["mm"],
                                            "gr/cm",
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade200,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Center(child: Text("Save")),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),
              CustomToggleButton(
                options: const ["by Length", "by Weight"],
                onChanged: (int index) {
                  hexagonController.setSelectedIndex(index);
                },
                selectedIndex: hexagonController.selectedIndex,
              ),

              const SizedBox(height: 10),

              // Density Display
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Text(
                    "${steel.toStringAsFixed(2)} gr/cm³",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Input Fields
              Consumer<HexagonController>(
                builder: (context, controller, _) {
                  final isLengthWeight = controller.selectedIndex == 0;
                  return Column(
                    children: [
                      buildInputRow(
                        "Width (A):",
                        hexagonController.widthController,
                        hexagonController.selectedUnitWidth,
                        (value) {
                          hexagonController.selectedUnitWidth = value!;
                        },
                        ["mm", "cm", "in", "ft"],
                        "",
                      ),
                      isLengthWeight
                          ? buildInputRow(
                              "Length",
                              hexagonController.lengthController,
                              hexagonController.selectedUnitLength,
                              (value) {
                                hexagonController.selectedUnitLength = value!;
                              },
                              ["mm", "cm", "meter"],
                              "",
                            )
                          : buildInputRow(
                              "Width",
                              hexagonController.lengthController,
                              hexagonController.selectedUnitLength,
                              (value) {
                                hexagonController.selectedUnitLength = value!;
                              },
                              ["mm"],
                              "Kg",
                            ),
                      customTextField2(
                          "Pieces:", hexagonController.piecesController),

                      isLengthWeight
                          ? customTextField2(
                              "Kg Price:", hexagonController.priceController)
                          : SizedBox(),

                      const SizedBox(height: 10),

                      // Results Display
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Results",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),

              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    shape: CircleBorder(),
                    backgroundColor: Colors.green,
                    onPressed: () {
                      Share.share("text");
                    },
                    child: const Icon(Icons.share),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "CALCULATE",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  FloatingActionButton(
                    shape: CircleBorder(),
                    backgroundColor: Colors.green,
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: "text"),
                      );
                    },
                    child: const Icon(Icons.save),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
