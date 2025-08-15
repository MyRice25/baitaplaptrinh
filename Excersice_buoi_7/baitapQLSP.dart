import 'dart:io';

class SanPham {
  String tenSP;
  int giaTien;
  int soLuong;

  SanPham(this.tenSP, this.giaTien, this.soLuong);
}

void main(List<String> args) {
  List<SanPham> danhSachSP = [];

  while (true) {
    print("\n===== QUẢN LÝ SẢN PHẨM =====");
    print("1. Thêm sản phẩm");
    print("2. Hiển thị danh sách sản phẩm");
    print("3. Tìm sản phẩm theo tên");
    print("4. Bán sản phẩm");
    print("5. Thoát");
    stdout.write("Chọn chức năng: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Nhập tên sản phẩm: ");
        String tenSP = stdin.readLineSync() ?? "";
        stdout.write("Nhập giá tiền: ");
        int giaTien = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        stdout.write("Nhập số lượng: ");
        int soLuong = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        danhSachSP.add(SanPham(tenSP, giaTien, soLuong));
        print("Đã thêm sản phẩm thành công");
        break;
      case '2':
        if (danhSachSP.isEmpty) {
          print("Không có sản phẩm nào");
        } else {
          print("\n===== DANH SÁCH SẢN PHẨM =====");
          for (var sp in danhSachSP) {
            print(
              "Tên: ${sp.tenSP}, Giá: ${sp.giaTien}, Số lượng tồn: ${sp.soLuong}",
            );
          }
        }
        break;
      case '3':
        stdout.write("Nhập tên sản phẩm cần tìm: ");
        String searchSP = stdin.readLineSync() ?? "";
        var ketQua =
            danhSachSP
                .where((sp) => sp.tenSP.toLowerCase() == searchSP.toLowerCase())
                .toList();
        if (ketQua.isEmpty) {
          print("Không tìm thấy sản phẩm!");
        } else {
          print("Đã tìm thấy sản phẩm:");
          for (var sp in ketQua) {
            print(
              "Tên: ${sp.tenSP}, Giá: ${sp.giaTien}, Số lượng tồn: ${sp.soLuong}",
            );
          }
        }
        break;
      case '4':
        stdout.write("Nhập tên sản phẩm cần bán: ");
        String tenBan = stdin.readLineSync() ?? "";

        var spBan = danhSachSP.firstWhere(
          (sp) => sp.tenSP.toLowerCase() == tenBan.toLowerCase(),
          orElse: () => SanPham("", 0, 0),
        );

        if (spBan.tenSP.isEmpty) {
          print("Sản phẩm không tồn tại!");
        } else {
          stdout.write("Nhập số lượng cần bán: ");
          int soLuongBan = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

          if (soLuongBan <= 0) {
            print("Số lượng bán không hợp lệ!");
          } else if (soLuongBan > spBan.soLuong) {
            print("Không đủ hàng trong kho!");
          } else {
            spBan.soLuong -= soLuongBan;
            print(
              "Đã bán $soLuongBan sản phẩm. Số lượng tồn còn lại: ${spBan.soLuong}",
            );
          }
        }
        break;
      case '5':
        print("bye bye");
        return;
      default:
        print("Không có lựa chọn nào đâu chọn lại đi");
    }
  }
}
