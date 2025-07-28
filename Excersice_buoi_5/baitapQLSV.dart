void main(List<String> args) {
  String name = "Mỹ";
  double hoursWorked = 45;
  double hourlyWage = 200000;

  double totalSalary = hoursWorked * hourlyWage;
  if (hoursWorked > 40) {
    totalSalary += totalSalary * 0.2;
  }

  double tax = 0.0;
  if (totalSalary > 10000000) {
    tax = totalSalary * 0.1;
  } else if (totalSalary >= 7000000) {
    tax = totalSalary * 0.05;
  }

  double netSalary = totalSalary - tax;

  print('=== Kết quả lương nhân viên ===');
  print('Họ tên: $name');
  print('Tổng lương trước thuế: ${totalSalary.toStringAsFixed(0)} VND');
  print('Thuế thu nhập: ${tax.toStringAsFixed(0)} VND');
  print('Lương thực lãnh: ${netSalary.toStringAsFixed(0)} VND');
}
