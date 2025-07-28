void main(List<String> args) {
  String productName = "Áo thun";
  int quantity = 10;
  double unitPrice = 120000;

  double subtotal = quantity * unitPrice;

  double discount = 0.0;
  if (subtotal >= 1000000) {
    discount = subtotal * 0.1;
  } else if (subtotal >= 500000) {
    discount = subtotal * 0.05;
  }

  double discountedTotal = subtotal - discount;
  double vat = discountedTotal * 0.08;
  double totalPayment = discountedTotal + vat;

  print('\n=== HÓA ĐƠN BÁN HÀNG ===');
  print('Tên sản phẩm: $productName');
  print('Số lượng: $quantity');
  print('Đơn giá: ${unitPrice.toStringAsFixed(0)} VND');
  print('Thành tiền: ${subtotal.toStringAsFixed(0)} VND');
  print('Giảm giá: ${discount.toStringAsFixed(0)} VND');
  print('Thuế VAT (8%): ${vat.toStringAsFixed(0)} VND');
  print('Tổng thanh toán: ${totalPayment.toStringAsFixed(0)} VND');
}
