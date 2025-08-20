import 'dart:io';

class SanPham {
  String tenSP;
  int soLuong;
  double giaTien;
  SanPham(this.tenSP, this.soLuong, this.giaTien);

  Map<String, dynamic> toList() {
    return {'tenSP': tenSP, 'soLuong': soLuong, 'giaTien': giaTien};
  }
}

/// cac ham khoi tao
void themSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Tên sản phẩm: ");
  String tenSP = stdin.readLineSync()!;
  stdout.write("Số lượng: ");
  int soLuong = int.parse(stdin.readLineSync()!);
  stdout.write("Nhập giá tiền: ");
  double giaTien = double.parse(stdin.readLineSync()!);
  gioHang.add({'tenSP': tenSP, 'soLuong': soLuong, 'giaTien': giaTien});
  print("Đã thêm vào giỏ hàng");
}

void suaSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Nhập tên sản phẩm cần sửa: ");
  String tenSP = stdin.readLineSync()!;
  for (var sanPham in gioHang) {
    if (sanPham['tenSP'] == tenSP) {
      stdout.write("Nhập số lượng mới: ");
      sanPham['soLuong'] = int.parse(stdin.readLineSync()!);
      stdout.write("Nhập giá tiền mới: ");
      sanPham['giaTien'] = double.parse(stdin.readLineSync()!);
      print("Đã sửa sản phẩm thành công");
      return;
    }
  }
  print("Không có sản phẩm nào");
}

void xoaSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write("Nhập tên sản phẩm cần xóa: ");
  String tenSP = stdin.readLineSync()!;
  gioHang.removeWhere((sanPham) => sanPham['tenSP'] == tenSP);
  print("Đã xóa sản phẩm");
}

void hienThiGioHang(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print("Không có sản phẩm nào");
    return;
  } else {
    print("\n=== Danh sách giỏ hàng ===");
    for (var sanPham in gioHang) {
      print("Tên sản phẩm: ${sanPham['tenSP']}");
      print("Số lượng: ${sanPham['soLuong']}");
      print("Giá Tiền: ${sanPham['giaTien']}");
      print("Thành tiền: ${sanPham['soLuong'] * sanPham['giaTien']}");
    }
  }
}

void tinhTongTien(List<Map<String, dynamic>> gioHang) {
  double tongTien = 0;
  for (var sanPham in gioHang) {
    tongTien = tongTien + sanPham['soLuong'] * sanPham['giaTien'];
  }
  print("Tổng tiền: $tongTien VNĐ");
}

void main(List<String> args) {
  List<Map<String, dynamic>> gioHang = [];
  while (true) {
    print("\n===== QUẢN LÝ SẢN PHẨM =====");
    print("1. Thêm sản phẩm");
    print("2. Sửa sản phẩm");
    print("3. Xóa sản phẩm");
    print("4. Hiển thị giỏ hàng");
    print("5. Tính tổng tiền hóa đơn");
    print("6. Thoát");
    stdout.write("Chọn chức năng: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        themSanPham(gioHang);
        break;
      case '2':
        suaSanPham(gioHang);
        break;
      case '3':
        xoaSanPham(gioHang);
        break;
      case '4':
        hienThiGioHang(gioHang);
        break;
      case '5':
        tinhTongTien(gioHang);
        break;
      case '6':
        print("PiPI hen gap lai");
        return;
      default:
        print("Khong co cai nao het");
    }
  }
}
