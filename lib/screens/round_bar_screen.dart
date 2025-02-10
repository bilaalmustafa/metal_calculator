import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/round_bar_controller.dart';
import '../widgets/add_item_dialog_box.dart';
import '../widgets/back_icon_container.dart';
import '../widgets/custom_calculate_row.dart';
import '../widgets/custom_text_field1.dart';
import '../widgets/custom_text_field2.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/image_container_widget.dart';

class RoundBarScreen extends StatefulWidget {
  const RoundBarScreen({super.key});

  @override
  State<RoundBarScreen> createState() => _RoundBarScreenState();
}

class _RoundBarScreenState extends State<RoundBarScreen> {
  late RoundBarController roundBarController;
  double steel = 7.85; // Default for steel

  @override
  Widget build(BuildContext context) {
    roundBarController = Provider.of<RoundBarController>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        leading: BackIcon(),
        title: const Text("Round Bar Calculator"),
        backgroundColor: const Color(0xFFF2F5F9),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ImageContainer(image: 'assets/icons/round_bar.png'),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.45,
                                height: size.height * 0.08,
                                child: DropdownButtonFormField<String>(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  value: roundBarController.selectedMaterial,
                                  items: roundBarController.items
                                      .map((String material) {
                                    return DropdownMenuItem(
                                      value: material,
                                      child: Text(material),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        roundBarController.selectedMaterial =
                                            value!;
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
                              SizedBox(width: 10),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AddMetalDialog(
                                        nameController:
                                            roundBarController.nameController,
                                        densityController: roundBarController
                                            .densityController,
                                        selectedUnitLength: roundBarController
                                            .selectedUnitLength,
                                        onUnitChanged: (value) {
                                          roundBarController
                                              .selectedUnitLength = value!;
                                        },
                                      ),
                                    );
                                  },
                                  child: Image.asset('assets/images/icon.png')),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                            child: CustomToggleButton(
                              options: const ["by Length", "by Weight"],
                              onChanged: (int index) {
                                roundBarController.setSelectedIndex(index);
                              },
                              selectedIndex: roundBarController.selectedIndex,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text(
                              "${steel.toStringAsFixed(2)} gr/cm³",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Consumer<RoundBarController>(
                    builder: (context, controller, _) {
                      final isLengthWeight = controller.selectedIndex == 0;
                      return Column(
                        children: [
                          customTextField1(
                            "Diameter (D):",
                            roundBarController.diameterController,
                            roundBarController.selectedUnitWidth,
                            (value) {
                              roundBarController.selectedUnitWidth = value!;
                            },
                            ["mm", "cm", "in", "ft"],
                            "",
                          ),
                          isLengthWeight
                              ? customTextField1(
                                  "Length",
                                  roundBarController.lengthController,
                                  roundBarController.selectedUnitLength,
                                  (value) {
                                    roundBarController.selectedUnitLength =
                                        value!;
                                  },
                                  ["mm", "cm", "meter"],
                                  "",
                                )
                              : customTextField1(
                                  "Width",
                                  roundBarController.weightController,
                                  roundBarController.selectedUnitLength,
                                  (value) {
                                    roundBarController.selectedUnitLength =
                                        value!;
                                  },
                                  ["mm"],
                                  "Kg",
                                ),
                          customTextField2(
                              "Pieces:", roundBarController.piecesController),
                          isLengthWeight
                              ? customTextField2("Kg Price:",
                                  roundBarController.priceController)
                              : SizedBox(),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFF2F5F9),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffF2F9F9),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 6,
                                ),
                                BoxShadow(
                                  color: Color(0xffCCD8E1),
                                  offset: const Offset(4, 4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Results:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Text("Weight:",
                                        style: TextStyle(fontSize: 16)),
                                    const Text("12345",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Total Weight:",
                                        style: TextStyle(fontSize: 16)),
                                    const Text("12345",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Total Price:",
                                        style: TextStyle(fontSize: 16)),
                                    const Text("12345",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: CalculateRow(
                shareOnTap: () => Share.share('text'),
                copyOnTap: () => Clipboard.setData(ClipboardData(text: "text")),
                calculatorOnTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
