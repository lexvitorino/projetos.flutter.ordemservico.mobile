class ErrorModel {
  List<String> errors;

  ErrorModel({
    this.errors,
  });

  bool hasError() {
    return this.errors != null && this.errors.length > 0;
  }

  String message() {
    if (hasError()) {
      if (this.errors.length > 1) {
        return this.errors[0] + " (+${this.errors.length - 1})";
      } else {
        return this.errors[0];
      }
    }
    return "";
  }
}
