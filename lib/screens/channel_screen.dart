import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/channel_controller.dart';
import '../widgets/add_item_dialog_box.dart';
import '../widgets/back_icon_container.dart';
import '../widgets/custom_calculate_row.dart';
import '../widgets/custom_text_field1.dart';
import '../widgets/custom_text_field2.dart';
import '../widgets/custom_toggle_button.dart';
import '../widgets/image_container_widget.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({super.key});

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  late ChannelController channelController;
  double steel = 7.85;
  String selectedValue1 = 'Arbitrary';
  String selectedValue2 = 'UPN (NPU) 40x20';
  String selectedValue3 = 'UPE 80';
  String selectedValue4 = 'CH 100x100';
  String selectedValue5 = 'CH 250x250';

  final List<String> upnItems = [
    'UPN (NPU) 40x20',
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
  final List<String> upeItems = [
    'UPE 80',
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
  final List<String> pfcItems = [
    'CH 100x100',
    'CH 150x150',
    'CH 200x200',
    'CH 250x250',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];
  final List<String> chItems = [
    'CH 250x250',
    'CH 300x300',
    'CH 350x350',
    'CH 400x400',
  ];

  @override
  Widget build(BuildContext context) {
    channelController = Provider.of<ChannelController>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      appBar: AppBar(
        leading: BackIcon(),
        title: const Text("Channel Calculator"),
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
                              value: channelController.selectedMaterial,
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
                                    channelController.selectedMaterial = value!;
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
                                        channelController.nameController,
                                    densityController:
                                        channelController.densityController,
                                    selectedUnitLength:
                                        channelController.selectedUnitLength,
                                    onUnitChanged: (value) {
                                      channelController.selectedUnitLength =
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
                            'UPN',
                            'UPE',
                            'PFC BS 4-1-2005',
                            'CH BS 4-1-1993'
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
                            channelController.setSelectedIndex(index);
                          },
                          selectedIndex: channelController.selectedIndex,
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
              if (selectedValue1 == 'Arbitrary') ...[
                Consumer<ChannelController>(
                  builder: (context, controller, _) {
                    final isLengthWeight = controller.selectedIndex == 0;
                    return Column(
                      children: [
                        customTextField1(
                          "Side (A):",
                          channelController.sideAController,
                          channelController.selectedUnitWidth,
                          (value) {
                            channelController.selectedUnitWidth = value!;
                          },
                          ["mm", "cm", "in", "ft"],
                          "",
                        ),
                        customTextField1(
                          "Side (B):",
                          channelController.sideBController,
                          channelController.selectedUnitWidth,
                          (value) {
                            channelController.selectedUnitWidth = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        customTextField1(
                          "Thickness(T):",
                          channelController.thicknessTController,
                          channelController.selectedUnitLength,
                          (value) {
                            channelController.selectedUnitLength = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        customTextField1(
                          "Thickness(S):",
                          channelController.thicknessSController,
                          channelController.selectedUnitLength,
                          (value) {
                            channelController.selectedUnitLength = value!;
                          },
                          ["mm"],
                          "mm",
                        ),
                        isLengthWeight
                            ? customTextField1(
                                "Length",
                                channelController.lengthController,
                                channelController.selectedUnitLength,
                                (value) {
                                  channelController.selectedUnitLength = value!;
                                },
                                ["mm", "cm", "meter"],
                                "",
                              )
                            : customTextField1(
                                "Weight:",
                                channelController.weightController,
                                channelController.selectedUnitLength,
                                (value) {
                                  channelController.selectedUnitLength = value!;
                                },
                                ["mm"],
                                "Kg",
                              ),
                        customTextField2(
                            "Pieces:", channelController.piecesController),
                        isLengthWeight
                            ? customTextField2(
                                "Kg Price:", channelController.priceController)
                            : SizedBox(),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
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
              if (selectedValue1 == 'UPN' ||
                  selectedValue1 == 'UPE' ||
                  selectedValue1 == 'PFC BS 4-1-2005' ||
                  selectedValue1 == 'CH BS 4-1-1993') ...[
                Consumer<ChannelController>(
                  builder: (context, controller, _) {
                    final isLengthWeight = controller.selectedIndex == 0;
                    return Column(
                      children: [
                        if (selectedValue1 == 'UPN')
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
                            items: upnItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'UPE')
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
                            items: upeItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'PFC BS 4-1-2005')
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
                            items: pfcItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        if (selectedValue1 == 'CH BS 4-1-1993')
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
                            items: chItems
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
                                channelController.lengthController,
                                channelController.selectedUnitLength,
                                (value) {
                                  channelController.selectedUnitLength = value!;
                                },
                                ["mm", "cm", "meter"],
                                "",
                              )
                            : customTextField1(
                                "Weight:",
                                channelController.weightController,
                                channelController.selectedUnitLength,
                                (value) {
                                  channelController.selectedUnitLength = value!;
                                },
                                ["mm"],
                                "Kg",
                              ),
                        customTextField2(
                            "Pieces:", channelController.piecesController),
                        isLengthWeight
                            ? customTextField2(
                                "Kg Price:", channelController.priceController)
                            : SizedBox(),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
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
