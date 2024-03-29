USE [master]
GO
/****** Object:  Database [SQLJAVA]    Script Date: 1/22/2024 1:19:24 PM ******/
CREATE DATABASE [SQLJAVA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLJAVA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SQLJAVA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQLJAVA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SQLJAVA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SQLJAVA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLJAVA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLJAVA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLJAVA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLJAVA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLJAVA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLJAVA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLJAVA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQLJAVA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLJAVA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLJAVA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLJAVA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLJAVA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLJAVA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLJAVA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLJAVA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLJAVA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SQLJAVA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLJAVA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLJAVA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLJAVA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLJAVA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLJAVA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLJAVA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLJAVA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SQLJAVA] SET  MULTI_USER 
GO
ALTER DATABASE [SQLJAVA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLJAVA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLJAVA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLJAVA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQLJAVA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQLJAVA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SQLJAVA] SET QUERY_STORE = ON
GO
ALTER DATABASE [SQLJAVA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SQLJAVA]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 1/22/2024 1:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TenBan] [nvarchar](255) NOT NULL,
	[TrangThai] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/22/2024 1:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaThucDon] [int] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/22/2024 1:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NOT NULL,
	[MaBan] [int] NOT NULL,
	[NGAY] [datetime] NULL,
	[TienNhap] [int] NULL,
	[TongTien] [int] NULL,
	[TrangThai] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 1/22/2024 1:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[HoTen] [nvarchar](255) NULL,
	[GioiTinh] [nvarchar](255) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Sdt] [nvarchar](10) NULL,
	[ChucVu] [nvarchar](255) NULL,
	[CaLam] [nvarchar](255) NULL,
	[Luong] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/22/2024 1:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](255) NULL,
	[MatKhau] [nvarchar](255) NULL,
	[Quyen] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThucDon]    Script Date: 1/22/2024 1:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThucDon](
	[MaDoUong] [int] IDENTITY(1,1) NOT NULL,
	[TenDoUong] [nvarchar](255) NULL,
	[GiaNhap] [int] NULL,
	[GiaBan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDoUong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (5, N'1', N'Trống')
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (6, N'2', N'Trống')
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (7, N'3', N'Trống')
SET IDENTITY_INSERT [dbo].[Ban] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (12, 12, 1, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (13, 13, 3, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (14, 13, 3, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (15, 13, 2, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (16, 14, 1, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (17, 15, 3, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (18, 16, 1, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [MaHoaDon], [MaThucDon], [SoLuong]) VALUES (19, 16, 2, 1)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [NGAY], [TienNhap], [TongTien], [TrangThai]) VALUES (12, 19, 5, CAST(N'2024-01-20T14:13:48.527' AS DateTime), 20000, 24000, N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [NGAY], [TienNhap], [TongTien], [TrangThai]) VALUES (13, 20, 6, CAST(N'2024-01-20T14:15:33.340' AS DateTime), 39000, 50000, N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [NGAY], [TienNhap], [TongTien], [TrangThai]) VALUES (14, 18, 5, CAST(N'2024-01-20T23:40:09.247' AS DateTime), 10000, 12000, N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [NGAY], [TienNhap], [TongTien], [TrangThai]) VALUES (15, 18, 5, CAST(N'2024-01-20T23:50:24.377' AS DateTime), 24000, 30000, N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaNhanVien], [MaBan], [NGAY], [TienNhap], [TongTien], [TrangThai]) VALUES (16, 18, 6, CAST(N'2024-01-20T23:51:28.040' AS DateTime), 35000, 44000, N'Đã thanh toán')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [ChucVu], [CaLam], [Luong]) VALUES (18, 1, N'Nhựt Trường', N'Nam', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'ĐH Đồng Tháp', N'1234567890', N'Quản Lý', N'Fulltime', N'1e+006')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [ChucVu], [CaLam], [Luong]) VALUES (19, 2, N'Tuấn Kiệt', N'Nam', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'ĐH Đồng Tháp', N'1234567890', N'Nhân Viên', N'Fulltime', N'1e+006')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [ChucVu], [CaLam], [Luong]) VALUES (20, 3, N'Ngọc Hân', N'Nữ', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'ĐH Đồng Tháp', N'1234567890', N'Nhân Viên', N'Fulltime', N'1e+006')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [ChucVu], [CaLam], [Luong]) VALUES (21, 4, N'Xuân Mai', N'Nữ', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'ĐH Đồng Tháp', N'1234567890', N'Nhân Viên', N'Fulltime', N'1e+006')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [ChucVu], [CaLam], [Luong]) VALUES (22, 5, N'Duy Quang', N'Nam', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'ĐH Đồng Tháp', N'1234567890', N'Nhân Viên', N'Fulltime', N'1e+006')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaTaiKhoan], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [ChucVu], [CaLam], [Luong]) VALUES (23, 6, N'Phước Hưỡng', N'Nam', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'ĐH Đồng Tháp', N'1234567890', N'Nhân Viên', N'Fulltime', N'1e+006')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (1, N'admin', N'122333', N'Quản Lý')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (2, N'user1', N'1', N'Nhân Viên')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (3, N'user2', N'2', N'Nhân Viên')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (4, N'user3', N'3', N'Nhân Viên')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (5, N'user4', N'4', N'Nhân Viên')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (6, N'user5', N'5', N'Nhân Viên')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThucDon] ON 

INSERT [dbo].[ThucDon] ([MaDoUong], [TenDoUong], [GiaNhap], [GiaBan]) VALUES (1, N'cafe', 10000, 12000)
INSERT [dbo].[ThucDon] ([MaDoUong], [TenDoUong], [GiaNhap], [GiaBan]) VALUES (2, N'trà sữa', 15000, 20000)
INSERT [dbo].[ThucDon] ([MaDoUong], [TenDoUong], [GiaNhap], [GiaBan]) VALUES (3, N'Bạc xĩu', 12000, 15000)
SET IDENTITY_INSERT [dbo].[ThucDon] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [TaiKhoan_pk2]    Script Date: 1/22/2024 1:19:25 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [TaiKhoan_pk2] UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [NGAY]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [ChiTietHoaDon_HoaDon_MaHoaDon_fk] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [ChiTietHoaDon_HoaDon_MaHoaDon_fk]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [ChiTietHoaDon_ThucDon_MaDoUong_fk] FOREIGN KEY([MaThucDon])
REFERENCES [dbo].[ThucDon] ([MaDoUong])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [ChiTietHoaDon_ThucDon_MaDoUong_fk]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [HoaDon_Ban_MaBan_fk] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [HoaDon_Ban_MaBan_fk]
GO
ALTER TABLE [dbo].[HoaDon]  WITH NOCHECK ADD  CONSTRAINT [HoaDon_NhanVien_MaNhanVien_fk] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [HoaDon_NhanVien_MaNhanVien_fk]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [NhanVien_TaiKhoan_MaTaiKhoan_fk] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [NhanVien_TaiKhoan_MaTaiKhoan_fk]
GO
USE [master]
GO
ALTER DATABASE [SQLJAVA] SET  READ_WRITE 
GO
