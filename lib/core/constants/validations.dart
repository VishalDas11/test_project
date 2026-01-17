// class Validation {
  String? validateEmail(
      String? value, {
        void Function()? onError,
        void Function()? onSuccess,
      }) {
    if (value == null || value.isEmpty) {
      onError?.call();
      return 'Enter your email';
    }

    const emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(value)) {
      onError?.call();
      return 'Please enter a valid email address.';
    }

    onSuccess?.call();

    return null;
  }


  String? validatePassword(
      String? value, {
        void Function()? onError,
        void Function()? onSuccess,
      }) {
    if (value == null || value.trim().isEmpty) {
      onError?.call();
      return 'Enter your password';
    }

    if (value.contains(' ')) {
      onError?.call();
      return 'Password cannot contain white spaces';
    }

    const passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,}$';
    final regExp = RegExp(passwordPattern);

    if (!regExp.hasMatch(value)) {
      onError?.call();
      return 'Password must be at least 8 characters long,\n'
          'include one uppercase letter, one lowercase letter,\n'
          'one number, and one special character.';
    }

    onSuccess?.call();
    return null;
  }

//   // static String? validatePassword(String? value) {
//   //   if (value == null || value.trim().isEmpty) {
//   //     return 'Enter your password';
//   //   }
//
//   //   if (value.contains(' ')) {
//   //     return 'Password cannot contain white spaces';
//   //   }
//
//   //   const passwordPattern =
//   //       r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,}$';
//   //   final regExp = RegExp(passwordPattern);
//
//   //   if (!regExp.hasMatch(value)) {
//   //     return 'Password must be at least 8 characters long, \ninclude at least '
//   //         'one uppercase letter, one lowercase \nletter, one number, and one '
//   //         'special character';
//   //   }
//
//   //   return null;
//   // }
//
//   static String? validateNewPassword(String? value) {
//     return validatePassword(value);
//   }
//
//   static String? validateConfirmPassword(
//       String? newPassword,
//       String? confirmPassword, {
//         void Function()? onError,
//         void Function()? onSuccess,
//       }) {
//     if (confirmPassword == null || confirmPassword.trim().isEmpty) {
//       onError?.call();
//       return 'Confirm password is required';
//     }
//
//     if (newPassword != confirmPassword) {
//       onError?.call();
//       return 'Passwords do not match';
//     }
//
//     onSuccess?.call();
//     return null;
//   }
//
//   // static String? validateConfirmPassword(
//   //   String? newPassword,
//   //   String? confirmPassword,
//   // ) {
//   //   if (confirmPassword == null || confirmPassword.trim().isEmpty) {
//   //     return 'Confirm password is required';
//   //   }
//   //   if (newPassword != confirmPassword) {
//   //     return 'Passwords do not match';
//   //   }
//   //   return null;
//   // }
//
//   static String? validateFullName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your full name';
//     }
//
//     List<String> nameParts = value.trim().split(RegExp(r'\s+'));
//
//     final nameRegExp = RegExp(r"^[a-zA-Z]+([-' ][a-zA-Z]+)*$");
//
//     for (String part in nameParts) {
//       if (!nameRegExp.hasMatch(part)) {
//         return 'Names can only contain letters, hyphens, apostrophes, and spaces';
//       }
//     }
//
//     return null;
//   }
//
//   static String? validateUserName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Username cannot be empty';
//     }
//
//     final regex = RegExp(r'^[a-zA-Z0-9_]+$');
//     if (!regex.hasMatch(value)) {
//       return 'Username can only contain letters, numbers, and underscores';
//     }
//
//     return null;
//   }
//
//   static String? validateCommon(
//       String? value, {
//         void Function()? onError,
//         void Function()? onSuccess,
//       }) {
//     if (value == null || value.trim().isEmpty) {
//       onError?.call();
//       return 'Field can\'t be empty';
//     }
//
//     onSuccess?.call();
//
//     return null;
//   }
//
//   // static String? validateCommon(String? value) {
//   //   if (value == null || value.trim().isEmpty) {
//   //     return 'Field can\'t be empty';
//   //   }
//   //   return null;
//   // }
//
//   static String? validateAbout(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter About yourself';
//     }
//     return null;
//   }
//
//   static String? validateDateOfEvent(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your Date Of Event';
//     }
//     return null;
//   }
//
//   static String? validateTimeOfEvent(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your Time Of Event';
//     }
//     return null;
//   }
//
//   static String? validateTitle(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your Title';
//     }
//     return null;
//   }
//
//   static String? validateCityDropdown(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Select City';
//     }
//     return null;
//   }
//
//   static String? validateZipCode(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your Zip Code';
//     }
//     return null;
//   }
//
//   static String? validateDescription(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your Description';
//     }
//     return null;
//   }
//
//   static String? validateItemCategories(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your Item Categories';
//     }
//     return null;
//   }
//
//   static String? validateCountyDropdown(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Select County';
//     }
//     return null;
//   }
//
//   static String? validateAddress(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Please enter your full Address';
//     }
//     if (value.trim().length < 5) {
//       return 'Address must be at least 5 characters long';
//     }
//     return null;
//   }
//
//   static String? validateCity(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select your City';
//     }
//     return null;
//   }
//
//   static String? validateCounty(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select your County';
//     }
//     return null;
//   }
//
//   static String? validateUSPhoneNumber(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter your phone number';
//     }
//
//     const phonePattern = r'^\d{10}$';
//     final regExp = RegExp(phonePattern);
//
//     if (!regExp.hasMatch(value)) {
//       return 'Enter a valid phone number';
//     }
//     return null;
//   }
// }
