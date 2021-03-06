USE [ShopThoiTrang]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Login]    Script Date: 7/1/2020 11:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc Sp_Login
	@username nvarchar(20),
	@password nvarchar(20)
as
begin
	declare @loainguoidung int
	declare @res int
	select @loainguoidung = LoaiNguoiDung from NguoiDung where username = @username and password = @password
	if @loainguoidung >= 0
		if @loainguoidung < 1
			set @res = 0
		else
			set @res = 1
	else
		set @res = -1
	select @res
end