import java.sql.*;
import java.util.Scanner;

public class MainProgram {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        String url = "jdbc:mysql://localhost:3306/toko1";
        String user = "root";
        String password = ""; // Ganti sesuai setting kamu

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("Koneksi ke database sukses!");

            System.out.print("Kode Barang: ");
            String kode = input.nextLine();

            System.out.print("Nama Barang: ");
            String nama = input.nextLine();

            System.out.print("Harga Barang: ");
            int harga = Integer.parseInt(input.nextLine());

            System.out.print("Stok Barang: ");
            int stok = Integer.parseInt(input.nextLine());

            CallableStatement stmt = conn.prepareCall("{call insertBarang(?, ?, ?, ?)}");
            stmt.setString(1, kode);
            stmt.setString(2, nama);
            stmt.setInt(3, harga);
            stmt.setInt(4, stok);
            stmt.execute();
            System.out.println("Data berhasil disimpan!");

            Statement viewStmt = conn.createStatement();
            ResultSet rs = viewStmt.executeQuery("SELECT * FROM view_barang");

            System.out.println("\n📦 Data Barang dari View:");
            while (rs.next()) {
                System.out.println("Kode: " + rs.getString("kode"));
                System.out.println("Nama: " + rs.getString("nama"));
                System.out.println("Harga: " + rs.getInt("harga"));
                System.out.println("Stok: " + rs.getInt("stok"));
                System.out.println("Total Nilai: " + rs.getInt("total_nilai"));
                System.out.println("-------------------------");
            }

        } catch (SQLException e) {
            System.out.println("Koneksi gagal: " + e.getMessage());
        } catch (NumberFormatException e) {
            System.out.println("Harga/Stok harus berupa angka.");
        }
    }
}
