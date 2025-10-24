import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TreeUpdateScreen extends StatefulWidget {
  final String treeId;
  final String treeName;
  final String plantedDate;

  const TreeUpdateScreen({
    Key? key,
    required this.treeId,
    required this.treeName,
    required this.plantedDate,
  }) : super(key: key);

  @override
  State<TreeUpdateScreen> createState() => _TreeUpdateScreenState();
}

class _TreeUpdateScreenState extends State<TreeUpdateScreen> {
  late TextEditingController _remarksController;
  String _selectedGrowthStage = 'Growing';
  List<String> _uploadedPhotos = [];

  final List<String> _growthStages = ['Planted', 'Growing', 'Matured', 'Ready for Sale'];

  @override
  void initState() {
    super.initState();
    _remarksController = TextEditingController();
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  void _addPhoto() {
    // Placeholder for photo picker implementation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Photo picker will be implemented')),
    );
  }

  void _addMorePhotos() {
    _addPhoto();
  }

  void _submitUpdate() {
    if (_uploadedPhotos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload at least one photo')),
      );
      return;
    }

    if (_remarksController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add remarks')),
      );
      return;
    }

    // Implement submit logic here
    print('Tree Update Submitted:');
    print('Growth Stage: $_selectedGrowthStage');
    print('Remarks: ${_remarksController.text}');
    print('Photos: $_uploadedPhotos');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Update submitted successfully')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final isMediumScreen = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 16.0 : 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with back button
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textTitle,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Tree Update',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Tree Info Card
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.eco,
                          color: AppColors.primaryGreen,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.treeName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textTitle,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Planted on ${widget.plantedDate}',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textBody,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Upload Tree Photos Section
                Text(
                  'Upload Tree Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTitle,
                  ),
                ),
                SizedBox(height: 12),

                // Photo Upload Grid
                _PhotoGrid(
                  isSmallScreen: isSmallScreen,
                  isMediumScreen: isMediumScreen,
                  onAddPhoto: _addPhoto,
                ),
                SizedBox(height: 12),

                // Add More Photos Button
                Center(
                  child: TextButton.icon(
                    onPressed: _addMorePhotos,
                    icon: Icon(Icons.add, color: AppColors.primaryGreen),
                    label: Text(
                      'Add More Photos',
                      style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Growth Stage Section
                Text(
                  'Growth Stage',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTitle,
                  ),
                ),
                SizedBox(height: 12),

                ..._growthStages.map((stage) {
                  final isSelected = _selectedGrowthStage == stage;
                  return _GrowthStageOption(
                    label: stage,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _selectedGrowthStage = stage;
                      });
                    },
                  );
                }).toList(),
                SizedBox(height: 24),

                // Remarks Section
                Text(
                  'Remarks',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTitle,
                  ),
                ),
                SizedBox(height: 12),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _remarksController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Add any observations, care notes, updates about the tree\'s condition...',
                      hintStyle: TextStyle(
                        color: AppColors.textBody.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textTitle,
                    ),
                  ),
                ),
                SizedBox(height: 32),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitUpdate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Submit Update',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoGrid extends StatelessWidget {
  final bool isSmallScreen;
  final bool isMediumScreen;
  final VoidCallback onAddPhoto;

  const _PhotoGrid({
    required this.isSmallScreen,
    required this.isMediumScreen,
    required this.onAddPhoto,
  });

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = isSmallScreen ? 2 : (isMediumScreen ? 3 : 4);

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: 2, // Always show 2 add photo slots
      itemBuilder: (context, index) {
        return _PhotoCard(
          onTap: onAddPhoto,
        );
      },
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final VoidCallback onTap;

  const _PhotoCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.borderColor,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 32,
              color: AppColors.textBody.withOpacity(0.5),
            ),
            SizedBox(height: 8),
            Text(
              'Add Photo',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textBody,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GrowthStageOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GrowthStageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  Color _getIconColor(String stage) {
    switch (stage) {
      case 'Planted':
        return Color(0xFF9CA3AF);
      case 'Growing':
        return AppColors.primaryGreen;
      case 'Matured':
        return Color(0xFF3B82F6);
      case 'Ready for Sale':
        return Color(0xFFA855F7);
      default:
        return Color(0xFF9CA3AF);
    }
  }

  IconData _getIconData(String stage) {
    switch (stage) {
      case 'Planted':
        return Icons.radio_button_unchecked;
      case 'Growing':
        return Icons.check_circle;
      case 'Matured':
        return Icons.info;
      case 'Ready for Sale':
        return Icons.local_offer;
      default:
        return Icons.radio_button_unchecked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen.withOpacity(0.05) : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryGreen : Color(0xFFD1D5DB),
                  width: 2,
                ),
              ),
              child: Center(
                child: isSelected
                    ? Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryGreen,
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ),
            SizedBox(width: 12),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _getIconColor(label).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconData(label),
                color: _getIconColor(label),
                size: 16,
              ),
            ),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: AppColors.textTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}