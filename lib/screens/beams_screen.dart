import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/beams_controller.dart';
import '../widgets/add_item_dialog_box.dart';
import '../widgets/back_icon_container.dart';
import '../widgets/custom_calculate_row.dart';
import '../widgets/custom_text_field1.dart';
import '../widgets/custom_text_field2.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/image_container_widget.dart';

class BeamsScreen extends StatefulWidget {
  const BeamsScreen({super.key});

  @override
  State<BeamsScreen> createState() => _BeamsScreenState();
}

class _BeamsScreenState extends State<BeamsScreen> {
  late BeamsController beamsController;
  double steel = 7.85;
  String selectedValue1 = 'Arbitrary';
  String selectedValue2 = 'IPE';
  String selectedValue3 = 'IPN';
  String selectedValue4 = 'HE A';
  String selectedValue5 = 'HE B';
  String selectedValue6 = 'HE M';
  String selectedValue7 = 'HL';
  String selectedValue8 = 'HD';
  String selectedValue9 = 'HP';
  String selectedValue10 = 'UB BS 4-1-2005';
  String selectedValue11 = 'Joists BS 4-1-2005';
  String selectedValue12 = 'UC BS 4-1-2005';
  String selectedValue13 = 'UBP BS 4-1-2005';

  final List<String> ipeItems = [
    'IPE',
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
    'IPN',
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
    'HE A',
    'CH 150x150',
    'CH 200x200',
    'CH 250x250',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> heBItems = [
    'HE B',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> heMItems = [
    'HE M',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> hlItems = [
    'HL',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> hdBItems = [
    'HD',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> hpBItems = [
    'HP',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> ubBsItems = [
    'UB BS 4-1-2005',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> joitsBsItems = [
    'Joists BS 4-1-2005',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> ucBsItems = [
    'UC BS 4-1-2005',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> ubpBsItems = [
    'UBP BS 4-1-2005',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];

  @override
  Widget build(BuildContext context) {
    beamsController = Provider.of<BeamsController>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        leading: BackIcon(),
        title: const Text("Beams Calculator"),
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
                  ImageContainer(image: 'assets/icons/hexagon.png'),
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
                              value: beamsController.selectedMaterial,
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
                                    beamsController.selectedMaterial = value!;
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
                                        beamsController.nameController,
                                    densityController:
                                        beamsController.densityController,
                                    selectedUnitLength:
                                        beamsController.selectedUnitLength,
                                    onUnitChanged: (value) {
                                      beamsController.selectedUnitLength =
                                          value!;
                                    },
                                  ),
                                );
                              },
                              child: Image.asset('assets/images/icon.png')),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.height * 0.08,
                        child: DropdownButtonFormField<String>(
                          icon: Icon(Icons.keyboard_arrow_down),
                          style: TextStyle(
                              fontSize: 12,
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
                            'IPE',
                            'IPN',
                            'HE A',
                            'HE B',
                            'HE M',
                            'HL',
                            'HD',
                            'HP',
                            'UB BS 4-1-2005',
                            'Joists BS 4-1-2005',
                            'UC BS 4-1-2005',
                            'UBP BS 4-1-2005'
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
                            beamsController.setSelectedIndex(index);
                          },
                          selectedIndex: beamsController.selectedIndex,
                        ),
                      ),
                      SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          TextEditingController densityController =
                              TextEditingController();
                          String densityValue = steel.toStringAsFixed(2);

                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: const Color(0xFFF2F5F9),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "Input Your Density :",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 15),
                                          TextField(
                                            keyboardType: TextInputType.number,
                                            controller: densityController,
                                            decoration: InputDecoration(
                                              hintText: "-----",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              setState(() {
                                                densityValue = value;
                                              });
                                            },
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(densityValue);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.lightBlue,
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                                ),
                                                child: const Text("Ok",
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.lightBlue,
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                                ),
                                                child: const Text("CANCEL",
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ).then((value) {
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                steel = double.tryParse(value) ??
                                    steel; // Update main UI variable
                              });
                            }
                          });
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (selectedValue1 == 'Arbitrary') ...[
                Consumer<BeamsController>(
                  builder: (context, controller, _) {
                    final isLengthWeight = controller.selectedIndex == 0;
                    return Column(
                      children: [
                        customTextField1(
                          "Side (A):",
                          beamsController.sideAController,
                          beamsController.selectedUnitWidth,
                          (value) {
                            beamsController.selectedUnitWidth = value!;
                          },
                          ["mm", "cm", "in", "ft"],
                          "",
                        ),
                        customTextField1(
                          "Side (B):",
                          beamsController.sideBController,
                          beamsController.selectedUnitWidth,
                          (value) {
                            beamsController.selectedUnitWidth = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        customTextField1(
                          "Thickness(T):",
                          beamsController.thicknessTController,
                          beamsController.selectedUnitLength,
                          (value) {
                            beamsController.selectedUnitLength = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        customTextField1(
                          "Thickness(S):",
                          beamsController.thicknessSController,
                          beamsController.selectedUnitLength,
                          (value) {
                            beamsController.selectedUnitLength = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        isLengthWeight
                            ? customTextField1(
                                "Length",
                                beamsController.lengthController,
                                beamsController.selectedUnitLength,
                                (value) {
                                  beamsController.selectedUnitLength = value!;
                                },
                                ["mm", "cm", "meter"],
                                "",
                              )
                            : customTextField1(
                                "Weight:",
                                beamsController.weightController,
                                beamsController.selectedUnitLength,
                                (value) {
                                  beamsController.selectedUnitLength = value!;
                                },
                                ["mm"],
                                "Kg",
                              ),
                        customTextField2(
                            "Pieces:", beamsController.piecesController),

                        isLengthWeight
                            ? customTextField2(
                                "Kg Price:", beamsController.priceController)
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
              ],
              if (selectedValue1 == 'IPE' ||
                  selectedValue1 == 'IPN' ||
                  selectedValue1 == 'HE A' ||
                  selectedValue1 == 'HE B' ||
                  selectedValue1 == 'HE M' ||
                  selectedValue1 == 'HL' ||
                  selectedValue1 == 'HD' ||
                  selectedValue1 == 'HP' ||
                  selectedValue1 == 'UB BS 4-1-2005' ||
                  selectedValue1 == 'Joists BS 4-1-2005' ||
                  selectedValue1 == 'UC BS 4-1-2005' ||
                  selectedValue1 == 'UBP BS 4-1-2005') ...[
                Consumer<BeamsController>(
                  builder: (context, controller, _) {
                    final isLengthWeight = controller.selectedIndex == 0;
                    return Column(
                      children: [
                        if (selectedValue1 == 'IPE')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
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
                        if (selectedValue1 == 'IPN')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
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
                        if (selectedValue1 == 'HE A')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
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
                        if (selectedValue1 == 'HE B')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
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
                        if (selectedValue1 == 'HE M')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue6,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue6 = newValue!;
                              });
                            },
                            items: heMItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'HL')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue7,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue7 = newValue!;
                              });
                            },
                            items: hlItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'HD')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue8,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue8 = newValue!;
                              });
                            },
                            items: hdBItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'HP')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue9,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue9 = newValue!;
                              });
                            },
                            items: hpBItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'UB BS BS 4-1-2005')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue10,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue10 = newValue!;
                              });
                            },
                            items: ubBsItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'Joists BS 4-1-2005')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue11,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue11 = newValue!;
                              });
                            },
                            items: joitsBsItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'UC BS 4-1-2005')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue12,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue12 = newValue!;
                              });
                            },
                            items: ucBsItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'UBP BS 4-1-2005')
                          DropdownButtonFormField<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                            value: selectedValue13,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue13 = newValue!;
                              });
                            },
                            items: ubpBsItems
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
                                beamsController.lengthController,
                                beamsController.selectedUnitLength,
                                (value) {
                                  beamsController.selectedUnitLength = value!;
                                },
                                ["mm", "cm", "meter"],
                                "",
                              )
                            : customTextField1(
                                "Weight:",
                                beamsController.weightController,
                                beamsController.selectedUnitLength,
                                (value) {
                                  beamsController.selectedUnitLength = value!;
                                },
                                ["mm"],
                                "Kg",
                              ),
                        customTextField2(
                            "Pieces:", beamsController.piecesController),

                        isLengthWeight
                            ? customTextField2(
                                "Kg Price:", beamsController.priceController)
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
