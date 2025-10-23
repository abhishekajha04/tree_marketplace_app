import 'package:flutter/material.dart';

class ProfileDetailsForm extends StatefulWidget {
  @override
  _ProfileDetailsFormState createState() => _ProfileDetailsFormState();
}

class _ProfileDetailsFormState extends State<ProfileDetailsForm> {
  // 1. Define TextEditingControllers to manage input state
  final TextEditingController _firstNameController = TextEditingController(text: '');
  final TextEditingController _lastNameController = TextEditingController(text: '');
  final TextEditingController _emailController = TextEditingController(text: '');
  final TextEditingController _phoneController = TextEditingController(text: '');
  final TextEditingController _addressController = TextEditingController(text: '');
  final TextEditingController _dobController = TextEditingController(text: '');
  
  String? _selectedGender = 'Female'; // State for dropdown

  // Custom text field designed to match the image style: border, label above, no floating hint.
  Widget _buildFormField({
    required String label,
    required TextEditingController controller, // Now accepts a controller
    required TextInputType keyboardType,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: controller, // Using controller instead of initialValue
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
          decoration: InputDecoration(
            // Remove floating label and use hintText for guidance
            labelText: null, 
            hintText: 'Enter $label', // Added a generic hint
            hintStyle: TextStyle(color: Colors.grey[500]),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          readOnly: false, // **Changed to false to allow input**
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Custom Dropdown designed to match the image style
  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            'Gender',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          value: _selectedGender, // Using state variable
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87), 
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          items: const [
            DropdownMenuItem(child: Text('Female'), value: 'Female'),
            DropdownMenuItem(child: Text('Male'), value: 'Male'),
            DropdownMenuItem(child: Text('Other'), value: 'Other'),
          ],
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
  
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row (Personal Information & Edit Button)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personal Information', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  )
                ),
                TextButton.icon(
                  onPressed: () {
                    // In a real app, this button would toggle readOnly state,
                    // but since all fields are now editable, we can use it for 'Save' or 'Edit' mode toggling.
                    print('Edit/Save pressed'); 
                  },
                  icon: Icon(Icons.edit, size: 18),
                  label: Text('Edit'),
                  style: TextButton.styleFrom(
                    // FIX: Replaced deprecated 'primary' with 'foregroundColor'
                    foregroundColor: Colors.blue[700], 
                    textStyle: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Two-Column Layout for First Name, Last Name, Email, Phone
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Name
                Expanded(
                  child: _buildFormField(
                    label: 'First Name',
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(width: 16),
                // Last Name
                Expanded(
                  child: _buildFormField(
                    label: 'Last Name',
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                  ),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                Expanded(
                  child: _buildFormField(
                    label: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(width: 16),
                // Phone
                Expanded(
                  child: _buildFormField(
                    label: 'Phone',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),

            // Full-Width Address Field
            _buildFormField(
              label: 'Address',
              controller: _addressController,
              keyboardType: TextInputType.streetAddress,
            ),

            // Two-Column Layout for Date of Birth and Gender
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date of Birth
                Expanded(
                  child: _buildFormField(
                    label: 'Date of Birth',
                    controller: _dobController,
                    keyboardType: TextInputType.datetime,
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[500]),
                  ),
                ),
                SizedBox(width: 16),
                // Gender Dropdown
                Expanded(
                  child: _buildGenderField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
