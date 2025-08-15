import 'dart:io';

class SinhVien {
  String hoTen;
  double diemToan;
  double diemLy;
  double diemHoa;

  SinhVien(this.hoTen, this.diemToan, this.diemLy, this.diemHoa);

  double get dTB => (diemToan + diemLy + diemHoa) / 3;

  String get xepLoai {
    if (dTB < 5) return "Kém";
    if (dTB < 7) return "Khá";
    if (dTB <= 9) return "Giỏi";
    return "Xuất sắc";
  }
}

void main(List<String> args) {
  List<SinhVien> danhSach = [];

  while (true) {
    print("\n===== QUẢN LÝ SINH VIÊN =====");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên có ĐTB cao nhất");
    print("4. Thoát");
    stdout.write("Chọn chức năng: ");
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.write("Nhập Họ tên SV:");
        String hoTen = stdin.readLineSync() ?? "";

        stdout.write("Nhập điểm Toán: ");
        double diemToan = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
        stdout.write("Nhập điểm Lý: ");
        double diemLy = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
        stdout.write("Nhập điểm Hóa: ");
        double diemHoa = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

        danhSach.add(SinhVien(hoTen, diemToan, diemLy, diemHoa));
        print("Đã thêm sinh viên thành công");
        break;
      case '2':
        if (danhSach.isEmpty) {
          print("Danh sách không có sinh viên nào");
        } else {
          print("\n===== DANH SÁCH SINH VIÊN =====");
          for (var svien in danhSach) {
            print(
              "Tên Sinh viên: ${svien.hoTen}, Điểm Toán: ${svien.diemToan}, Điểm Lý: ${svien.diemLy}, Điểm Hóa: ${svien.diemHoa}",
            );
            print("Điểm trung bình: ${svien.dTB}");
            print("Xếp loại: ${svien.xepLoai}");
          }
        }
        break;
      case '3':
        if (danhSach.isEmpty) {
          print("Danh sách không có sinh viên nào");
        } else {
          SinhVien svdiemTB = danhSach.reduce((a, b) => a.dTB > b.dTB ? a : b);
          print("Sinh viên có điểm TB cao nhất:");
          print(
            "Tên Sinh viên: ${svdiemTB.hoTen}, Điểm Toán: ${svdiemTB.diemToan}, Điểm Lý: ${svdiemTB.diemLy}, Điểm Hóa: ${svdiemTB.diemHoa}",
          );
          print("Điểm trung bình: ${svdiemTB.dTB}");
        }
        break;
      case '4':
        print("Thoát chương trình");
        return;
      default:
        print("Không có lựa chọn nào");
    }
  }
}
