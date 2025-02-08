import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/angle_controller.dart';
import '../widgets/add_item_dialog_box.dart';
import '../widgets/back_icon_container.dart';
import '../widgets/custom_calculate_row.dart';
import '../widgets/custom_text_field1.dart';
import '../widgets/custom_text_field2.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/image_container_widget.dart';

class AngleScreen extends StatefulWidget {
  const AngleScreen({super.key});

  @override
  State<AngleScreen> createState() => _AngleScreenState();
}

class _AngleScreenState extends State<AngleScreen> {
  late AngleController angleController;
  double steel = 7.85;
  String selectedValue1 = 'Arbitrary';
  String selectedValue2 = 'European Equal Angle';
  String selectedValue3 = 'European UnEqual Angle';
  String selectedValue4 = 'British Equal Angle';
  String selectedValue5 = 'British UnEqual Angle';

  final List<String> ipeItems = [
    'European Equal Angle',
    'UPN (NPU) 50x25',
    'UPN (NPU) 65x42',
    'UPN (NPU) 100x50',
    'UPN (NPU) 120x55',
    'UPN (NPU) 140x60',
    'UPN (NPU) 160x65',
    'UPN (NPU) 180x70',
    'UPN (NPU) 200x75',
    'UPN (NPU) 220x80',
    'UPN (NPU) 240x85',
    'UPN (NPU) 260x90',
    'UPN (NPU) 280x95',
    'UPN (NPU) 300x100',
    'UPN (NPU) 320x100',
    'UPN (NPU) 350x100',
    'UPN (NPU) 380x102',
    'UPN (NPU) 400x110',
  ];
  final List<String> ipnItems = [
    'European UnEqual Angle',
    'UPE 100',
    'UPE 120',
    'UPE 140',
    'UPE 160',
    'UPE 180',
    'UPE 200',
    'UPE 220',
    'UPE 240',
    'UPE 270',
    'UPE 300',
    'UPE 330',
    'UPE 360',
    'UPE 400',
  ];
  final List<String> heAItems = [
    'British Equal Angle',
    'CH 150x150',
    'CH 200x200',
    'CH 250x250',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> heBItems = [
    'British UnEqual Angle',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];

  @override
  Widget build(BuildContext context) {
    angleController = Provider.of<AngleController>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        leading: BackIcon(),
        title: const Text("Angle Calculator"),
        backgroundColor: const Color(0xFFF2F5F9),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImageContainer(image: 'assets/icons/angle.png'),
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
                              value: angleController.selectedMaterial,
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
                                    angleController.selectedMaterial = value!;
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
                                        angleController.nameController,
                                    densityController:
                                        angleController.densityController,
                                    selectedUnitLength:
                                        angleController.selectedUnitLength,
                                    onUnitChanged: (value) {
                                      angleController.selectedUnitLength =
                                          value!;
                                    },
                                  ),
                                );
                              },
                              child: Image.asset('assets/images/icon.png')),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.55,
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
                          value: selectedValue1,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue1 = newValue!;
                            });
                          },
                          items: <String>[
                            'Arbitrary',
                            'European Equal Angle',
                            'European UnEqual Angle',
                            'British Equal Angle',
                            'British UnEqual Angle',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: CustomToggleButton(
                          options: const ["by Length", "by Weight"],
                          onChanged: (int index) {
                            angleController.setSelectedIndex(index);
                          },
                          selectedIndex: angleController.selectedIndex,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400)),
                        child: Text(
                          "${steel.toStringAsFixed(2)} gr/cm³",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              if (selectedValue1 == 'Arbitrary') ...[
                Consumer<AngleController>(
                  builder: (context, controller, _) {
                    final isLengthWeight = controller.selectedIndex == 0;
                    return Column(
                      children: [
                        customTextField1(
                          "Side (A):",
                          angleController.sideAController,
                          angleController.selectedUnitWidth,
                          (value) {
                            angleController.selectedUnitWidth = value!;
                          },
                          ["mm", "cm", "in", "ft"],
                          "",
                        ),
                        customTextField1(
                          "Side (B):",
                          angleController.sideBController,
                          angleController.selectedUnitWidth,
                          (value) {
                            angleController.selectedUnitWidth = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        customTextField1(
                          "Thickness(T):",
                          angleController.thicknessTController,
                          angleController.selectedUnitLength,
                          (value) {
                            angleController.selectedUnitLength = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        isLengthWeight
                            ? customTextField1(
                                "Length",
                                angleController.lengthController,
                                angleController.selectedUnitLength,
                                (value) {
                                  angleController.selectedUnitLength = value!;
                                },
                                ["mm", "cm", "meter"],
                                "",
                              )
                            : customTextField1(
                                "Weight:",
                                angleController.weightController,
                                angleController.selectedUnitLength,
                                (value) {
                                  angleController.selectedUnitLength = value!;
                                },
                                ["mm"],
                                "Kg",
                              ),
                        customTextField2(
                            "Pieces:", angleController.piecesController),
                        isLengthWeight
                            ? customTextField2(
                                "Kg Price:", angleController.priceController)
                            : SizedBox(),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(
                                0xFFF2F5F9), // Light background color
                            boxShadow: [
                              // Light shadow (top-left) for 3D effect
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(-4, -4),
                                blurRadius: 6,
                              ),
                              // Dark shadow (bottom-right) for depth
                              BoxShadow(
                                color: Colors.grey.shade400,
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
                                  const Text(
                                    "Weight:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Text(
                                    "12345",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total Weight:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Text(
                                    "12345",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total Price:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Text(
                                    "12345",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
              if (selectedValue1 == 'European Equal Angle' ||
                  selectedValue1 == 'European UnEqual Angle' ||
                  selectedValue1 == 'British Equal Angle' ||
                  selectedValue1 == 'British UnEqual Angle') ...[
                Consumer<AngleController>(
                  builder: (context, controller, _) {
                    final isLengthWeight = controller.selectedIndex == 0;
                    return Column(
                      children: [
                        if (selectedValue1 == 'European Equal Angle')
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedValue2,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue2 = newValue!;
                              });
                            },
                            items: ipeItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'European UnEqual Angle')
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedValue3,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue3 = newValue!;
                              });
                            },
                            items: ipnItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'British Equal Angle')
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedValue4,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue4 = newValue!;
                              });
                            },
                            items: heAItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'British UnEqual Angle')
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedValue5,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue5 = newValue!;
                              });
                            },
                            items: heBItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        isLengthWeight
                            ? customTextField1(
                                "Length",
                                angleController.lengthController,
                                angleController.selectedUnitLength,
                                (value) {
                                  angleController.selectedUnitLength = value!;
                                },
                                ["mm", "cm", "meter"],
                                "",
                              )
                            : customTextField1(
                                "Weight:",
                                angleController.weightController,
                                angleController.selectedUnitLength,
                                (value) {
                                  angleController.selectedUnitLength = value!;
                                },
                                ["mm"],
                                "Kg",
                              ),
                        customTextField2(
                            "Pieces:", angleController.piecesController),
                        isLengthWeight
                            ? customTextField2(
                                "Kg Price:", angleController.priceController)
                            : SizedBox(),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(
                                0xFFF2F5F9), // Light background color
                            boxShadow: [
                              // Light shadow (top-left) for 3D effect
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(-4, -4),
                                blurRadius: 6,
                              ),
                              // Dark shadow (bottom-right) for depth
                              BoxShadow(
                                color: Colors.grey.shade400,
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
                                  const Text(
                                    "Weight:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Text(
                                    "12345",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total Weight:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Text(
                                    "12345",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total Price:",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Text(
                                    "12345",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
              const SizedBox(height: 20),
              CalculateRow(
                shareOnTap: () => Share.share('text'),
                copyOnTap: () => Clipboard.setData(ClipboardData(text: "text")),
                calculatorOnTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
