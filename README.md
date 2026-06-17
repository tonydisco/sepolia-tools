# 🦊 Sepolia Tools

Trang trợ giúp **local** để làm việc với ví MetaMask trên mạng **Sepolia testnet**:

- Kết nối MetaMask, xem số dư **ETH** và **USDT** real-time
- **Thêm token** vào MetaMask qua `wallet_watchAsset` (khắc phục được lỗi import thủ công bị treo của MetaMask)
- **Mint USDT** trực tiếp bằng cách gọi hàm contract
- Link nhanh tới các **faucet** lấy Sepolia ETH

Toàn bộ chạy offline ở máy bạn (một file HTML tĩnh + server HTTP đơn giản). Không có backend, không thu thập dữ liệu.

---

## 🚀 Chạy ngay

```bash
./start.sh
```

Script sẽ:
1. Phục vụ app tại `http://localhost:8765/`
2. Tự mở trình duyệt mặc định

Đổi port nếu cần: `./start.sh 9000`

Dừng app: nhấn `Ctrl+C`.

> Yêu cầu: `python3` (có sẵn trên macOS/Linux) và trình duyệt đã cài **MetaMask**.

---

## 📖 Hướng dẫn sử dụng

### 1. Kết nối & xem số dư
- Bấm **Connect MetaMask** → chọn account → app tự chuyển sang Sepolia nếu cần.
- Số dư **ETH** và **USDT** hiển thị ngay. Bấm **Refresh balances** để cập nhật.

### 2. Thêm USDT vào ví
- Bấm **Add USDT token** → MetaMask hiện popup "Add suggested token" → **Add token**.
- Dùng cách này khi import thủ công trong MetaMask báo "added" nhưng token không hiện.

### 3. Thêm token tùy ý
- Nhập **contract address**, **symbol**, **decimals** → **Add custom token**.

### 4. Mint USDT
- Nhập số USDT muốn mint (app tự nhân ×10⁶) → **Mint USDT** → **Confirm** trong MetaMask.
- Cần một ít Sepolia ETH để trả gas.
- Đợi ~15s rồi bấm **Refresh balances**.

### 5. Lấy Sepolia ETH (faucet)
- Bấm **Copy địa chỉ ví**, rồi mở một trong các faucet và dán địa chỉ vào.

---

## 🪙 Token USDT (Test Tether USD)

| Thuộc tính | Giá trị |
|---|---|
| Network | Sepolia (chainId `11155111` / `0xaa36a7`) |
| Contract | `0x7169d38820dfd117c3fa1f22a697dba58d90ba06` |
| Symbol | USDT |
| Decimals | **6** |
| Hàm mint | `_giveMeTokens(uint256)` — selector `0xf5e3f1f7` (public faucet) |

> Selector mint được xác thực trực tiếp từ input của một giao dịch mint thành công on-chain, không phải đoán.

---

## ❓ Mint khác Faucet thế nào?

| | **Mint** | **Faucet** |
|---|---|---|
| Bản chất | Tạo **mới** token từ contract (tăng total supply) | Phát **lại** coin có sẵn từ kho nạp trước |
| Dùng cho | Token ERC-20 có hàm mint | Coin gốc/native (Sepolia ETH) |
| Cách làm | Gọi thẳng hàm contract qua ví | Website/dịch vụ gửi cho bạn |

**ETH gốc không mint được** vì không contract nào quản lý nguồn cung của nó — chỉ lấy qua faucet. Token ERC-20 thì contract tự định nghĩa hàm mint nên gọi được là tạo token mới.

---

## 📁 Cấu trúc

```
sepolia-tools/
├── index.html    # toàn bộ app (UI + logic)
├── start.sh      # khởi động server + mở trình duyệt
├── README.md     # tài liệu này
└── .gitignore
```

## 🔒 Bảo mật

- App **không bao giờ** hỏi seed phrase / private key. Mọi giao dịch ký qua popup MetaMask.
- Chỉ dùng cho **testnet Sepolia**. Không dùng với tài sản thật trên mainnet.
- Faucet và token ở đây chỉ có giá trị thử nghiệm, **không có giá trị tiền thật**.
