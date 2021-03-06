USE [医院管理系统]
GO
/****** Object:  StoredProcedure [dbo].[allpepole]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[allpepole]
as
select 挂号号码, 床号, 姓名, 性别, 年龄, 级别,进出实况 from bedpeople

GO
/****** Object:  StoredProcedure [dbo].[bedgua]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bedgua]  -----住院查找病人挂号的信息
as
select 挂号号码, 姓名, 性别,年龄,日期 from guahao

GO
/****** Object:  StoredProcedure [dbo].[bedin]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bedin]
--新建床位
@hID nvarchar(10),
@层数 int,
@层间数 int,
@间床数 int
as
insert into dongtable(栋号,层数,层间数,间床数)
values(@hID,@层数,@层间数,@间床数)
declare
@SA int,
@SB int,
@SC int,
@bedID nvarchar(20)
Set @SA=1
while @SA<=@层数
 begin
  Set @SB=1
  while @SB<=@层间数
   begin
   Set @SC=1
   if @SC<=@间床数 
    begin   
if @SB>=10
      Set @bedID=@hID+ltrim(str(@SA))+ltrim(str(@SB))+ltrim(str(@SC))
    else    
      Set @bedID=@hID+ltrim(str(@SA))+'0'+ltrim(str(@SB))+ltrim(str(@SC))
     end   
    insert into bednum(床号,栋号) values(@bedID,@hID)
    Set @SB=@SB+1
   End
  Set @SA=@SA+1
 end

GO
/****** Object:  StoredProcedure [dbo].[bedup]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bedup]
@床号 nvarchar(20),
@挂号号码 nvarchar(10),
@姓名 nvarchar(20),
@性别 nvarchar(10),
@年龄 nvarchar(10),
@级别 nvarchar(10),
@负责人 nvarchar(50),
@进出实况 nvarchar(20)
as
insert into bedpeople(挂号号码, 床号, 姓名, 性别, 年龄, 级别,负责人,进出实况)
values(@挂号号码,@床号,@姓名,@性别,@年龄,@级别,@负责人,@进出实况)
update bednum
set 进出实况=@进出实况 
where 床号=@床号

GO
/****** Object:  StoredProcedure [dbo].[checkpwd]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[checkpwd]
@useid nvarchar(40),
@pwd   nvarchar(50),
@rights nvarchar(40),
@pass  nvarchar(20)  output
 as
  if len(@rights)=0
   begin  --用户名和密码的验证
    Select @pass=useid from useinfo where useid=@useid and pwd=@pwd
     if @pass is null
      Set @pass='Nopasscheck'
   end
  else
   begin  --用户权限的验证
    Select @pass=rights from useright,useinfo
     where useright.useid=@useid and useinfo.pwd=@pwd 
           and rights=@rights 
           and useinfo.useid=useright.useid
    if @pass is null
     Set @pass ='Norights'
  end

GO
/****** Object:  StoredProcedure [dbo].[chuyuan]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[chuyuan]   ----出院
@床号 nvarchar(20),
@挂号号码 nvarchar(10),
@姓名 nvarchar(20),
@性别 nvarchar(10),
@年龄 nvarchar(10),
@级别 nvarchar(10),
@负责人 nvarchar(50),
@进出实况 nvarchar(20)
as
update bedpeople
set 挂号号码=@挂号号码, 姓名=@姓名, 性别=@性别, 年龄=@年龄, 级别=@级别, 负责人=@负责人, 进出实况=@进出实况
where 床号=@床号
update bednum
set 
进出实况=@进出实况 where 床号=@床号

GO
/****** Object:  StoredProcedure [dbo].[del]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[del]-----医生信息的删除
@id int
as
delete from imimage where ids=@id

GO
/****** Object:  StoredProcedure [dbo].[delmima]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delmima]
@num nvarchar(20)
as
delete from useright where useid=@num
delete  from useinfo where useid=@num

GO
/****** Object:  StoredProcedure [dbo].[gai11]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gai11]    ----显示全部的详细信息
@id nvarchar(20)
as
select useid, usename, pwd, sex, addr, phone from useinfo where useid=@id

GO
/****** Object:  StoredProcedure [dbo].[gh]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[gh]    ----显示全部的详细信息
@id int
as
select 挂号号码, 姓名, 年龄, 性别 from guahao where 挂号号码=@id

GO
/****** Object:  StoredProcedure [dbo].[guafill]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[guafill]
as
select * from guahao

GO
/****** Object:  StoredProcedure [dbo].[guahao1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[guahao1]   --挂号
@name nvarchar(40),              
@age nvarchar(10),
@sex nvarchar(10),
@xing nvarchar(20),
@money nvarchar(10),
@bingli nvarchar(10),
@add nvarchar(50)
as
insert into guahao(姓名, 年龄, 性别, 类型,挂号费用, 病历, 地址)
values(@name,@age,@sex,@xing,@money,@bingli,@add)

GO
/****** Object:  StoredProcedure [dbo].[guahaocz]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[guahaocz]                         --医生里的查找
@sel nvarchar(20),
@name nvarchar(50)
as
if len(@sel) <>0
Set @sel='%'+@sel+'%'
else  
set @sel='%'
if len(@name) <>0
Set @name='%'+@name+'%'
else  
set @name='%'
select * from guahao where 挂号号码 like @sel and 姓名 like @name

GO
/****** Object:  StoredProcedure [dbo].[hh1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hh1]                               --全部查找
as
select * from imimage

GO
/****** Object:  StoredProcedure [dbo].[jiuzhen1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[jiuzhen1]--就诊存储过程
@挂号号码 bigint, --FOREIGN KEY references guahao(挂号号码),
@姓名 nvarchar(40),-- FOREIGN KEY references guahao(姓名),
@年龄 nvarchar(10), --FOREIGN KEY references guahao(年龄),
@性别 nvarchar(10), --FOREIGN KEY references guahao(性别),
@住院 nvarchar(20),
@手术 nvarchar(20),
@实验 nvarchar(20),
@诊断病况 nvarchar(100),
@所开药方 nvarchar(100),
@调剂 nvarchar(100),
@复核 nvarchar(100),
@医师 nvarchar(20)
as 
insert into jiuzhen(挂号号码, 姓名, 年龄, 性别, 住院, 手术, 实验, 诊断病况, 所开药方, 调剂, 复核, 医师)
values(@挂号号码, @姓名, @年龄, @性别, @住院, @手术, @实验, @诊断病况, @所开药方, @调剂, @复核, @医师)

GO
/****** Object:  StoredProcedure [dbo].[jz]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[jz]    ----显示全部的详细信息
@id int
as
select 挂号号码, 姓名, 年龄, 性别, 住院, 手术, 实验, 诊断病况, 所开药方, 调剂, 复核, 医师, 日期 from jiuzhen where 挂号号码=@id

GO
/****** Object:  StoredProcedure [dbo].[jzzhao]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[jzzhao]

as
select 挂号号码, 姓名, 年龄, 性别, 住院, 手术, 实验, 诊断病况, 所开药方, 调剂, 复核, 医师, 日期 from jiuzhen

GO
/****** Object:  StoredProcedure [dbo].[mimagai]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mimagai]
 @useid nvarchar(20),
  @pwd   nvarchar(20),
  @rights nvarchar(40)
as
update useinfo
set pwd=@pwd where useid=@useid
update useright
set rights=@rights where useid=@useid

GO
/****** Object:  StoredProcedure [dbo].[myimin1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[myimin1]
@mydata image,
@姓名 nvarchar(20),
@性别 nvarchar(10),
@出生年月 nvarchar(20),
@籍贯 nvarchar(20),
@种族 nvarchar(20),
@政治面貌 nvarchar(20),
@学历 nvarchar(20),
@职务 nvarchar(20),
@电话 nvarchar(20),
@邮箱 nvarchar(20),
@家庭地址 nvarchar(50)
as
insert into imimage(myimdata,姓名, 性别, 出生年月, 籍贯, 种族, 政治面貌, 学历, 职务, 电话, 邮箱, 家庭地址)
values(@mydata,@姓名, @性别, @出生年月, @籍贯, @种族, @政治面貌, @学历, @职务, @电话, @邮箱, @家庭地址)

GO
/****** Object:  StoredProcedure [dbo].[myimsel1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[myimsel1]                              --show.aspx
@ids int
as
select * from imimage where ids = @ids

GO
/****** Object:  StoredProcedure [dbo].[myinxiu]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[myinxiu]                ----上传和修改
@put nvarchar(12),
@id int,
@mydata image,
@姓名 nvarchar(20),
@性别 nvarchar(10),
@出生年月 nvarchar(20),
@籍贯 nvarchar(20),
@种族 nvarchar(20),
@政治面貌 nvarchar(20),
@学历 nvarchar(20),
@职务 nvarchar(20),
@电话 nvarchar(20),
@邮箱 nvarchar(20),
@家庭地址 nvarchar(50)
as
if @put='上传'
begin
insert imimage(myimdata,姓名, 性别, 出生年月, 籍贯, 种族, 政治面貌, 学历, 职务, 电话, 邮箱, 家庭地址) values(@mydata,@姓名, @性别, @出生年月, @籍贯, @种族, @政治面貌, @学历, @职务, @电话, @邮箱, @家庭地址)
end
else
if @put='修改'
begin
update imimage
set myimdata=@mydata,姓名=@姓名,性别=@性别,出生年月=@出生年月,籍贯=@籍贯,种族=@种族,政治面貌=@政治面貌,学历=@学历,职务=@职务,电话=@电话,邮箱=@邮箱,家庭地址=@家庭地址
where ids=@id
end

GO
/****** Object:  StoredProcedure [dbo].[nan2]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[nan2]   ----显示全部的详细信息
@id int
as
select 挂号号码, 姓名, 性别, 年龄, 疑难病况,过敏药物, 医师, 上传日期 from nanbing where 挂号号码=@id

GO
/****** Object:  StoredProcedure [dbo].[nanbing1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[nanbing1]
@挂号号码 nvarchar(10),
@姓名 nvarchar(50),
@性别 nvarchar(10),
@年龄 nvarchar(10),
@疑难病况 nvarchar(500),
@过敏药物 nvarchar(200),
@医师 nvarchar(50)
as
insert into nanbing(挂号号码,姓名,性别,年龄,疑难病况,过敏药物,医师 )
values(@挂号号码,@姓名,@性别,@年龄,@疑难病况,@过敏药物,@医师)

GO
/****** Object:  StoredProcedure [dbo].[sel]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel]               --查找注册号码
@sel nvarchar(20)
as
if len(@sel) <>0
Set @sel='%'+@sel+'%'
else  
set @sel='%'
select * from guahao where 姓名 like  @sel

GO
/****** Object:  StoredProcedure [dbo].[sel1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel1]
--就诊查找病人信息
@挂号号码 nvarchar(20)
as
if len(@挂号号码) <>0
Set @挂号号码='%'+@挂号号码+'%'
else
set @挂号号码='%'
select * from guahao where 挂号号码 like @挂号号码

GO
/****** Object:  StoredProcedure [dbo].[selall]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selall]
  --@useid nvarchar(20),
  --@usename nvarchar(20),  
  --@sex   nvarchar(2),
  --@addr  nvarchar(50),
  --@phone nvarchar(20)
as
select * from useinfo

GO
/****** Object:  StoredProcedure [dbo].[select1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select1]                         --医生里的查找
@sel nvarchar(20),
@name nvarchar(50)
as
if len(@sel) <>0
Set @sel='%'+@sel+'%'
else  
set @sel='%'
if len(@name) <>0
Set @name='%'+@name+'%'
else  
set @name='%'
select * from imimage where ids like @sel and 姓名 like @name

GO
/****** Object:  StoredProcedure [dbo].[selgua]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selgua]     ----挂号住院模糊查找
@name nvarchar(40)
as
if len(@name) <>0
Set @name='%'+@name+'%'
else  
set @name='%'

select  挂号号码, 姓名, 年龄, 性别,日期 from guahao where  姓名=@name

GO
/****** Object:  StoredProcedure [dbo].[seljz]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[seljz]     ----病人住院模糊查找

@挂号号码 nvarchar(20)
as
if len(@挂号号码) <>0
Set @挂号号码='%'+@挂号号码+'%'
else
set @挂号号码='%'
select 挂号号码, 姓名, 年龄, 性别, 住院, 手术, 实验, 诊断病况, 所开药方, 调剂, 复核, 医师, 日期 from jiuzhen where  挂号号码 like @挂号号码

GO
/****** Object:  StoredProcedure [dbo].[selnan]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selnan]    ----病人住院模糊查找
@挂号号码 nvarchar(20)
as
if len(@挂号号码) <>0
Set @挂号号码='%'+@挂号号码+'%'
else
set @挂号号码='%'
select 挂号号码, 姓名, 性别, 年龄, 疑难病况,过敏药物,医师, 上传日期 from nanbing where  挂号号码 like @挂号号码

GO
/****** Object:  StoredProcedure [dbo].[selnan1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selnan1]
as
select 挂号号码, 姓名, 性别, 年龄, 疑难病况,过敏药物, 医师, 上传日期 from nanbing

GO
/****** Object:  StoredProcedure [dbo].[selpe]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selpe]     ----病人住院模糊查找
(
@name nvarchar(20),
@num nvarchar(10),
@进出实况 nvarchar(20)
)
as
if len(@name) <>0
Set @name='%'+@name+'%'
else
set @name='%'
 if len(@num) <>0
Set @num='%'+@num+'%'
else
set @num='%'
select 挂号号码, 床号, 姓名, 性别, 年龄, 级别,进出实况 from bedpeople where  姓名 like @name and 挂号号码 like @num and 进出实况=@进出实况

GO
/****** Object:  StoredProcedure [dbo].[tian]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[tian]    ----住院修改前先填充
as
select 床号, 栋号,进出实况 from bednum

GO
/****** Object:  StoredProcedure [dbo].[update1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update1]
 @useid nvarchar(20),
 @pwd   nvarchar(20)
as
update useinfo
set pwd=@pwd where useid=@useid

GO
/****** Object:  StoredProcedure [dbo].[xiangxi]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[xiangxi]    ----修改把全全部的信息读入，全部显示
@id int
as
select ids,  姓名, 性别, 出生年月, 籍贯, 种族, 政治面貌, 学历, 职务, 电话, 邮箱, 家庭地址 from imimage where ids=@id

GO
/****** Object:  StoredProcedure [dbo].[ysheng]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ysheng]   ----绑定医生
as
select 姓名 from imimage where 职务='医生'

GO
/****** Object:  StoredProcedure [dbo].[z1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z1]
as
select 挂号号码, 姓名, 年龄, 性别 from guahao

GO
/****** Object:  StoredProcedure [dbo].[z2]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z2]
as
select * from bedpeople

GO
/****** Object:  StoredProcedure [dbo].[z3]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z3]
@id int
as
select 挂号号码, 床号, 姓名, 性别 from bedpeople where 挂号号码=@id

GO
/****** Object:  StoredProcedure [dbo].[z4]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z4]                      
@num nvarchar(10)
as
if len(@num) <>0
Set @num='%'+@num+'%'
else  
set @num='%'

select * from bedpeople where 挂号号码 like @num

GO
/****** Object:  StoredProcedure [dbo].[z5]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z5]
@num nvarchar(20)
as
delete from bedpeople where 挂号号码=@num

GO
/****** Object:  StoredProcedure [dbo].[z6]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z6]
@num nvarchar(20)
as
delete from guahao where 挂号号码=@num

GO
/****** Object:  StoredProcedure [dbo].[zhuce]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[zhuce]--=医生注册
  @useid nvarchar(20),
  @usename nvarchar(20),  
  @pwd   nvarchar(20),
  @sex   nvarchar(2),
  @addr  nvarchar(50),
  @rights nvarchar(40),
  @phone nvarchar(20)
as
insert into useinfo(useid, usename, pwd, sex, addr, phone)
values(@useid, @usename, @pwd, @sex, @addr, @phone)
insert into useright(useid, rights)
values(@useid, @rights)

GO
/****** Object:  StoredProcedure [dbo].[zhuce1]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[zhuce1]   ------医生注册
  @usename nvarchar(20),
  @usepwd nvarchar(20),
  @usekebie nvarchar(20),
  @sex nvarchar(2),
  @addre nvarchar(50),
  @phone nvarchar(20)
as
insert into zhuce(usename, usepwd, usekebie, sex, addre, phone)
values(@usename,@usepwd,@usekebie,@sex,@addre, @phone)

GO
/****** Object:  StoredProcedure [dbo].[zhuy]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[zhuy]   ----绑定医生
as
select 姓名 from imimage where 职务='护士'

GO
/****** Object:  StoredProcedure [dbo].[zhuyuan]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[zhuyuan]
as
select 床号, 挂号号码, 姓名, 性别, 年龄, 级别, 负责人,进出实况 from bedpeople where 挂号号码='空'

GO
/****** Object:  StoredProcedure [dbo].[zy]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[zy]   ----显示全部的详细信息
@id int
as
select 床号, 栋号 from bednum where 床号=@id

GO
/****** Object:  Table [dbo].[bednum]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bednum](
	[床号] [nvarchar](20) NULL,
	[栋号] [nvarchar](10) NULL,
	[进出实况] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bedpeople]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bedpeople](
	[挂号号码] [nvarchar](10) NOT NULL,
	[床号] [nvarchar](20) NOT NULL,
	[姓名] [nvarchar](20) NULL,
	[性别] [nvarchar](10) NULL,
	[年龄] [nvarchar](10) NULL,
	[级别] [nvarchar](10) NULL,
	[负责人] [nvarchar](50) NULL,
	[进出实况] [nvarchar](20) NULL,
 CONSTRAINT [PK__bedpeople__78B3EFCA] PRIMARY KEY CLUSTERED 
(
	[挂号号码] ASC,
	[床号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dongtable]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dongtable](
	[栋号] [nvarchar](10) NOT NULL,
	[层数] [int] NULL,
	[层间数] [int] NULL,
	[间床数] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[栋号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gonggao]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gonggao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Summary] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_gonggao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[guahao]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guahao](
	[挂号号码] [bigint] IDENTITY(20050001,1) NOT NULL,
	[姓名] [nvarchar](40) NULL,
	[年龄] [nvarchar](10) NULL,
	[性别] [nvarchar](10) NULL,
	[类型] [nvarchar](20) NULL,
	[挂号费用] [nvarchar](10) NULL,
	[病历] [nvarchar](10) NULL,
	[地址] [nvarchar](50) NULL,
	[日期] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[挂号号码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[imimage]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imimage](
	[ids] [bigint] IDENTITY(360001,1) NOT NULL,
	[myimdata] [image] NULL,
	[姓名] [nvarchar](20) NULL,
	[性别] [nvarchar](10) NULL,
	[出生年月] [nvarchar](20) NULL,
	[籍贯] [nvarchar](20) NULL,
	[种族] [nvarchar](20) NULL,
	[政治面貌] [nvarchar](20) NULL,
	[学历] [nvarchar](20) NULL,
	[职务] [nvarchar](20) NULL,
	[电话] [nvarchar](20) NULL,
	[邮箱] [nvarchar](20) NULL,
	[家庭地址] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ids] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jiuzhen]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jiuzhen](
	[挂号号码] [bigint] NOT NULL,
	[姓名] [nvarchar](40) NULL,
	[年龄] [nvarchar](10) NULL,
	[性别] [nvarchar](10) NULL,
	[住院] [nvarchar](20) NULL,
	[手术] [nvarchar](20) NULL,
	[实验] [nvarchar](20) NULL,
	[诊断病况] [nvarchar](100) NULL,
	[所开药方] [nvarchar](100) NULL,
	[调剂] [nvarchar](100) NULL,
	[复核] [nvarchar](100) NULL,
	[医师] [nvarchar](20) NULL,
	[日期] [datetime] NULL,
 CONSTRAINT [PK_jiuzhen] PRIMARY KEY CLUSTERED 
(
	[挂号号码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nanbing]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nanbing](
	[挂号号码] [nvarchar](10) NOT NULL,
	[姓名] [nvarchar](50) NULL,
	[性别] [nvarchar](10) NULL,
	[年龄] [nvarchar](10) NULL,
	[疑难病况] [nvarchar](500) NULL,
	[过敏药物] [nvarchar](200) NULL,
	[医师] [nvarchar](50) NULL,
	[上传日期] [datetime] NULL,
 CONSTRAINT [PK_nanbing] PRIMARY KEY CLUSTERED 
(
	[挂号号码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[useinfo]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[useinfo](
	[useid] [nvarchar](20) NOT NULL,
	[usename] [nvarchar](20) NULL,
	[pwd] [nvarchar](20) NULL,
	[sex] [nvarchar](2) NULL,
	[addr] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[useid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[useright]    Script Date: 2016/4/27 23:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[useright](
	[useid] [nvarchar](20) NOT NULL,
	[rights] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[useid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11011', N'b1', N'进院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11021', N'b1', N'进院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12011', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13011', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14011', N'b1', N'进院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b14101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15011', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b15101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b21011', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b21021', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b22011', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b22021', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b23011', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b23021', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b24011', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b24021', N'b2', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b31011', N'b3', N'进院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b31021', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b31031', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b31041', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b31051', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b32011', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b32021', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b32031', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b32041', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b32051', N'b3', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11011', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11111', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b11121', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12011', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12081', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12111', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b12121', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13011', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13021', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13031', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13041', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13051', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13061', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13071', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13081', N'b1', N'出院')
GO
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13091', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13101', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13111', N'b1', N'出院')
INSERT [dbo].[bednum] ([床号], [栋号], [进出实况]) VALUES (N'b13121', N'b1', N'出院')
INSERT [dbo].[bedpeople] ([挂号号码], [床号], [姓名], [性别], [年龄], [级别], [负责人], [进出实况]) VALUES (N'20050010', N'b31011', N'令狐冲', N'男', N'22', N'高级', N'12', N'进院')
INSERT [dbo].[dongtable] ([栋号], [层数], [层间数], [间床数]) VALUES (N'b1', 5, 10, 1)
INSERT [dbo].[dongtable] ([栋号], [层数], [层间数], [间床数]) VALUES (N'b2', 4, 2, 1)
INSERT [dbo].[dongtable] ([栋号], [层数], [层间数], [间床数]) VALUES (N'b3', 2, 5, 1)
SET IDENTITY_INSERT [dbo].[gonggao] ON 

INSERT [dbo].[gonggao] ([ID], [Title], [Summary], [Content], [CreateTime]) VALUES (2, N'啊啊啊', N'333', N'434343434', CAST(0x0000A5F501859D6B AS DateTime))
INSERT [dbo].[gonggao] ([ID], [Title], [Summary], [Content], [CreateTime]) VALUES (3, N'水库水口山', N'士大夫十分', N'钱钱钱钱钱', CAST(0x0000A5F50188240D AS DateTime))
SET IDENTITY_INSERT [dbo].[gonggao] OFF
SET IDENTITY_INSERT [dbo].[guahao] ON 

INSERT [dbo].[guahao] ([挂号号码], [姓名], [年龄], [性别], [类型], [挂号费用], [病历], [地址], [日期]) VALUES (20050010, N'令狐冲', N'22', N'男', N'急诊', N'自费', N'要病历', N'华山之巅', CAST(0x0000A4BB00A6FC55 AS DateTime))
INSERT [dbo].[guahao] ([挂号号码], [姓名], [年龄], [性别], [类型], [挂号费用], [病历], [地址], [日期]) VALUES (20050011, N'', N'', N'', N'普通', N'', N'', N'', CAST(0x0000A5F30188FDE0 AS DateTime))
SET IDENTITY_INSERT [dbo].[guahao] OFF
SET IDENTITY_INSERT [dbo].[imimage] ON 

INSERT [dbo].[imimage] ([ids], [myimdata], [姓名], [性别], [出生年月], [籍贯], [种族], [政治面貌], [学历], [职务], [电话], [邮箱], [家庭地址]) VALUES (360001, 0xFFD8FFE000104A46494600010100000100010000FFDB0084000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F1718161418121415140103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC000110800C800C803011100021101031101FFC401A20000010501010101010100000000000000000102030405060708090A0B100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FA0100030101010101010101010000000000000102030405060708090A0B1100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD4A1D4D002D001400500140050021E05007C4BFB7CFED103C11E47862D2E840CE99B970F8196076A93DBDF3EBED584AF37CA8497567E75FC64B97FEC3B5B0B79257524DE5CDE4C70666724C601E380B938FF6969D0B73DCDA5B1C8E9D6DF6BF03E897AA59AFED5A4B6963ECE170E178E7712718EFB70391CF449FBCD19F43A0D3B52B4BAD3E28E7BD30CB2AAC96B7D10F9FDC0ECCCBC038CF4CE3B373B4E2EE8BBDF4647AC6B71DA6A483518A4B5BE71837702E6DEEB1C02DC7CA78CFE631C7169396C1B6873B7510B4114B6D20F3618D76918F9981247E7E9ED5AA6DE841D7784752B2D2EFA509F222320F2148F9237276364FF74FC873D415F4358548B7B1A23B1D67C1F65A9DA3184F990DDA343F22E183166231DB3C9FD7DAB9F9DC58ED73CBB42D6AF3C15E223776974BFD90E5A19CFF00CB194060036D6E5875F703BFA75C92A91F323E13D7748B1B8F15D85FCFE1E9EDA785A40DE57DA3E6B5954E304F5087B3107047A66B95AE56949177B9E97F02BC71AAF8635BB7D49D07F6F69377BA4B499B0E4AFDF8DC8F5E79EFBBBE2B397B92BA15AE8FD1BF827FB40F873E35E9CEDA6B9B4D5A040F75A64EC3CE839C723AF5F6E3BD7745F32B98EC7A9550C2800A002800A0028010753400B4005001400500140199E23D663F0F6857FA94A3725AC2D2EC1D5881C28F72703F1A9607E427ED77A36A9A9FC55BE17D7F6DA9C92FFCB327E5F3CED2CAC490BB14FA918CD6716A2DF7296A780FC59F13A6BFF65B2B391AE9915A6B8B954D8923B65378047DDE9B47A0CF7AD2846CDC9952DAC1E0AB583FE1151A65FCFE526AEB32C53CB9C473C6A02E38C0CF99CF273C0E29557EFDE224B4303C3D6178EF77A65C591BB552643A786C481867E781BA6F007439C815B49A7A9276FF00683E23F0DA4BA6DC45757D6C4AC90CD11491C00A30E8463791C13D0E01AE74B95D996B5390D63494934ECDBC6D6A1FE636F3360452023E5DC7B1CE39F53DC1ADE0DDF513B18775E2A9B4BD3F4DD4E1C19E58DA19E3718DFB5BB8F4238C76C7D2B554F99B88B9ADA9EF5F083C4763AC686CD04C21601DE0DE0B18DB0B9C0ED8E38E41CB63038AF36BC1C597077327E23FC3EB09F41866B5669A6B85731471636A40BD5BF365E7FDF3DE9D1ABCB2D424AE8F14F0CA6A7A5DF35EE9772F692C370B02BA4870C4AB92879E72139C74E3A57A13E592F78CF67A1E8D0FC6BF10DB6AC609ED209B54B697CA5BEC61E48D4FDC94630C70472466B9A54236BA65291EFBF0ABE2BEB1E06F88BE17F1869896F6F35F5C25B9B79E71B64F306D78DDB390AD8539C71D4F418C69E8DA091FB01192506EC671CE2BA481F4005001400500140083A9A005A002800A002800A00F28FDA4FC670F83BE186A33302F34CC89185E48C10C5BF0C74EFD056351D9025767E3FF00C48934CF14F8D2DCCB777905AAA0B9D467799F714243639380C41E8071CF7ACE95D45B66EF43C8A2D5878BBC4535CDBDB18A39A6222B6CFF00CB2E3628EE4818E98FE55D8E3C90213BB3BFF1FDB36A3E15B186D2F60864B09CB98E722195370C36EDC00EC0939C64738C572D27EF3B8E4BB163C2FE1ABED76D215430A6AF000D1CD1DCC637107860C0E0E002073C827AE38253E576E834AFA97F5B912DAF20B9D72D64D1357886C7D4E184F9737A0B88C7E23729E467D8D0B5565AA0D8E435EB0372CD716AB0DEAFF179441560719391DBD49E9C64E0E4F445E96666D58F2AD7668A49268111C228631A3758CFF12FD327AD76C3A324D7F86DE2BD43C2DA74CF6D284C48CCBBB1F292BFC20FE19FC2B3AF053638686F4DF15D974492C0CED3DE4A04413F823451F2E4FB7271EA493C81582C3EB7E85F315BC257FE65B949B6144BC82F444B900A224C8C4F7F9BCC1D79C2FBD54D58846B68FA9D86AFABEAD39F955DE29E491F83BF691263D37120D434E290FB9D25ADCDCE951C96ACCCB043B65B697246D62786E3A8DC3A827BFA8ACF46C3A1FA9DFB25FED8F71F1AA2B7D27C4DA7D8E99AB9408935A4E4ACEC00E4A374DDCF2ACC323B6572EEB625AB1F56839AA016800A002800A0041D4D002D001400500140087A54B03E52FDAF6EE49FC2778010B656F21DF24C721883F740F4E4FE958D6BB8843467E5A7C5B89A1D2AEAFADA63234B3199F69CEC8F3B47D79383F853C3BD6CCD65E4796786F6DC6AC59E225525520C4DF321E791D8FF009E466BB6A688514763ADDDC9ACEB9234B323BAAB32BBB847F9864A956396C1EE33C753D2B9A0ACB42DEE50596D74AB836D78CF12CE1248A74380483907231D4707EB9ED5ADAEAFB99BDC97C43797135B44C2FA5BB77051448C4B85EA33CF38E878EE3D6945453D8BB7438CF2AF9656B7895D26EEF1F03FC0574FBAF53269EC676B1A75EC32191A7698F59013927D4E6B48CA20E2D124565A8BE9C365B4B1C20121D62E1BF1C726A5C95C12D0A967A0CA1F2D1C81DBD54E7F01DCD375131F29DB7822D63B297549AE0E59ACA64D99C10769E3DCE33F9572D47A685A5627D2F4D3A778C75BB3C048D63F2197190982A99FC09FD29CA5EEA6C94B5B1D3CBAEB2787AF74EB88C3CB66E04787CB471E180DBED9007FC047AD636F7AE56C8F64FD92B534FF008591E0F375318920D5EDE44911C8DA19C6E5FA1E739F45F41595476911BA3F6963181FE35B923E800A002800A0041D4D002D00140050014008DD2803E1FF00DBE3C7DA4691A33F876DE451A8101C1CB379670C4F03B9F97AF7AE7A92BD91505ADCFCC4D52EEFA5B7BA8AFE155536ECDB1431F354B060B9624AF231C6383D3A1ADA2A37562F531FC0D672DD5FC3308D63567E63DBD39E067AE39C739AAAF24958714753F1C3C3EDA2DDE9D750C62DD658012A99C96C9E7193EC3FC38AC30B3BDD1A491C17EFB53B1B5D3A442E647F3201D1E3248040F5071D3B7E35DBF0BB993573A7F076952697A94326A0905E8B56590E9D72C504EA08CC7BBB1233D7A573549A6B42A299EF1A67C12D13E2C78F2D757F0EE93245A24EE81EC27054C4363960F8EF951C74E41CF22B8FDB4D5E269CA9EA7B1D8FECFF00E19D3B4F169A8E9B6C2385CEF62BF3391C2E4FB0CFE24FB566AA4DEECAB17F5FF843E0BBEF0FC16CB6B6D690C672A631F30E3FFD755CEFB8B43CB3E24784FE1EE81A7ADA5CDFA453C80BA6C650CA3B0CF6CFD7B5545CEF744DD1F3A7FC23D6019DF4DBC59D5DDB6027690BF773F439FD0D75F33EA82C88F4F0749D47539AF80F3AF42C639E49DFE6337BF217F5A6DF3A4919DACEE52B9B982F276B95854C734AD1365B004781B7F566FCAAD26B42773B5F85BAB8F0DEA297F22B1861B8591933B5F018F3CFA63FC6B1A9A8EC7EEA781F5EB5F14784346D5ECA7FB4DADED9C53C729392C1901C9F7F5AD13BA32376A802800A0028010753400B4005001400878140185E29F165A78574F37374247918EC82DE35CBCD21E88BDB3FC8649E01A962B5CFCE0FDB27C15369DE1293C53ADB4A353D4EECCB1DA42CCCB1BBE487627EFB2AFCA00E00E077CE6E362D357B1F9E3AA78B2FACCDE5B1915A7690EF6601C1EDDFAF22BB23493571B91EA1F04EC1BC5177BCC69BD9D5410B8C73D6B8311EEBB1AC7547B3FC47F88FE18D3FEC6963A7C1AF5C58C64452EC12207E01607D063F4CD72D2A72DEE549DCF92F5BF115F8F122DD4366D0B43F2C7F2F031D3A715ED420B96CD98B6CED3E1E6BD75E2CF195AAEB566CF1DD388DE644C618F427F1AC6AC2318FBAC22D9F737C1FB4BBD36E459FD9FC82408964C8C6467FC2BCD8D294DE86AE6A2AF23D1356D0858A4493CDE66721C9F4A9E4717666A9A92BA3E7BFDAA22923D12C9745BFFB348A4AB80C558FE23FFD55D34DAE6D4CA68F92348F833E22F1DEAAD1A5C05CFDE9A56E9F8D773AF0A6B632E46D9E9361FB22788ACAD19A1D6AD5A4032A0BE73F95612C4C5BD8B5068F28F1AE93AE7872EDB4ED6AD9D268090929EFD4673D0D6B0E496B12595BC27669AA891EE25290C03321EF927200F7EFF855CDD811A3A56B135D3DD468FE5C26327CC03710361EDDFA356728A5A88FDAFF00D8E5AF346F84B61E1DBD905D2D8FCF61790EE68A7B49009232AC73F77794C139F941EF52958C99EF63914C62D00140050020EA68016800A002800A008DA0463B8A82DD3245007E6FFF00C14CFC6373A4F882CBC34224B5B1B9B53782E5D1806230A42E30A7191EFF00362A56AF619F997E21B386E208EEA3980790152A7A920E3F51CD76C1D9D847B77ECDBA7C9AA581810362E24F2D8AF0429FBDCF6E01AF3313F19BC5BB1F47F88ACBC09E08D244179A7DB5C4B100712E323F1AE4BC9BB22EC923CD75AD32FF00C5F646E743F03B9B1663E55C491476C8FD394695977FD466BA6309EED85D1E56DABDE786756F2AEEC27D22E81F943A601FA30C83F81AD1C2E1A1F5A7ECB3E389BC77ACFF00645D026744C83DD8565194A84D4D133846AC5C19ECDF1DB47BBF07F866E6FB6B18EDE3DD91EC2B3A951D59393EA5460A9C795743F39BC65F102F75FD4659EEA591A30C42A75FC0575429D95C57B9B9E0DB81691C571A9EAF75A7094334569A56952EA133851B9F254AA02A392376403CE2B6586755E88C2A57852F898FD4BE25457C6193C35E2F96E19D4FEE354B36B0CB0FE057323A96FA902B3961BD9E9246B1A9CEAE8E1BC55E2EB8F16E9656F94B4C0EDCBE772114E30E47A14DDCF3E6764B84B085CC70E77CADDB3DC9F6C76F6AEADD5D98FA1D0F826E23B9BFBC5FE09E231463B82D9553C7D4D65536424CFDC4FD8E347B9D3BF673F004B79B85DCBA4C4CCA4FF01194FD307FE0551B90F73DBA818500140050020EA68016800A002800A002803F3B7FE0ADF64B6BA77C3ED5CE9BF68546BD824B8058103111119E76E0FCC72467E5E081906A376C0FCB2F105C4120315BAAAC0CC5C153C8CF4CF5E702BAE29F503EA9FD8B7419751F0DDE5CC6A5FCA620375C104715E562B499B43629FC6C5F11DA78B7769F6735DCA184513980C91C2E48FDE1E30580E839EE71C0A587E57BB1CAE731F167E1DF8B7C39AE5A9B05FF008485EFAC15165D5F0FE6348A44922994854646C7420A8DA7D6BB672C3AA694B467992F692ACE32D8F5EF04FEC9BAC78CBE0E69C45A7D83C46B7584B895CA432C240C9753F786EDDB580C918E71535A7183563D18C5A7A1F69FECDBFB3869DE01934C9FC8437F0C4166997387603E6233CE33D2BCBBB9CAC6F6E4573DDFE2A7812CBC5BE18B8B4B8443132E1830EB5B4E362294F9DD99F0D7C4DFD8AF47F125BD9DBE9A4E9324772D39962507CF53D6339E98F6AEAA6B99274DDFB91297236A4737FB4E7ECAB7DE2ED1F45FF846EE23D2E6B0B0163F6489FC90AA0B1CA1384218310C0904E1793D294F135E972A8AB9C52C3A955F68DE87875BFEC87E22B5F00DCE992188DDBBA1112B6F2A54633BF8404E7F858F0075AE9AD8C52516FA1E9CB96518A8AB591E73E30F815E2DF03DFF008734D95D669AFBCE97CB1F3644614904FD1BB5723C553E572912A9B7A23CBFC53A5DED96A735825BBA5C48FB19029DC4FF00740C57652926AE6334CB9E1FB4D5FC2DADE9A6FF004EB9B20732013C2F16F0A0F23701919C74ABAAAEBCCCE124DE87EF27EC89ADDB6BFF00B377806E2D18B4716991DA9CF668F3191F9AFE55C51D103DCF61AB00A002800A0041D4D002D00140050014005007CEDFB7D780A5F1F7ECC3E2D8ED2C7FB42FF4D8975286254DCF889B326CEF9F2F7F4A71DC0FC1CD6ACA486F1D541311C1571CE73EBE86BBE32407E8AFFC138BC2E2E7E165D5D4A9F34F7D2274EC00AF1B16EF50E8A4B4D4FB1EEFE1768DA85B0867B385E20776C740431F5E6B89791B3D558BFA57C30B6B683F7512F9618639C053DB1E95D09DC969753ADD1FC2905B132BE240A3963CFEB44F4454127A1D2F85D17ED921450AA06063D2A29EE3AFA44BDE32FB51D1651651ABCC71C36718CF3D3DB35DF6849DAA3B23CF4E695E9ABB3C89678E594DB5D03B18F5E8CA7D41EC6B9E8D6961AA7340EEAB46388A7CB32A7882C6FAC006B8B4FED7B13D278C0122FF00BCBD0D7BAEA617191BB7C92FC0F9FF00618CC23F73DF8FE261C765A75F2E618CC793831CAA14835E16268FB2972F327E87AF86AAEA46F28B4798FED0FF00032EBC6DE1CD3EFF0040D49348F10E95399ED2EBA7C8C36C899E7A8C1E9D54572C69A9A716AE8ED52E57B92FC31FD9B34DB1B4FF0084D75EB0886BD2DBAC66464C28C2E0B20EC5FA96EB8C018E73E94E4B0749CA3F89ABA7071B6ED9F22FEDBBF1C34AF18EA1A7F837C3DA5C76761E1E664139037B48576ED523A0E727D709D369CF060215BDEA95A57E67738AA28C5A8C3A1F777FC12F351D52F7F65AB2875042B1DAEA5730DAB9182F1655B3EFF3330FC2BD196FA1CCF73EBAA002800A0028010753400B40050014005001400C91048855806523041E845007E15FED8FF04E5F86FF00B44F8C2C34F8562D26E6F5EE6DA255DAB189879AAAA3FBB9240EDDAAE3516CF729474B9F4E7FC138BC4305C7C3FD6F48C05B9D2F50DECBD0F9732E51B1EE51C7E15C7885777368763E99D63E2F4CB7F359E93A14DAB0858C4F22CC89860707009AF530980A1521CD56A599E757C5D4A72B42173A1F0EEA3AA6AB1B1D4ADE3D2A127250CDE6381E995217F307A55D4A785A0BF7779B38BDBE3AB4B651474B148D66924AB36E89A2C282DD8753FA8E98AF9FC54ABCEA26AD182E9D4F6B070F67F1DDB2293E29E87F0D3C3CFA9F896FED349B6DA64FB45F4E230DC1DA880F2EE719C01C0E4F519DA9C6CAECDEB6BA1B1E09F8C3A17C42D3E2B8B3BAB768E7B7F3B6C730731918DC8CCA4AE46E1D09E73512C4D3737493D47F579462A6B63C9BE25EAB756D3EA3A8E96F1CEB129608A33B48EFF42714E9454E7CACEB8ABC92EE7A57862E46B3E1EB3BAC7C9730249B0E0EDDCA0E3F0CE2B09FBB27134E5D5DCCFD73C25FD9D135FBDA32C6A396C0FE5D6B2A9374A1CD2D9185E2DDA2CE1BC37E12D53E2678975286ED5EC34CD382C04CA7015986768507972B824B7DD0471CD7D060B1BECF0D651D65A9E44E973D6551C9BB742E7C5BB973E1DB9F0FE9B7999563682110FCA572301BBE703BFF008D7C76790C4E2E54E9D2D15F5F43E830B2852E694F73F2D7C31F01B5CF887FB435D78326492DDA7D605A7DA31F32C425F9A51EBF202D5F510946308C51E4B7BC99FB89E0EF0768DE01F0DD8E83A069F0697A4D9462282D6DD76AA01FD7D4F7AB3036E800A002800A0041D4D002D00140050014005001401F177FC144FE0547F10B49F0D6BD0896CBC9BAFB1DFDF5A441E448E4DA15D87560307D71C7A9AC65EEBE6348BE87C73F02E3D7BE187C40F10E96663A66B571612210DC79AF0B89437A1E11BEA19AB3E6E6DF635DB53EDAD06C349F145ADAEA335B476D35C224D200DB08C80482475A88E2274B4358C7991EA5A5D9785B41D25EFEF66B4B7B481773CD77300898EEC58FF3A53C5D49AEC6F1A7636349D7BC3FE3AF0C1D47C397D6BAA6952EF55B8B260D1B9524300475E41AE793937A94925A1F9FFF00B5D7C5EF86979F16F4CB4F19E993DDB794522964594C16CA58601D8E31C8C7CA09C75AD28BA955371D918D451834997BC47F1BA0F873E01D4E4D134A8748B35899D974CF99272ED90E9F36D5E080368C1C024E00C78D5704B118A855849C5ADFCCE8559C60D4B55D3C8E57F66EFDB234DD6ACB54D2F5AB1B88E475D9BEE0E778391C1F5AF7674A74269C7532A556FABE87E91FC1ED1648FC29A635C7FCB289781D09C67F4CD3E4E6A8DB162AB2DA3D487E35EB5AEE9DE13BD8FC38239757BB536D64B31C47E7B9091EE3D8062093D8035152D2B45EC72D3D1363B45F08C1F0A7E19DB696B74D7D7C079B77A8CE3E7BBB96E6495BEADDBB0C0ED5A546A16E5D0547DF95D9F35B69FAEEB1F1135AD7B4E0D7D69A46DB3FB031251E6914CAE405F99B622AF03A97C76E7DFCB70B85C53BE25D9743E7B3BC76230B14B0DBB3BEF821F0C7C223F68AF10F8A6CA09ADF5CB6D363496C9E432C5048F80595893838057193D0E2BC99C630AAE11D91EA52A92A942129EED1F53559A85001400500140083A9A005A002800A002800A00280296AFA55BEB3A74F65771096DE652ACA47EBF5A96AEAC2D4F9874FFD97741D07E29CDE24F13C30DCC41592CA449990CD23FCA72148230B9C8EF9EF8AE451E4DCE852E6D8EF6EFF0066BF84FE35D3FEC379E170CA231868AF2E21751DB6B24808FA038A709A93B58535287BD73C7BC61FF04C8F096AC643A0F8EBC57A346E49FB2DD5CADEC00673801806FCD89AE8718B5AA2A188A91EA7B6FC00F8123E06F815BC3EB750EA2E66699AE6288C7E69200DCCA49C3100679AF3BEAF514A5294AF7FC0AF6CA5647CC7FB427ECA1FF094F8CA6D5EFF004817F66253246E636063C9C9191C119A88B9D2BB8F53ADB8CFA9E37AEFC2CD5EE0AE803CBFEC85511C4AC832117A2D62A56973750B3D8D2F87FF00B14DDEB5E2BD3E76BA8E0B38E7475B78502EF6CFF11F4AEE8D4725E664E2A27E96784605D1ED17480AF8B4508247183260727FCF6C57A6E9F2C533E7E962DD6AD38356B15F5CB08EFBC4FA3405770491AEDD48F97E41807EBB996BCD6AF52C7AB17FBB24F889083E18B99372298419017E8303BD6B555D0A93B3B23C2F44F0CDB58FC3CF0F6B37CD7165A96A174FAB99A19595B321668C919C70A635239EB8EFCFB997D794284E364D58F9FCC2942A6269B6DDEE765FB3478363D1348D7B5C9774B7FAD5FB3493C921919A38FE551B8F6C973EBF3735E3C1F35E47BB256F751ED55B082800A002800A0041D4D002D0014005001400500140087A5007977C434D4BC56BA8E91A759CCD24246DB97846217C021909E0919CF1CD73495DD8D60D289E19E13F8F1E38F861ABBE93E3DF0D5CCB696F2790DAE69B0B4908F774C6F51EE030FA0A55B0F2A1695F72A9D5559347BEDB7C66D06FA4B648AFD3F7EA1A2947CC8F9F715C8F11AD8D950B6A769A6EABF6B3B5946719DCA72A4574C2B5F730A94F9754696D56E3822BA7731390F14FC27F0CF8B9965BCD3638EED0E52EADBF77229FA8E0FD0822B395284BA151A938ECCA5E10F8710F8675C6992779E185488FCC8F69C9039C8E0E0645670A5CB235A959CA360F1E78BF53D0EEED61D1B4E9753BB59E233DA45B55DA063866566E095009DBD4E38AEF707ECDCDEC78F0AD0962BD95F548D4F0D6B235DD6B52668F6C9647C8CFD4E4FF00E823F2AF2E84B9A6CF62AC5422AC657C5E57D5BC2375A65B3FEF6F1BECA482411BC60FE86B594D6A854E2F7656F897A3DA41A15821616D0D8C12146503E5548FA73C6381F957A149B8D2945754799888DE70A9D99E17FB3D7C5FFF00847FE10695E22BCB9BBD4A2D5F53923D3AC031245B4939F2709DDD8306CF539EB8C573CA9BA2923BE2FDA2723EBA5AB2475001400500140083A9A005A002800A002800A0028010F4A00F27F8D7FF00093E8115BF88BC352BCDE4612EACC36015CF0E07B6707FFD75C9560FE34CD694D2F7648E87C25A83EBFA6ADD6A5F659A39C031131E0E71CAB763F862B5538D48235A9051F837389F895FB3EE93E3C5375E1ED44F86B5347F9CC0A24B79091D248B23073FC4855BDCD632C2A92DAC62B10E0F95BD8E474BD13E24FC2300DF5849AFE9719FF8FCD1E46B8641EAF01FDE63FDC0F5C4E854A7AC753B15584F467A4F853E2EDBEB88086C95E19508241F43E86946BCA2ECC52A316BDD3D16CF5582EA25757033D9ABD08578C91C72A72896F1C6457510796F8C75EB0F0C7C42827BC7D925D4515BC44E48563E6007AFA851D3BD755472FA9E9B5CF330F878CB1D2A8D6A92367E135AFF00C492F2FF00AFDB2EA421BFBCAA4AE7F3DD5E2E16368B9773DAAF2BCB94AFAB4B347E25D3B4FB88A266BABEF3A3922639F2D06E3BC1E87A7B566F9535DD9A5EF4EE8E73F6A4372DF087C5F259C8893DAE8D78C0B1FBA5A16506BD5A755536D338274F9E0794FC12F0CD9CD79F0CB45084C7A75A25F050BFBB1E5C60A9E79C82CBCD7273CA753DE3A6CA34F43EBC000E95D4642D001400500140083A9A005A002800A002800A00280109C500666B514575A65DC132EF8DE260CB8E08C1A892BC5897C48AD0E9B682C56DA30123C0F957B579F1695AC74393BEA78BF8DBE28691F0BBE2141A1F8BA6369E1CF10FCF692C68DB5278CAEF0F22FCC9D622BCF3F3FA73DEB16B975DD194F0AA6F99753D53C29F10EC7C421501D8EDCA6483B876E95C90C4294AC6B3A2E31BA2E7883C07A2789B325D5A08EEFAADE5B318A743EA1D707F03907B835D12A709AF7918C67286C5AD27C389A7DA431493C97B24581E7CA155DF1DDB680B9FA01F4ACA3878C7534756523624C85E3835D860DD8F8D3E226B3AC7C4BF881737D6D6E227D0CC7A7428EA7E7BB328D99EC70CCB9C74C3574E324B0F41515D4797558D5A72AB6B3BDBEE3EB8F0E68707867C3DA7E976F930D95BA40A58F2C1571927D4E327EB5C115CB1491526E52B9C958EA2DAE7C4D1105C47A7DA3C8DD386660ABFFB3FE55C515CD5BD0DE4B969D8F30FDB335D87C3BF0935F9CEDFB6DFBC3A7C1106DAD2EF6036FD3AFEB5B534E75AC45F960761F05B49B1D3DEDEE242A9716BA6C3651EF00119019C6EEFF763FCAB487BD3949112D1247AFF009B1FF7C7E75D24809549E08A005570D9C10714006F19C679A005041A000753400B400500140050014005002374A00A77F08B8B69622768752848EA323152D5D588EA63785AC258AC22FB492D32921C939258715E6C21791D552A5D590DF15F86F43BF8FEDDAD5B5ACF676D1B99FED8A1A31111F316CF1818C93ED5D0E9252B99AA8F9794F24D5FE015C68137F6C7C33D5121B7244DFD8375317B466EA0C1272D09F6194FF6475ACA787B7BD1D19BC6BE9699B507C4ED77C4BA2DCE92FA66A1E17F12C87ECC59A34325BCBD372EE56471DC302CBFAE2E9D6F7B92485EC925CD7D0F62B34912DA31290D28501D97A138E6BB8E62493A50079B45E098B52F17DADD4366B69616D78FA84FEB34D8217F22771FF747AD71B72AB539A4F4468A31A34F963BB3D225F9617E7B5744B6335B9E77F0B2C99B59F15EA527265BA5B7427FBA8B9FE6E6B8E8AD64D9B567B23E52FDBFFC729AD6ADE13F045A485EEAFF00525C947198F2CB1F3DBFE5A743E95AD14DB94BB04B648F7EF8757914D6B796F6EC76DAC8B115620952B1A707F0C52A0EE993537B1EABA6430DFD979ACA09DB8E541AEC3336214568906320A8A007456C96B1044C841D066802B4BA6C5799794B927952AE54AFD314C8B21805C696A7F78F7910E8AF8DE3F1EFF8D095C5768D31D4D23416800A002800A002800A004233401C8FC56D675AF0E780759D43C3BA69D5B59861FF0046B60C002C481B8FB283B8FB0358556D45D87149C95C9BE1B1D50F8334B1AE4B14DAB8880BA921CEC693BE33CE2B1C3BE68DD97555A563A49E04B885E2911648DD4AB230C8607A823D2BAD999F0E7C25B2F8E1FB3DFC6A97C0B0685AAF8CBE193DE49F61902A05B5B676CA379EF81F22E0152E3247DDC9E7AD4A9D48353D1F46396A933EE1786366577452EA72188E4570B514EEC9BBE8717AE7C69F07F86B5DBED1F53D6A1B2BFB3805C4914BC650827E53DC81D47B8F5AEEA184AD8957A2AE7255C44283B4D9CFE87FB49F837C5571616BA56A1E7DD5DABBF92EBB5A20BFDEF4CE78AEEC7E4D8CC152955AD1B4575EE73E1330A38BA8A9C1EACF51D34AC965138C7CCA0E457814D5A27AD2DCC5F1DEA93E85E1CB9D52DC826CF133C67A3C60FCCBF9138F702B7E5E6D074ECE5A99DF0CAE6DEF3C26D7D6D22CD0DDCD2DC2CA872AEA4E430F62315C90564C7535923E03F8FD6526ABF1B6DFC46E098ECB5AB1B789CA6412AED211CF4FBC3F2F6A5859A6EA46FB21D5BAE567D07FB2CDDCB7DA678A5EE0B19E4D72E26C39E763050BFA2FE9558769A64D45D4FA13C393791772DA374237A7B8AEB20E82CC111807AAFCBF9500587FB868023276AAAF7A00A1E635C5F4C80FCAB84AB5A2B993D59A83A9A83516800A002800A0066FC1C77A0070E9400B400D650C08352C0CDB39EDAC679AD15C232B6E087B035CF171A4DC4B779AB9A6AD9AE84EE67B087683CD17199DAC5D0B7B391C1E40E2B92A4AE5D35767E37FED9DE2ED67C2FF00B4EEBF33A7FA2DE5A432C4B2B7CA4140A58139DBF329E9D306BE9728C44B0CBDA40E3C6518D64E9CBE47A97ECDF3E99AC78A05F7DAE3926F2A378944BB9C2B13D877E0835F5DC47994F1F80A71A3AAFB5E5D8F0B2BC2FD53112F68B5E87E8D5878FF0047D1B40B792F2ED208D555773B63D857E56AAA82D4FAD749CDE87CFDFB65FED29A7F873E04789FFB34899EE631661C1CF121C123D70326AA9D47566916E0A92BB3D0FF00653F135A6A5FB37F856E05C26F4D3D237C9190C100E7F2AB92B5D33169B69A3E77F8FDA6341E074BFB745778B5A3792480E46511C03F9815E553838626725B3563797BF4D23D0BF67DBAFB19824E562BF8115F1C7EF00E0FEA7F3AEAC3CAD2B1351687D08656B66B7BB3D61701FF00DD3D6BD4398EC202A7254E437340131E94015A59953CC763858D724FA50067E8997B417520DBE693360F607A7E94FA580D91D4D2016800A0042C0753400DE5BDA8015571400EA002800A00E33C6F6A74FD434ED65090B1B7D9EE00E8C8C7E527E87FF42AE5AB1BAB9AD376763A1B7D4634B656DE1863823BD671A9CA82506DE853BDD7A38D4E08047A9A13739590B914756731ABEB86585F7386C8C803A5632BC1D99B41A6AE8F823F6F7F84D378E9F46D774AB39A6D5208A4B74302860C17749B5C12382A1F919E40E39E3E872A9C677A4DEAF638B129C6D33E49F807F11E5F855F1034897548AE60D3DB94F30156453D86EC02A79C76E3E95E854728A943A3DD02A6AB72F75B33EF7F197C4FD27FE122D37489BCC985E69EDA9D95C64182744237A8E7865051B91D1B83906BE4A74DEAD9DE99F08FED23F16758F1B6A175A5D9A6FD3D19B6C09D33D8E3A135D786A497BCCCAAC9DAC8F65F813FB446B565F09F4F82FD61F0C697670859A577024BFDB9D8CA0FF0FCD82541270476ADA74E139E9B2129FBB6B15E3FDA26F3C6BA145E1989049E63B9BBB824E06E62554007EF02E7DB8FCB8E745D352A927B9309393E5E87D9DF0A6C8C1A15AF5CAAA9073D3038C57994DB5A9D8E29A3E82D16F5756D2371C3120C7201EB5ED5397344E192E57637FC39333D8A24872D19D993DC0AD0935E57C628031356BA33580853EFDE4BE52E3FBBDCFE40D0069C8A104300C7CC40C0FEE8EB412958BA3A9A0A1680227B85570991B8F6A5664DC51863CF5A650FE828016800A002800A00A1AE6971EB3A5DCD94870B3215DDFDD3D8FE0706A24AE857B33CDF48D46E67D19ED65216EED18C32A7B8E0D79D2563B53BA399D575FB8825685CB6D236EEF5A709F2CD32251BA673BE1DF151D4EEEF2C2E2622F2D86768180CB9EA2BE8B32C03852862A1F0C8F2F0789529CA8C9EA8ABE2AB38B5AB29AD65564518657438646072083FE411C1C8AF9FA55A5424A71E87AD28A9AB33E11FDA77E0678FBC52B6274DD2B4AD52CB4957FB349A7C620B98E1CE7ECF82DFBC5DC4B8DC59C12DF373CFD1FD7A8577CF27693DFD4E0852952D11E7126A7AB3EAFE1F8F506BA373A3685F6305E36458F7E18A3671875DC1781C80727815C159AB3B1D6A4E4EE629D32DECED6E353B8505892630DEA3B9AE452BBB0FCCE7BE247C471E24060D2E18EDA37758E082140BE5A0002AE071C0C0E3A919AEAA707297BCB4443B24759F02B4B1A66BF636F2B6F2B22BC849246ECE715C78B9B92B9A4158FD34F006AD00D2E2452B90060E6BC883D353A523D4FC15AD0B7D53EC8C4F95743001ECE391F9F4FCABD2C3CED2B1CD5A3D4F41D165F2A5B94231860E057A07317F55BBF2A3931F795381EA4F005203334F84DDEBA4924C161188549E85C8CB1FCB1401268BAA36AFE27D48AF36D688B0467D5C925CFE8A29326FA9D20EA699436562A84A8C90381EB401CA787EEDF509A4777C4B212E41EDCF4AD764666EDD34B6C89320DC13EFA8EA477C5665AD8B69309A30E8D9523208A432447DC2801D400500140084061401E2DF106EFF00E109F1D2DD3FC963A9C7BB3D06F180C3F91FC6B82AAB3B9BD377D0A5711DB6B277C6CACC79041F6AE58B4E46CF4478E58DC1D2BE2A6937172BE5ADF34D6CF8E982B919FF00BE457EBAA94713904E9F58599F9FC2ACA966DCDD24779AF6A56A9E67EEC322E72D9AFC8D9FA023C73C49E308FCEB930A09563EE08017EB9EF4867CE3F153528EE2E649FCA58D1F80080588F6F6ADA09BD1927CD9F1675996C6DA0B484B7CEBB98F6078F9457A5878A93D4C6A3B239CF046966498DEDDE36423767AFCC467F41FCC575E227CAB951308DF53D4BE0C4377AAF8A33CA34926FEBC2FA0FC2BC9C4D944E848FBCFE1E35C5898918BF201F98D78E9D99D0B63D88EA2F6F6C975149B668C874627F88722BAA2F95DCCE4AEAC7B078775FB7D6ECA3BE824043A824039D848E54FB835EC464A4AE8F3DE8EC6E6A1711FFC7C3B011C7FBD7CFA28247EA6A80CA97517D17C312DDC9C5E5C64AAE392EFCE3F503F0AAB012F85AD7FB0AD6DD656FDE4872F8EE58F24D2335B9D88EA691A08DD280385B3D434CB0BF8C8BC87CD8E77B79625705812C76E40F715A3D8C0EB3EDE9B43EE5921270594FDDFAD656EC6E32106C2E0479CDB4A72A7FB8DE9F434C0BA1B649ECD401350026E1EB4015E5D46DE099219264495C80A85B939F6FC295EE4DC9237DDBB9E8714CA3C9FF686D320F10F82A5B313245A9C64DC59EE237315E1801E986E6B96BDB96C5C2E99E15F0FFC43A9DADA982F0B09E1F909F5AF2968CEBDD1E5BF143C7771A3F8BEDD238DE49E0B8596DFE52492C486C7AF0FFA0F4AFDF3876850C7E5D3E69D938D99F9D661CF4314ACAEEF75F33BF926BD6D1BCF9C49079C013BFEF2E474FC2BF12C5D2851AD38C1DD267DF51939D34E4B53CF3C40A21D3273138C609C64924FAD7226CE83E72F195BDC5DEA85A6C93F7883D00CF6AE883D08397F15783AD35CF0E486440BB241246CFD3703D33E98AEAC3D5F6751392D0C6A45C9591E7763608AA9A5C2499242647C1E993D3FCFA574D6A8A527214138C5267B17C19F07DF69BE24B3BBC98E0898B4881412F9E00CF6F5AF2EB548CA2D1B25A9F6D785E2125BC6F8DC4F20800579E95CE93AD92F83D998CF4038C56FD0CCEA7E0FEBAB0C37BA7B90ADE679C9E841C03FC87E75DF86968E272D58D9DCF4A33FDB952D7AF9B2843EC8393FCEBB8C496E261AFEBCAABFF1E365C9C0E19FB0AB4437D09F5DBC16D12A46BE64D21DA8BD327DFDAB4251DC0EA6B035337C4B0CF71A06A11DAC8F15C340E2378CE18360E307B525B81E27A15AC97704B656F37D87558B335B5C46A3F78A7AA918E467F2CE6B7667E6779E11D4935F335B5FA7D8759886DB88978593FDB51D083F4CFD2B27A1564CD79E7D434B8FCAB880EA5A793869E03FBC897D48CE4E3DB269146D58DD2DF59ABC7224C474914F0DE87F1A00BD1C9E6461BB1F5A008DE15B885A37E54F040E33401C6CBE124F116A773A8497D7B1BA4FB3C84976C63630C631C82718CFFB4DEB59E1F9E8F3393BDCCEA5352699D4DBCDFE9B3C5E9835A1A1C2FC4BF0F2F882EB4D793CD8FECDE63A4D08070D853B5873F2B004671C71822B0A914F56547738997C050C69F6A54C331C1F715E5C91DA79AF8CBE1AD8497F16AB2C1FE936E3F76E3B720F4E9D873D464FA9AEBA18DC461E0E14E6D27D0E7A986A7564A735AA381D6BC417D75BAD82916E3F8B39DDED5C4DB674AB238AF18DDDC41A62C709231CB0208FD4552219E3969A0EA5E23B9B9BB958430231662D9C003D2B7E64B611C2788353B9F11EAFFD8F6F298E0524334792147735D105CBEF321B391D0F4EFECEF18DBC4EA4F95204C9E495CF7AD26F9A174347DC5E0FF0BC125845242A02B28276D78CD1AA47A668B1FD8A0080E76F39A5B1A9B4D9788A0209C6781CE2AF701BA3EA3FD81AA5ADC3FC912B6D90FAA9E09FEB574E5C924CC2A479933DB6CCBEDF2A0907DA263B04839D89DDABDC4BA9C1B1D159C76DA4D90503644830AB9E58FA9F5ABB12D331E76B8BA9DA5B78C44C78FB44FC2A0F6F535A81E983A9AE7341186450078AEBDA34965AB3C76F2791710CA5A09476C740477041E456A9E865B1B7A65DC7E26D8590587882D39500E049EB83E86A5EA3DB5475565AAB94F35948957FD743DCFA903D454949DC568A1D16E3FB46D30B657183708BF707A483D3DFF3A451B7138DC40398DF953FCE8024439209EFDA8022B4B116824C49238772FF0039CE327381ED40198F30875E74CE03C60FE54019DE24B9096B310DFC38E98A89E91638FC473D737CA2D11437B9E7A5792F53D14711E25912EE068D870DC0C76A9B033CE6FF00C3B6F019026D763EDC54D89391D53C08DAD9316EC291F3151D07A534988F32F8E515A7C38F044A1976C8E3CA8635CE598D6B08B723391F29C5E25B3F0740AB7CED1DC5E48BE6CB8FB9938F9BA600CE38F7AF455373D8CDB48DFB4B286E7C436B72305DC8C903BFAD73CAE938968FB03E1DDE30D2E249304ED1C8EF5E73DCDA3B1DF42FB0893A0F4A86BA9699A70CE8E991903A8E2A90C87565FB4DB1C60E0605535A5CCCF46F84DAEFF6868B246F28FB4DAB79323B7F0AFF0009FC47F2AF5F0F3E68799C5523CACF4AB689E720AA8F4124A33F92F6FC6BB8E76CCAF1778DBC3FE005B69756D42017B73208ADE3B99406762700283F5A96D2DC69367A78EA6B23416803CDBE205A2AEAA48FBD246241F81C1FE43F3AB8EC66F7303ECE9A8468EB2341751FDC9978C114C9B9AF65E379B4CB848359B45DC3817717DD6FF0352CBB1D2ADF4690B5CD930B9B1979920FEE67A903D0F71F8D22C8F49BFF00B1C91DAA1F32CA51BAD64DD90847FCB33FD3DBE9480DFB4BA59CB81D9B383DB34016A472A47A7AD00731ADDC793AD5AB0E3AA9FF003F850073FE34D485BD8E3760BB8EFF008D6359DA2694D5E479C6A5E21782D9CA4800EC0D798DD8EF89C06ADE3A95EEFCB403238C2F1CD65CDD819563D5EE2EA640E7683D0934D1323B2D2AD6D74FB37B991C1F97BF06B756B127C31FB4178967F1DFC57308943E91A4E4AAAB7CA6403249FA715D34F4463267CE7F17F4F5BBD1A29307CE6B858F6AF3BB24E066BD1C34F964D184E374777F0EE69934FD363BE8F6CF0AAAB11EA383FC8571D7B5DB46B0765A9F627C3FB88DAC61F2C920A8EA335E6C91BA67A3C51A491F232A47E9516E6D0A4D2268241010B8257B1A495B4341F3C8BE4303C71C0ABD08DC3C09E248FC2FE35825B8711D8DD0F26576FBA87AAB7E078FC4D6B879F24F5D9985585D687A4EB9F14AEEF52583C3CAB047F77FB4675DC5BDD10F6F76FC88AF4675ADA2308D3EE792EA3E19B26D426D4EF7CCD4B5494E5EF6F9BCD90FB027851E8AB803B015C4DB93BB37491FFFD9, N'平一指', N'', N'1956-1', N'江湖', N'汉', N'团员', N'大专', N'医生', N'13237997264', N'pyz@sina.com', N'四海为家')
INSERT [dbo].[imimage] ([ids], [myimdata], [姓名], [性别], [出生年月], [籍贯], [种族], [政治面貌], [学历], [职务], [电话], [邮箱], [家庭地址]) VALUES (360007, 0xFFD8FFE000104A46494600010101012C012C0000FFDB0043000604040405040605050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C20202020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020FFC00011080064006403011100021101031101FFC4001C0000010501010100000000000000000000030204050607010008FFC4003F100002010203040704070704030000000001020300040511120621314107132232336171144251812334527291A1A2151624438292B1085362C164B2F1FFC4001A010101010101010100000000000000000000010204030506FFC40027110100020202010303050100000000000000010203110412211322314161711432334281D1FFDA000C03010002110311003F00DDA3EF561457A2BD1775A811CB2F3A0A0F4A3D366CCEC0C82D258DB12C6DE30E98640C1742B7069A420840790C8935467307FAB82E6DE49F6602DA36693757779C9AC7D9CE30B965F1A0D8760FA48D97DB3C3DE4C2672975100D7187CE025C460F3D3BC32E7EF2922A0B5A707A0F7D8A05B77A805EE0FBC681C568064EF540D62EF9A80CF409879D0456D3E371E03B3D89E3520D4B875BC97010F02C83B23E6D90A92AF8B70CC1315DB5C52EEFEE276925B999A5BBBE7DE5E46399D23E1F0AF2C997A3DF1E2ECBFE19D09DB1B192D2499992421FACE0CAC3FF00B5CB3CBB6DEFFA7AA4AD363B1BE8E2EECB69ADA5F69B2B3917DA982E991217ECBEB03734646E3CC56E32CDA7EEC4E38887D390BA3C464439A3A8643E4C331F9576B8DCFB14047E3402FE50F5A0703B82B402FDE350348BC4359077AA130F78FA50507A75D6DD17E376B16A37178890C08BC59B5890AFF6466B36B447CB74A4DBE18DEC4DADA607B2B69331D05E312CCF267B8B72DC09AF9F967B5DDF8ABAAAFF00B1FB496F88BF54555430D713ABEB0E837E7915423F0AC5ABD5A89D9DC38F45B5786633868897AA786E6DA20AB29D4C132CCC8C1573CC8DC057AC78D3CA61AAE0A92A60D66928D32A5AC0B229E21844A08FC6BE84384E39A510496A81AF82BEB501A3F0855023C4D50D22F10D601DEA84C5E25033C6B0AB4C530F9EC2ED754138D24F353C997CC566D5DC69BA5E6B3B864F3ECB4F80DF259DC699621DA42BBD7AB2777215F372526B3E5F4B1648B1D9583F786C8431011C63BEA325CD86F1B8579CB7AF0B76050AB4AD6A62EA9E29066A3BBA4EFCC7AD7BE28DCE9E396751B5CA3EE357D17CE279A51049BBB4035FAB8F5AA0D0F748A40450328BC53590E1B855038FC4140A946FA0C836EBA45C2EE76A5706B28CC86C616796F411A25D4DA5A38C713D591C6B9F978E62225D3C59F32EECFDB477D883E216F2C6526D3A924EDE8750066AA770DC3857251F43B469A2ECC59D840B7496EC0CB165D6479F68759BF5B7DFDF5D7829FD9C19EFBF0B02784D5D0E62077928824FDD34085FABD02E239391F1A05E8AD08E8FC6AC072DC2A816A557058E42828DD2AED8CF86E171D8E172B437B7CC55AE40DE90A292FA33F79B72E7CB3CEBD31D77688499628D1612711B2696E160C41F58B6889CBAC4C86A5DFE60655D5CCC1DE9E3F743583275B2FDB3AB6B8524B7CFBA26ED12788C857E7B4FA486D8DDB9C4E7C7F1FC522BB4B196FCC696667F074DB9D3124A0E5D97CC8396FDFBABEE71306F13E767B7B9B7ECB6D2C58CD8B0784DA6250BF517B62C75755305D5906F79597B48DCC578DA9359D3312975EFAD602E7EE9F4A04A7D5EA8EAF7EA038E15A1169E356016EA610C5AB99EED509B780074EB0EAEB41ED9F8F1FCEB70CB34DAFD9AC4F6B45BE2D6ED0DBDA42B21B484EB777CCE40BE9EEEA0B9E55ED8ADD7CFD5248DB3E892DB1EE8F95ED5217C72C63F6CB57B6DE86445EDC08480482A34EFDFAAB58F37BBC9A65B8762B8C625814185C01E6BA0E22CB9E96E0C7FE2071CF85399C0ED78B47D7E7FEBDF072351A959BA3ED9EB3BADB9B0C2668525B34497DAC1DEB32AC24E441E5A9ABB79158C78F50E7DEE5A43ECCDD6C8ED8E177168ECF81DF3AD83191F53A0DED0231E2DD59D4AAC77E4D972AF9F6BF68FBC34D02D53259037FB8FFA775794A933E7A77F3507F1ACCAB89F57A0F2F787A501C55116BE356422E9B5DDAC1A73013579F1E555993B552B6472ED3DB8D6BE6177D6832D98B482DB09167166618A69B46AE247584AFE9232A2B96187FECBC7B109AD0111DE757753459F64BE5A0B28E0A7B3BF2E34462FB6782FEECF4877CF66BD561F89DB35DD972035AB24B18FBB272F8115F638B93B57F0C4A77A18892EF6DAF2E80FABD9EAF43232A7FD1AF2E7CFB63F2B46ADB716DD76CDDE365DBB5417711F83C0C2407F4D7CC86D268D1F56D31EEC9DAFEF00E5F3A04DEA7D1827C4CB33524378FC0A8AF735F4A03551163C5ACA133C7AAE55C8EE9E3F11CC7FDD6A1252500D2C1DB7E5907F8153BB3FCEA88FC2A37B6EBAD5FBD1B12BE7A0E8FF00D429A29F801B1407FF001B7FF78CBFCD4567DD3AE1425D9CB3BE897F89B7B868D0F94F13A91F32AB5DBC2B7BB5F662E6DD005930FDBB7B28CA6CED6DD87984323FE6D5AE74F984A356BFB5F6AC3AEA0233EBA1923CBEF2115C2D23B0A91E6C1F0C90F068A3690FA460503F853DABAD9BDD64D10798E3ABE6785254D62F06B2AF7D9A02D5119FCDACA1C70CF50D487F235B8493A81014DDBE36DDE94533BE5612995774D9671FD9D43B2C1BC88A20B8734A54CF74151B2D03436AC871DE72145557A679D2DF60DE6918055BCB6ED1E1BD8815D5C3FE44BFC1B740E236D8A6BFCF7DFDDB303F1EAA348FFC834E64EEFF00E255A06238A4187D999252016EC4618E9059B86F35CAA8D96CCDA7B05846D9D82C47581C4692BCFE041A409B86485B2EA9C11C80F850349E2EADD8723DA1F3A8D00782FAD404AA23BDFACA1DC43B47F123C8D6E01E1D20E69FD4395051369B1AC7A3C72F6CEE3F84B619361C883575B0E9C8C85F9316CF35E55CD9B25A1D18B1C4C23AD716C556392382EA4C997239F687EAAF0F5EEF4F4A8BB6CD7F1DB3161EDF1A5C3B2059048A1D59918A86C9B31CABB71DA6636E6BC6A53715B242A12345445E08802AFE03215B61CBBC36C7105115F431DCC6AC1D2291432861C0E46882BC1119076076370340558918EB4DD27C579D00AF3DDF8E468B064DDCF9D451070A08EF7EA20CFB9A27F3D27E75493E6932C916A8E5CC50C90753342B73AB844E0119FCF87AD260DAB58BEC1C73C2A9617325A9CFE982E4C08E6175024796FAF2F46ADFAB294D97C2EE704D9DB6C327796F66B5D7F4EFA75BEA90B8D44691BB565C2BD2234C4CED2D1DE29DCCA51871561550457473AA36CFD37D01030141C8FB12669DC3C54F2F3140D64984D2BB8EEF05F4151A01BBB40A1C2823FDEA8C8B727E83FA85551602580CEAA41D0268A5AF1A2979914472C0F58D765867964A3D32344460B1B744568C686D5C54E548AC35327EACCA50679E7C73DF4422EE570D246372F0DD5254383BB481D7EE9A0E8E141FFFD9, N'王难姑', N'女', N'1956-1', N'蝴蝶谷', N'黄种人', N'团员', N'大专', N'医生', N'0707007', N'wng@sina.com', N'蝴蝶谷')
INSERT [dbo].[imimage] ([ids], [myimdata], [姓名], [性别], [出生年月], [籍贯], [种族], [政治面貌], [学历], [职务], [电话], [邮箱], [家庭地址]) VALUES (360010, 0xFFD8FFE000104A46494600010101012C012C0000FFDB0043000604040405040605050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C20202020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020FFC00011080064006403011100021101031101FFC4001C0000010403010000000000000000000000050304060700010802FFC400411000010303020305050603040B000000000102030400051112210613310722415171143252618108233342B1C11562913472829216242543445393A1A2C2E1FFC400190100020301000000000000000000000000000102030405FFC40023110002020104020301010000000000000000010211030412213141512232611371FFDA000C03010002110311003F00EA9A406A80374009BFF84AA4C6887CF96A71E28FCA9AE7CE5C9D084445206739A85168A2CE00DE81836EFC5D62B3E965F735CA77F0D8402A59FA0A2D2150FEC57454F4871515D8A4EE84B83735663455364BA0B8A5B3BF515B226190E2A444CD429D88D7305163A3DD31194019401A5EE92286057D7E7E442129D42415F46F57BB93E66B9D93867471B2B799C5B35A9EDC71735499691AE4468EDF740F1EF1AA926D597F9A263C3D7D1744A55A565B23DD5ECAA6046B8B2D375B85E63A21BCA871D1D1E48CAD2BCFE63517DFE128FD7F4B0AC90170F90EAE5A9C521202B56FBE3A8F5AD49F93249780CA66CC4CB61095E52B5E1C18F0A6A6ED0BF9C76B241E15A8C66B45006F40A00F75222650065002331D75A8AF3ACA398EA105486FE2206C294BA25056F92B39D717389ADB877317999E6B03C15EBD76AE6CF239A3A9FC3F9CBD80DBE1266231CA69206D82BC655BF5DEA9A65CA412B3476E248E5349C2103EBEB524C283930C7D21D5A74E7DE581FAD49918C4216F8EDE90ACEAF235645154D846135CC97D7050322AFC7D99B2BE02EC38B2A536BF793E3E62AF32B16A623298CF54C8994019401E1C58420A8EFF002A0083F1170F2A0ADDB9C70128795990D8F027C4561CF8AB947430E7DDF17E01B1DF3A7BD59B71AA80EE2E6C698EBCC2438979433A8EE07CAA31B2E7541E852DF9B1F90EA74E8D969F307CEAE5C94CB8E47D6DC477BD982B291D079528F0E884F9E490DB1ACBEE2FC40AD78918B331F1D49EFF00E63FA55E671253CE500367643E17B1A8D8C315610328032803C38329F4DE931A1B3E889708CE47706B42B65A4D292B2516D15CCD8EA892DD8C76D24A47ED5CACB0A675714AD117E2097C42CEB6AD6DB6A5E9D9C77A03E9508C8D708C5F60CB5C7E3ABAA93166DC116F4E52A5BD149E69C751BEC01AB0BA4A11E7B2C2B4DB0419685216B7428616A59D449F3A4953314A5689BDA927965CF88E9FA57470AE0E5E77C853157519CF05B49F0A543132D35E29A062F4C89AA00F254738A433CF5D540C4D51F07988D9CFD680223C516E53EF3D25A1F7831AD1E3B78D66D461DCAD766BD3E5AE190C4AB2EA92BE87AD72E8E9A62F0E1697F98084D4D449361B13D986D8E73839AA38426AD899E64B205D2DC9610CF3D25D0904FA9AE942515C59CC9C24F9A0DA14149041C83E356941B3480F040A066D6E36DA7538A0848EA49C0A04452E3C46A95294C41921AE57E504052B1E3BEF8AC59335BE0DF8F024AD8E2D9C50C974449EE00EF83DD07A2AA58F51E2447269BCC43E83DF556B320A0DE8103EEADA5203DA7DDD947E540C86C9B4D9AEDCE7AD525B5BAD28A1F0D28282563AA558E86AB9E9A322F86A1C4AA7B56E2BB87025B5B90BFBC5BCBD0C359C64F9FA5677A07ECD4B5CBD08F67B759FC4D0E25E1D3AA54907432A5650D0070546B365C693A46BC792E3B99653260324B6F3AB92E7E62DF41515441D86205F1D8C9C422E68F81C19157472B5D19E7893EC95D92F5FC410A0E2396F23A8F035B3165DC62CB8B684B483569490DBBDD53295CC2AEE8D9A46764FCFD6B0E4C966FC58E80F32D51E5B490EA35E7DD71274AD07E24AC6E935438D9A632A003739B8F7362CF757B98FAD7A62CAF77DA01E89563003A93D478F51E5518F74CB9AF8EE45AD02DECC282DA243E561231A967AFC87ED5D484291C59CF73B1C0098AF3612B2A6DFD8255BEE37DBE952202D2D90F4771B574502298239E2F169B87659C432F8BED21C7F85E6B99E24B727BCB6547FE29B1E3FCC2AFF00D114DF6C5C75038DAE22E6AE68B7B234436F61DDF8F1E6AA9AE80B23B0C856C4705A64424A9B44A7145C192A5E53B6335C8D5FD8EA697EA5A4D89686D1C9612DE478EE6B2F25C2B05CBAC84A82F0120EC42714D5B14A906E0CD542520A8E1C1B9F98ABA12DA67C91DC4CE33E87D84BA8394AB7ADE9D9CF6A8AAAE306DD7175C7541483EEFDCB8B6FBDFE135CB924CEBE39340F8F63E25B3B38B5DC8DC98C1298370561C1F244948CFF009D27D6A3B5F82CFE89F60AB9C94CF5C171C8CE44BBDBE6312CC49000510CB80AB428650E6DD0A4D24E9936BE2FD345E6C7B05C2147751A5E6084ADA575FAFAD75D534705AA67B75843921957FC8CA93EA469FD298871D45004178F2C1FC423C886A56224A411211F124F5AB2120670F4DB647B75FAEF654385E663B8A11147E007F6AB71F740C96F0BF6D779E14E1A559DB8ACB9ECBFD85446092A3BEAC566CFA5BE6CD58B53B555178DCEE1C40E5820CB69D2D497DB438B09E9950CE2AB7A48D7E8E1AA77F834B1716F12B17469A9E438C3BDD248D3A4FF00F6B98EE2E8E9B5171B458B262BB7069B7E3635A7DE479D5B5665BA1243F77613CB6652D848FF007637DEA4A52441E34C8F986E971D93026BCC6DF86A01E4A8FA2B047F9AB3EDF4694FD8E52EF13C72992E456E5B613BA595E85FCFB8BCA7FF003A7F20F8F4699BA5AA600D4F6951DC59C96652342BE84F74FD0D09AF24F6B5D00FB41ED15AECBAC026D8A38BA3F7096DA64477653A1118B8DAF42D484956039CA3B77738ADBA7FCE8E76A79EFB2E3E0BB92AEBC2969BAB89097AE311994F04E71ADE405AB19C9C0276AD28C8C31D0D3101B8ADACDA9F793D5B6D5FA538F6070071336E2240BAA775B6EAF9DF34951AD7915548486D2A3479336D5B80C4C92D24ABF954A19A32F4811D9EFDADA55AE32103286C2529F402AAF23193BC1E8B95C9D6D2BE53A9692E32474D559751814B9F269C1A970E3C046D72645B1E31A5E0388D958E87E62B0D383E4D56A6B809BB7484E2CA802AF3D29CEFF4AB6AC8740A8F6C40714E36B2DE7AA40AC691A1C86B739974810CB8D35ED0A4F5467074E77C75F0A8B9344A314D9BB3DE59BBBE863D80BAB74E9532B4850FFBD4F1CF70648EDF273B710DDCDF7867B5A549848813A3DDADD34C26F079623485C05A72319239A327CCD75611AE0E44E56ECEB0EC5E67B67653C2CFF5FF0067B28FFA6347FEB52445934A04369D1F9F09F67AF310A4FF00514C0E13B8C04AA4CD88E2764BCF36A49F92C8AE955A2B2BCB89916D90980E748AF07985FF002D6293AE1F82C3BAB82A6A6EDC1F0660DF98D249FE952C9D9141D8AC86EED15EE816828355CBA2480BDA17051BE43790D497614ADCC794C9EF255FB8A8C6BC93526BA0E70CC38569B0C2809FBC2CB490E3ABDD4B5E3BCA57CC9A9EDF441CAFB22769BC2A6DB999494EA0E242B29DC5719A3AA877CC3200C0C1F9D436B64DBA0DF672EDA67312AE16ED2EC70EAA3A2527DD716D9C3BA0F8A42BBB9F3CD7470E1DA8E7E7C96CE5EEDC200E11ED538D632D245BB8AED6B96D003AADD29733F4971EAE283A03ECC172F6EEC5EC9BE4C55488E7FC2F28FE8AA1032D6A6230D2038C78DE206B8DF88109180273C40F539FDEBA587EA8AE4097BB1BFF004AD866E48E20B7DB243996998529585AF49C6AEBFD36AC5AB9D48B20B82FFEC51A7A1F0ABB6592B4B922D4A5477168394928F107C8D4E7E1FE1144F14CAD4D32B4F546F501869D603CC83E6335512189B56BEF070B7E69A9A98A8A03B1CBCCF76C8C36E2F527A560C8AA4751743DEDD2FB73B5701BC2DEF18EB9CFB50DE751B2C34F1C2F49F0246D9AB31456E29CB2A45E9C3168B7D96C56DB4DB5A0C4186C25A61A1E000F1F327A935AA5D984E7FF00B65C08BED1C1F3F47FACB8A9915C5FC4D696D5A4FA1271EB5163449BEC70EAD5D93BC851EEB5739011E850D9FD4D3117AD0068D2038FF8EB7E35E203E3EDAED74F07D51548A5F8F56A3C409493B2528D358F51F62C8F47547D9F9C5FF04B86F9FC3EBFDCAB732E17F845172B0072DBFEED50482507FB381E448155C86854A135119FFFD9, N'胡青牛', N'男', N'1956-1', N'蝴蝶谷', N'黄种人', N'团员', N'大专', N'医生', N'0101001', N'hqn@sds.com', N'蝴蝶谷')
INSERT [dbo].[imimage] ([ids], [myimdata], [姓名], [性别], [出生年月], [籍贯], [种族], [政治面貌], [学历], [职务], [电话], [邮箱], [家庭地址]) VALUES (360012, 0xFFD8FFE000104A46494600010100000100010000FFDB00430001010101010101010101010101020203020202020204030302030504050505040404050607060505070604040609060708080808080506090A09080A07080808FFDB004301010101030303070303070609060608060706050707060B0B06070906090706080608090708080707080706070A0708080907070A0708060708080E0F0909090AFFC000110800C800C803012200021101031101FFC4001F00000104030101010100000000000000000A0007080905060B04030201FFC4005C100001030303020404020504080D15000001020304050611000708122109133141142251610A321523427181165291A119243343628292961834445657637273B1C2D2D3F0171A2538455358747783949597A2B2B5C1C3D1D4F1FFC4001D01000202030101010000000000000000000708060904050A030002FFC4004D110002010105050406070503080B0000000102031100040512210607314151081322610932718191A114234252B1C1D1156272E1F01682A2171833535593B2D2436364839294B3C2C3D3F1FFDA000C03010002110311003F002A7A9D6EAF5E722B95697F16B61BF25A3E5A53D08EA52B1F2819EEB51EFF005D646A34614A4529CFD254CA82A54544AE98EE1598FD44FC8E761858C771F71AC0B69C909F5D43EE72EEDDE9B3DB3D1EB163BAA83539D516E02E6019315050A5641F627A700E993C73114BAC2663EAA024A8035E94E9A9B251B91DD6DEF6A31C8302BA95EFAF6EB1A4B231A2695258EA4D154E9A9E005A6C368C7DC6B6558A21A3C144766A28AF0717F12B5A9259537FB3D03D41FAE7FF00E508F1F77E77C3F4D52EAF53BF2B55D642D25E8925414CC8467BA549007B6403EA33DB567F54BDB71EED94F4EB2AA8BB5E86D82194888D3CE3C3F9EE1712A009FE68C63EA7D74338F7B37578F3B870411E01424E87CC0A75AD35A59ECDE37A32768706C496E2B35D1E374626F4C64558D830F0B0C8CE18D4642A1AA33D694B4A8420FF001D57773BBC543889E1F94A834FDD0BB6A97BEF14BCAE3D8B6CB2DC8A9B2C14651265A9C710D466544800AD5D6A192842FA48D67F909CCD8FC62E216FAF206FD8B024DCD67C22CC28D8F2DAACD45EE96E0B6139C80E3CEB69584E4A5297140606B9E7521577F237712F6DF6DEBAF54AF5B96B1527674E9731654BA8CB59CA8ABE8D2074A5284E12004A4009474EA1BBD4DF34787DD56580F89C66048E02B41A75241A72D093691763BF47ADFB6971F970CC44512EEFDDB6563476CA1CB070348C46CAC4D331CE8A054E84337BFE29FBD5EA9A93B69C3FB569945429690BAEDD8F4A7E427A8F4ACA198ED25A38C651D4E60E7E63AD6E99F8A7F7A98941756E25ED74E87839446B8A5B0B27D8F5A9B7063EDD3AA87814AA6529A11E994E834E640EC861A4A07F40FDDAF7E94997B506265AA09F8A7E1DDDAF3AE3E852D935882B14AD35F04E7FC46F409F80B109ED37E29FD94AA38DC7DEFE2AEE6D8A9C201936BD6E2D6C2CE3E6596A4261140CF7090A59C7B93EB729B15E35DE1DBC92A5D16CEB5B92F63D9D576DC52D9A65DE87283254E2C8FD587660430EAF2AC04B4E289390338D018D46CBB4AAC17FA42DCA2C9715EAE18C90BFF2C0EAFEBD36D59D82B2EA014BA63951A1BC7D036E798D8FDE95E4FF004286A518376A79AA05E541A6B52A34F7AD3FE136086F1FD0837528CD844994914CAB230AEA0D0ACA1C11500FFA45D79DBA9CD3A5C1A9C28952A5CD8950A73EDA5D61F61C0E36F214321495A490A4918208383ACF4B34F718809830DE8EFA5BE990A539D41D5E7D40F618F6D72F0D91DF1E74F0BA70A9F18F7F6F6B66948597574C852C3D01F567254ED2E4872338AEFEA50A3DCE882386DF89F92A9F4CB1B9DFB468A30F963B97959AC2C8655903CC994A71454063E65AD8709C8F958EE0060B65B7E387DFA95394FB6A3DE7423FBC00F3B552EFBBD1C1B57B36C6B1F78BAD3C395881AF801255BFEEDDCF2A58BE3CAFF07FAF597540A60A32660A92CD5FCEE8313CA3808C67AFAFD3E9DB4D96D1EEE6D6EFD58341DD2D9ABFAD8DCADBEA9B7E642AAD26525F61C23F32091DD0E24E52A6D402D0A052A09208D392A64FB8EDA2E894300CA74D0D45351FA7B2C86CB70685DA39568C2AA5581054D75A8D08229C0FBC5B125AFDE35F32CE4FD33EBACB96B3FB38D7A987E33306A115DA7312243C121B7D44853041C9C0F4391DB5EE6722D86B75074269C75F770F7DB5753640C9191AF3ADACFA6B32A6B3DBFE1D68D7EDFB60ED7DB53EF4DCCBDECFDBAB3A2806555ABD53629F0A303E85C7DE525B47F1235EFF00480054F0EB6C45B833B0440493A000713D00E76DBE931284F39345765CE86D8614A60B0D85153A318073EC7FE846B5A75B3939191AA7FDE2F1F3F0C8DA5932E9B1B7AEADBB35860E171ECFA1499A83DB23A25B896A2AF3D87C8E9C1F5C6A95B7E3F121DA7B815B9B1ECCD98DD2163070A63C197568D4F5BAD8CE14F86BCF0A59C0F94A8A53EDE9DE178D6F2AE57504870CC7408A41A7BC569E7C4F95998DD2F640C6F1C984778437685455AF3347202C09D02268CE7A7AAB4AD5B854C3D5320A9C0D226C35BA4E0243A9273F4C675FC711FD1A0481E3C54AE9C1E25D414BFB6E0A719FFD57A77F6CFF00125DD360D522B2BE35D42A369F5FEBA0BF7C87C847FB513013D2AFDC40F720EA3F876FCEEECE04CA40FBC0934F68CA3E5F0B1D36EBD1AF2C5766970BBEACB2A8A886484C79E9C95C492004F2CC02D78B0E363495A3070476D7AEB16D5628F028D54A8454B10AA0DA9C8AAF312A2E20632700E47E61EB8F5D0DA6DDFE26BE1FDC4EC389B93B35BEDB70EB881E6C88AD43AA468EBC8C82A4BAD3A5232A390DE7B7E5EFAB80E3F73DB88DCAAB6AA3726C96FB59F7646A7B6872A109E7170E7D352AC60BD0E4250F252544A42C27A14A0405123455C276DAE57823B89633CCA93424539034229CCD0D90CDACECF9B418703F4DB9DE4568A8EAB9973160002503024F051506A452BC2D279D46329034B4D4C8DFBDA342D4D9BB90A524E3E58525409FB10DE08FDDA5ADE7F6AEE5FEB62FFC69FADB4E7B366D61D461D88EBCFE8779FF00EBB480AC4AA24D7A19A1D157456D0D143A954853A5D5F528F564FA7629181F4FBE9B4DCADAEB4B77ECBAC5857B4276650E623B969410E47707E475B560E1693DC763EFADE194E7BEB24D23D3B77D7B5EAEA8D1989F5520820926A0F1A9E3687ECD6D35EEE57D4C42E6E639A264923923A2947520AB2D00008207E76A3893B4B72F1DAF416D5C6DAE4D254B269F5108C226B40F63F40AFAA7391AB07DA4BAAE1AF5364D3ACCB72A171C84343CF5B2D9F262A4FED3CF11D2DA7F79C9F604F6D491DC3DB0B5F75282D5BB74C575D8A890D486DD6884BAD292A0484AB1D8280E93F63F5034E85A1198B228AF5B969C78F41A1B8C7C3391986C04AD1F439F7FAABD4F7C9EFA05CDBA8FAF2437D5E840E7C751EEE475E56B70DA7F494A6258245F4CBBE6C47C4B33708F40324B941049727C5182A010C435328220DF894F73E6583B63C6FE3144AB07EAF7155A75F973A23A8A50A11DB4C484D81EAA6B2F4BC0381D4C056327E5A27B36868B6ED7A1D1928085B31D3E6F6C65C3F32CFF00944EA6AF8F3EE11DDDF15FAD59695A9FA7D9F48A05AC83EA9527C9FD22F003ECBA8BA93F749D451D253DA271356BF7D1E3F5509017A05F00F9863ED26D78BE894D929BFB3ED8CDF359EF015DA4A0153293336834002B42A00D02AA8B137781970CF67B72B69375B7C779F6B6C4DCF54CAE26DFA245B8E911EA0C43663B2975E79A69E429214E2E5210558C8F2303009CDEA2F847C31710B6D5C48E3284A8107A6C4A5A48FDC431907EE3BEA38F840DA2DDA1E1EBB00D9643532A2CD4AAF215D382E97AA32148511FEF5E4A73FE08D5966A3D8261E8B775A81A804E839EBF9D90DED3DBDEC4EF5B577D78E799512792245591C00B1B774B940200A84AFB4926D585BAFE0F1C07DD2853D0C6CFAF6CEB6F021BA9DAD517E12E3673DD11D4A5C5F539F9993E98F4EDAA42E51780E6FB6D843A95D7C79BAE16FBDB2CA56F2A90F3220569940EF86D05459944241CF4A90B51EC96893A2FAD2D7D7DD9CBBCA35500F51A7F2B7DBB0ED9BB5B82480C779796304560BC169148E80B1CE83F8196DCCCAB743AD5B557A9502E2A454E815E86F2A34C83363AD89111E49C290EB4B01485020829201041D371775856DDE71D4DD5A125330270DCA6874BAD7F8DEE3EC7235D0079D7E1B5B25CD9B7E4D4EA50E3D89BD8C47F2E9777428E0BA7A47C8CCD6C11F12C7A0C13D68FD8524642828F90FC74DD8E2E6E756B69F786DC728372C4F9D975B25716A918A884498AE903CC657D270AC020829504A92A481EE2384CD7370EA4D3938FCFA7E76BA0DC1F699C0B6EEE4D749515670B59AE5250D47DF889033A03CC00EA6950342582E1CF35F937E16DBC916F5DB2AD395FDB6A83E94D7ADA94E2BF455CD1C7629711DFC894919287D3F3A08C7CE82B42BA3170DF977B37CE3D87B537F3652B88A850668F87A8C07143E2EDFA9250953D025A3F61E6FAD3DFD168521692A42D2A3CE4ABD42A6DC9499746AAB21F86F27A48FDA41F6524FB107073A63AC2A9F2D366FF009516B6CC6EDEEC6DA5B33E4B6F4E45BD75C9A546AAA9BC869D79A61D4071690B560A8129EA501EBA63F74BBF43778CC77A228391207BD6BC3F7870E62D591DBC7D190311BD25F30247CCE6999519CA8E69285D5801FE8E43AD01463C0DBAC11689F5C6B48DC1BFAC4DAAB3EBDB83B9B77DB76158D4B60C9A8D5AAF31B8B121B63B7538EB842477200EF924803B9D7314B7B90FE247B7D558F74DA7CB5E42B35A427A486AFF00A839D68F5E871B79DF2DC4E7BF4A811919C671AF2EFD726F9F1CDE3665A7CA0DE3BE6F6B6682146135506588B0E328E72F2998CDB6893230A5243CB0B73A4F4F584E8CEDDA26E3DD33AD2A380CCB4F7F3F8035E16AF08FD13BB52B7D8EEF307C8E402C21941FEED464F696750A353C29622EE72FE267A742A8D6B6C7C3F36FD379543AD51517E5C911C119C3E9D74EA5FCAE39EB94B920A305272C2C77D0DB6EEDD7CACE615D8C6E072A379EEDBDEB0842931BF4A490EFC0A14428B71A237D2C45413DCA5B4A467D53ACE5A162DBD6544F87A444064A861E92E614EBDFBD5EC3EC3035B8E958DB7DF9DFAFCC554D1790FD1787C731B5E3766AF45FECE6CEC4B2DED03CD419A875E1A86934735E623EED2B5D0F1B33B4AD8BB0A9E94FC5459F587477EA90F903FA11D23FA73ADE2258D65C14F4C6B5680DFF008462214AFF002882756A1C71F09EE687246340AED236F1BDB4B2241CA2B5773AAA7B4E27F9CDC7E954971247A2D2D741FE76AEA767FF000F7EC8DBE88B3B7BB79AFEDC6A80016A87448CCD261938EE85A97E7BAB48EFF3254D9381D87A687315DF10BCEA4BD3A96207B87E82C69DB1DFBEEEF6609818DD8CAB5062822591EA388765042B793BA9B08D0A0D0C003F4352B03D07C3A3B7F56BF2BB7A80EA4A1CA251DC41F50A8C823FE0D1EAD1FC22BC3D2914D894D3C79A5557CA49499132B35171E77B9395ABCF193DFE9E98D7D6A7E119E1DD5488E437B8DD478C93FDF23572A8CB893F50A44907F87A1F71ACB1B2179FBC3E2DFA5832DE92ED90CD97E8B7CCBC2BDD5DB87B3BEF95800AA5B656155505322D7A5324823AA3B7E411F7CA3A7BFEFD328FBD77F193726CFDD2DABAE54691322C80F44782CE50B4FE761DC63ADA5A490527B292540FD74635E203E0CBC7BD9EE3EEE96FCEC65C1B8D6FD6EDD868A92E873E6B7360488E9750974214A6C3E8504296B0A2E2C1E8030324E84E379A969A9EDF5655D1D4EC62DCA6FEC52A009FF254BD66609885EAE77B58E563462052A48D4D011D286C47C4711D9ADB4D9B9F17C0E30B25DF31CFDD047574412156A68C190D06ACB53A1D2C4B5646EB0DD4DB6B1B746D8A954E1D36B74D62A0DB6992AEA8EA5A415B4A20FE642BA907EE93A5A809E17D7A3973F1423D064BAB5B96F5C33A98DA544121A5F44A491F6EA94E019FE69D2D351769732063D2D03D92BC2CF7349485AB004E838F3F9D8DCDA4E48F7CEB26CA7033AF2B29F7D651A47A0D3CB33DB87EBAC76F4B28F41EE7593691E89D7A198B4EFD15F1427AFF004AFC4797F0BE51C795D39EBEBF4F5ED8F5F7D7E9A47F1D6A9E5ADA4D0DDA94E1AEBA11F3E87CB8DB99672B6E97372FC4FB971773AEAA4328DC3B99B8EA527198CC4A762B2483823F5686FB63B6B23A8D7B655D55EDBC3B9D7D39D65CA93F3279F31212ACC895E6F74A7201F5EC0E07B6A4A6AA277A57EEF71066FEB525BF3B7791D84B6685C764A2887DE3FE1458BFF8EDD0B3811466687C25E27426BCA095EDED0A67C88E81D4FC269E3DBEB974E4FB9C9F7D4B4D464E147FDA69C49FFC98DADFFCAA36A4DEA69735A46BEC1F85B9F0DE3CC5F17BCB37133CE49F332B1365A8BDC9DE65F1E38876EB35DDEDBFA1D127C8429CA75162A7E26A955C647EA22A4F514E4749757D2DA4E02969246A00F89978AEDBDC4A44ED9DD9A148BCB910E369F8B53C3CC8769B6B4052572123FBA49525495218EC00505AFB74A1C0F4DC3DC8BF7766EFAC5FDB9976D7AF7BCA7AFCC9751A8C853CF3A7D864FE5481D9284E12903000031A8CE39B52B09C91EADCCF21FA9B3BFD963B04DEF68635C53192F0DD1B58D053BCBC2F22B5044719E4C412C3D55A10D6B8FE54F8E7723776DC9F6E6C143638FF0062A8ADB12D928955B98D9C8CAE4292511F23070CA42D273FAD50D52BDCB745CD79D6A75C9785C55DBAEE294BEB933EA52DC952642BEAE3AE12A51FB927582D2D0E2F9884B29AC849FEB90B5D5EEDB73B82E01077184411C62942C0559FF8DCD5DFFBC4F9596969696B12C4BB2D2D2D2D7D6FACB53B381BCC0B3787DB9C2F6BBF8F9B7FBCF15C5B4513A7050AB50D49270E53DD595B2DA86544E5BEB5612038803504F4B5EB04EC8C1D788B46B6C3646EB8A5CDEE17D04C5282AEA19D491FC4A5587B8DBA1CF1779A1C7CE60DAEAB8365EF78B53A9B0D25CA95065E18AAD23381FAF8C493D393D21D47536A39095920EA53EB9A96DF6E2DF5B517751EFDDB6BB2BB64DE54F73CD8952A6C8532F3248C10149F54904A549394A8120820E345E1E1A7E2E76DF270D136537F9FA4D9BC805011E9F39080CC0BB54076F2C7E5625903BB5D92E1EEDE33E5249981ED5ACA724BA3723C8FE86D469DA8FB025F3018DB14C10BCD745AB3C647D640BCC9A0A4918E6C00651AB2D016B5DEE969696A5F6AE7B43DF1085253C1DE56F51091FC85AB0FE3F0EAD73BFBBE37C6DA97344E90A2E409081D87A96D583DFEF8D1FDF8ABD6DAB7FC3E793539D2D04AE8D1E08EB240EA7E747607A7BE5D18FBE3403152425CA74F6D63A90A616143EDD27439DAF9B2DE108E401FF17F2B5DB7A3330AEF365EFA5B83CEE9F0BBA57E4E2D23FC232BCA3686F9D014B2511EA34B9813E982EB6FA09CFA7FA9C7F4696B5FF073B56E7BC6E3DF6A3DB8CF9E4C4A53CEA4AB0010A95D3D8649382BF407D4E969A9C2518C4280F3FC6DE3BB3DA6B94386C697896356F1F8598034CE69A56DD0B9A47704FAEB676A5C53486E9E2991D330482F19793D6A41481E591E98C8CEB5E653DF0076D6B3B8FB9FB7BB2F61DC7B9DBAD78D06C1DBEA431F1552AB54A40663C5464246547D54A529294A402A529494A41240D3BF7B7503331A01AD6BC3DBE5EDD2DC5DE11048EE238812CD450A054B12740A284D49A529AF216725947A0D69FBB1556EDFDA7DCFAF3A8796CC1B76A52D496F016A0DC6714427EFF2F6FE1AA02FEC88F3FBC4D6FAAB6D5783F6D0B362ED4D39E762D6F7B2FEA7F970197014F4888875B71A6C9041F294D4890A4B895165909274EC0FC3777B6F4D3EA173F3FF00C4AB93FBF370BAC3921FA65BCFA614088E00AF919337E2905BC04764C7647AFCBA15627BC256AADD519F88CF5017DC4EADEE14F3B36DB3BD9C9AEE55F1ABC4701395BE8E15E49073A3A2D1632472670DD4581D38DCC9322EE7C9184A2327F7E4B87FE2EA54689055F866385D3A2BFF00A037B794F47A9208E97A454E932118215D8A114F68FAF49FCDE808F7C8867BF9F875B945B5B4D9D7371479194EDEA6D84A9E16D5C71FF45CC7923D1A61E538EC67567B77598E3D7BE90EDACDD65E6599A6522A69E1E945038EBD3A5BA6EECF7DBEB04C3F0D8B0D9E3932A97FAE046B9A466F5480053353D7D695E74B154F87C570DC3C1EE29CF2E177CBB1693073D0138F878E96318FB7958CFBFAEA1BF8AD7893C7E2159EDED4ED354204DE45D76295B6B294BA8B560AB23E31D41EC5F51C865B208CA54B50E94A52E562F017C64ACBE2B7156E8E25F26B6D2F2DABE5A6D9409CCD2EDFAB445B0D5D6F3D2D6EB0CA3E50A8EB47C5B7D495E7AD96CBA85AF252288774B73AF6DE7DC3BBF74F71AB526E3BDAB93573EA12DC3F9D6AEC1291E896D290942503B25094A46001A89ED1E2725DA258383902BE5C8D3CEB61D7663ECAB06D0ED35EB1ABF2D6E10DE2568508D2F2CCE5E3047FAB5465671CC954FBD4D4AB359ABDC757AA57EBF54A856EBB364392E64C96F29D7E5BEB5152DC71C512A52D4A249512492493AC7696AE27C3CFC23B71797D0A06EA6E6552A7B53B04B7311A5B4CA4D4AE300E15F04858296DA0411F10E05273D928730AE91C5CEE6F2BE541527FAD6D6FBBC5DE5E17B3D7037FC4E458E14A01D58D3C291A8D598D3455074049D0136A76D2D1ED6DC7857702F6D28AD5220F1E6CEBB5E0801E9D7205D524C850FDB25F2A4209FA369427EDAABDF160F0ADD96B53646E5E4771BACD87B775EB7489B7051602DCF82A953D4A4A5C7596492961C67A838423A505B0E76C84EA437AD9199232F5069A902BFA593ED81F48CECEE298B47862C779413388E39E411E52E4D10385762A189001D6848CD4D48167D2D2D2D456D60365A5A5A5AFADF596968967C25BC2A76C37436BE97C9AE4BDBCDDE94DAC2DC36B5B8F3AE3719319B714DAA5CB4A0A4B856B42BA1A3F27424288575809B7ADCFF0A9E06EE8D05FA2CCE3FDAB64C9E9FD4546D80AA5CA8CAFE702D61B59F5ECEA169FB76D4A2E7B253491893415D4035E1CB95908DE3FA44367308C5DF0A74BC49DD3149668D63CAAE0D18286752D94D431D0541CB5B0166BD116549812634D8525F87319712EB2F34B285B4B49C852543041046411F4D5A9F883F8566E8F0AFAF702DBA9BFBA1B08FC80C22B2863A25D156A386DBA8349F95214484A5F49E852BB10DA9484AAA9351EBDDD1E36C8E28459C0DDFEF130DC76E2B8861922C90BD46615D0F35752015615D55803C0F3B1997846F8920E525A29D8CDE5AD35FE882A0C40A8B31F580ABBA9C818F3C13F9A5B7D83A9F55A70E8CFEB3A2EBB5CD476F3702EEDAABE6D4DC8B0AB52EDDBCA8939AA8D3A63070A65E42B2323D1493DD2A49ECA4952482091A3F3E0F72CED7E6671F6D5DDFA1B6C536BFDE9D71D292BC9A5551B4A7CD6FD49F2D414875B27B96DC4670AC804AD95C73BD5EE9FD61C0F51FA8B523F6F7ECAEB80DEFF006DE16B4BA5E1A8F181A5DE63AD00E51BD095E4AC19741945A12F8ECDEC8B5F82932DEF88F29DB92EBA4D27CB0A39752D97261EC3D4030927BE0038F72010A99FFE919BFEF2BFFE13A26DFC445BA6872A9C72D9289230E32C542EAA8339F50E2931A2AB1FF9A9C3EF9D0C3D7DEF87A0D6E464A7CB88F2F23D46104FFF004D45B6A66CF7BCA39651F9FE26CFFF00600D9B370D8549DC53BF6BC4E47957BB53EF58811E445AE37F0B430DB9B83CC7754D36B79146B7928594FCC905F9B900FB6703FA34B5BBFE15CA11E9E6F5CAF441826D2811DFEA04FF00DD55BA8E9CFF00E2E7247D307D74B56B1BA34230A8FCF3FF00EA1B71E5DB6A6CFB657900FAA2EE38FF00D9E33A7C7E35B171C99B06970A654AA736353E9B19A5BF224487036DB0D2415296B5A880948009249C000E837376F959B0BE287CBE835CE6AF21A7F1ABC29ED2ABD429D6BC2699A821DDD0A9C3F24BAA498ECB9D2E944D8AE2D6B095478F21A6DB0971E71DD5CFF8F0EFE54B61FC38B755BA0CF7A95715E93E158B11F6D78521B9456ECA48FAF5C38935BFA8EB27DB43C3E371C66A7F0FF881E0E7B0D063AA1D42258370D76BE8EBEA0ED7AA0E5324CF709FDAFD6AFCA4A8F7F298693E88004337BDB42E0FD1D3D540AF20FBC4B5154F968491CF4B1B3B136ED6EECA3119EA25BC3CB05D9C52B0AA42649A54A8233925114D2A0672388B7405E1C5F1C5FDC4E386DADC7C3155A8BE3508EF53ED8550E94ED3E006A33EE47712C32EB6DAB09799790A514FCCB4AC924E4E9FF9287EA2CCA4071494B8852128CFCB8231DF5CE3366BF114EEF711380FC78E1BF123696D2B62EFB6697399AEDE97232999D52A454A54B3FA3A9ED94B608F884953F214E75A96B1E4A7016A8F0EFE233F18854F76633CB285123A9D2E7C2B7605B45A40CE7A01553CAFA7DBBA89C7BEA02DB75004506B5A0AE51A034D40A91C2C76BBF65EC51E792453185CEE2332B92CCA18E566CA8C2AC284F03E563CCBA2BD54B5AC5DC1B8E8D4AA956EB74EA34C9F0E0C48CB90FCB7DA656B434D32DA54B716A504A421295289200049C681C17CD9FC43766CE892EA94FE61D3A42828B4DD4F67D2A43A3D0FEADEA614ABD7D71DBEC74439E0E9E2AA9F101A1DD362EE6D26936B7226DC8899B526E082887704152FA3E36334492D142CB6DB8D12402E36A49C2FA11401E273E21FE20DB0FE20FBD1B5CBE496E5D3EC4B5AF08F53A350A9925BA4C75D29C0CCE8B11E5C3434B79A2C3CD34A2E15A969CF595127314C6EF4AC04AA5A87A7E7F0B1BB75F80CD03BDC678E22E9A9CFAE9CB2687439C74E56200F178F0EB67981C4A637429B448EAE6158740455A9F56871D0C4AAEA59683B2E9AE86FB2C2FA5E5B29CFEADEC0494A5D73A83CF6EAEB4DE56AC0AB2D49F8D4E589491ECF27193F6C82957DBAB5D2C2D0BAA877D5A56BDED6D4B150B72B34E8D55A7C80301E8CFB4975B5E3EE85A4FF001D7358146A2DADBF1CA4B3AD54B49B3E957CD4E152836B4A9023226C96DBE929EC47436DF71D88F4D0B77C384235D84E38A91AF50481F9FC859F2F4706F12F30E32D85127BB995BC3AF859559C1F2A65603F88F95AD53C2EF8587999C8B8949B9E2C85ECF5B286EB3753892522537D7866085020A54FAD2A0482086DB7883948D1D8D3A9D4FA3D3E0D2693061D2E931594468B1A33496DA8ED2121284210901294A52000918000C0D557F834F1E63EC770AECAB927414C7BC2FB5FF2BA7BA53F398AEA40848CFA947C386DD03D029F5E3D756B7A85ECC61A22841FB4DA9FCBFAEB65F7B72EFBA5C7F69248118FD1EE6CD0C2BC8953499FA12EE0D0FDC54165AD3F712C3B7F74B6FEF9DB3BB5A90FDAD70D1E6D0EA4865CE8715164B2B65C085FECABA5C5615EC707DB5B8696A42403A1B27775BD3C4E258C90CA432B0E20835047983C2D4F5FD832E047FADFDCFF00F391CFF93A5FD832E047FADFDCFF00F391CFF93AB85D2D6AFF0061DDFEE2FC058E3FE745B5FF00ED0BE7FBE7FD6D543FD850F0F3FF00629BA3FCE9A8FF00CF697F6143C3CFFD8A6E8FF3A6A3FF003DAB5ED2D7EFF6341F717E02D89FE729B5BFED0BF7FE666FF9ADA4EDA6DD5A9B45B7F67ED858B01CA659B42A7B34CA6475BCA754CC76D3D284A9C592A51C0F52493EFADDB4B4B5B100014160D5EEF724B234B29259896662492CC4D49279924EA7ADB07745B16F5ED6DD76D0BB68F02E1B62A711D81508329B0B6A5B0E24A56DAD27D41048FE3A014F103E24D4F86BC94BC36B5289922C5938AC5A935DEE65D29D52BA12A57ED38D292E30B2704A9A2AC00B4EBA03EA89FC7C361E35F5C62B577C29F050AB86C6ACB6DCA7C27BFE8B9CA4B0E2547D4E24084467B00A5FD4EA33B598709212E38AEB5F2E76793D1F9BE89706DA44C3A463F47BF1113A9E025FFA0603EF16F01FDD73D0583DF56F9E0CBCB293C7AE5352F6E6BF53F87DB1DC2533429E871603716A593F032467183E62CB07B81D320939284EAA0F5F561F7A3BCCC98CF3D1E436B0B42D0A29536A0720823B820E0E4685F73BD98A4122F23FFEDAF8379FBBEBB639854D84DEC7827464AD3D56E28E3F7918065F302D3E7C4F77ED9E44735F79AEFA5CE33AD3A64D16C515417D4831210F24ADB3FCC71E121F1FEFDAACBDC79621587763C4E0AA138D03F758E8FF008C35BB6995DFAA988562390C2805CB94D338F729492B27FF00713FD235B1C2C19EF8B5FB4C09F8D4FCAD13DA2C320C07655EEB07A976BB18A33D4AC59109F366A57CC9B14EFE17AB315038A9C88BF97192DFE94BFD14A4B850905D4C4A74773D7F3100CF57AF6CF563BE74B5397C04B6B97B6BE18DB1F2E5465C5AA5CF32AF74494291838766BAD30ACFB85478D19793ECA03D0696ADEF602EBDD61D121FBA0FC7C5F9DB836ED2B8C8BDED45F265D477CE80F5C9F57FFB2D103F13B5BF55A87097672BF11BF36994EDCC8899801396FCDA6CF4A164631D3D49E9C9F75A71EA7185FC5BD6EB17F6CBF87D7216D7099F6609B5EA709EDB40A5F4D4A253E5C4CB83D8B74F92A4A73DF2B23D0EAE9F9DFC55A67343899BC9C759B222D3EA75BA70728D35E4929815561C4BF15D560E423CD69B4AF1DCB6A58F7C6A86B6EB72D5E23FE135BC7E117BDB064D9DE24BB1B0C3D69502AEB024DD7FA14ABC86E0751FD6CA1083F4F5360AB2971B9092A42D7E58A77A185B09DFA4C8B94FEFA1AE5F6914A75D6CDCF64FDAD8CE1F7675F5AE1789BBE5E905E1557BD3FBA8C183D2B4F093C6DACFE191F0E1E0EF2A36D378B909BFF6140DF0DD5B6EE816FC7B66E269B9343A5C254565F6662A111D321D756A94DFEBFAD090C7CA804F568AF3941C06E226E871837A769E5F1C363A91459D6C545A88605AF0E1AE992430B5B3223B8CB69534E36E8438952082149FDFA0E2FC2857B6FB593CB8DCAB6E8FB55B997171C6F5B7D506E1B8E152643948A0D5E0953F05C952C0F290548766C70827ACAA4A15D92951D1E9EF4D02EFBAF687762D6DB89746877F54ADAAA53E82FD4DD71A88D541D8AE371D721C6D0B5A1A0E29B2A5210B504E484A8F6318D938A37BA0F08AEA0E9C7F5D2D3EDFE5FAF906D09ACCD96B1B47E33F56282A280F868C0F9D284F1B7321FC3EB7154687E25DB6F1213C5A8F53B7EBB0A627A943CC6530D4F84900807E78ED1C10476CE33822587E26DD867AD0E4FECEF2069F10B745BCED8552263894120D4A9CE60A96AF40551E5C44A41EE7C95E3D0E2C1FC3C7C01F963E1E7CAFB27911BF1B93C72BA2D6894CAAC28D16D3ABD4E4CC325E63C90A5224D3E3A3CB0975793D79CF4E01F6B47F145E20ECE731B8AC6DBDF2DD5A7EC65AB6CD5A25DAE5E12186969A436CA16DBE951716DA425C65F751DD580B2DABA56501260C709916EF91C50D4900FB07F3B334BBC3BA4B8D0BC5D5C3465155996A75CCC0F9923C3F0B403F0F3F116B5F6FFC121EDF2BBAAB0E45D1B4D4A9D6488AFAC27E3AA2C748A44548EE70E352A9AD67071D2E1F441C0BB710B6BEEBDE1BD2C8B4FCF7E65E97F5D51A2890EF75A972A425A0EB87E995ADC2A3D80393E9AFA6E25BB69EF66E0B9C3EF0E7A4EE85C1B02CD498AACEAB5C9505A9DBA2A0CB6B67F4D4E6821B660C769321E6DA421B4B852BCAFADC5A1B6E5F6DAF873F890F1CAB942DFEE3E6E2DB1755F168B827C3661F9F2DB8EA4367E50DCD8E629F949003BD000EE08206A19B51B3D79C42011C5EAA9198EBAD390EBCACE67674C45701BC4F8BA44ED23A4820AE50239187873D78D0920815346E1514B741DB6ADEA55A16E5BF6AD0A3FC251297058A7436B39F2D869B0DA139FB25206B33AA21F0C3F1A5B439652EA7B07CA3A3D2B8F3CB8A1B2F2E6D3E6F542A75C0D30DF5BCF46F3D5D4C3E84A56B7232D448424B8852D2161A85DCE0FC42772D53706A3C76F0C7DBF6778EF34B8E457EF79105736215A480A5D2E22701E6D249FEDA7C86BB1210B414ACC7D30F72DDD81AF0A59018F613119AF66EC51BBCAD589E1A9E24F3A9AF524D74E362AFD2D0272394DF889EDD7D3B852B73A7D68C65FC73D46543B69F4C84672A67E11A686414923A1BC2C7EC10A09D110F84BF8B6D8FE22B66D46CEBCE9B4ADB7E535BD183B70DBACF5A2354D80420CFA725C5297E4859095B4A5296CA9490A2A4A92B564DFF00059A11590115EA0FE76D9ED6EEA710C3A3EFA75F0F323369EDA81A79FC6D721A5A5A5AD5586D65A5A5A5AFADF59696AA9FC473C5DB8DFE1D5063DB373A2A5BA5BF55087F1749B268EEA52F796721B7A7C820A6230A50201295B8BEE50DAC05148FBD4FC5E7C73EF29151DC3B2F8F7655A7623AB32E151BF92BE638D461DD28E990F894F28A40CA92905449294A41091B1BA6152CBAA027DC6D3DD99DDA6217F4EF204F0F226BAFB2809A79F0F3B1B06981E56ED3AB7D38D7BE5B471DB0E54ABB6C4F85001C61337C952A3A8E7D83C968FA8F4F51EBAA8EF0B9F1C2B2F9AB75AF8F3C84B3A9BC7FE54B2A5B51A9E16E374CB99681FAC6A225F25D8F2D242F311C52D4529EA4B8B3D6945F7EB02F57620147E7506DA944BDE157D4948CB2C4C9221F3560CA475151F95B9912D0B656B6DC4290EA490A4918208ED820EBF1A94BCE9DBE83B37CC2E476DE35F0D029F0EECA83F0592427CB86FBA64309C7D9A79B19F7C6A2C8208041C8D006584A3153C891F0B7587B2FB4315FAE91DF213E19523917D8E8197E46DFDD461DDF8F57BEF706C6DB2B622B953AF4A90CC38B19B1953F324BA96DA6FF00793D18FF0077A936B5A1B42DC74A10DA412A27D1207B9D493F02CD8757287C4DED7BFEB14EF8FB36C36A55F92FCD6C9407D929669E8EAF44B8992FC67923D488CBC0EC48286E7F671AF97F551D40AF42DA57DCB98D929F487EF7A3C0B656466A5583395FBCB18CF4F6B49DDA8F69B1E76C9ED6D2B64765F69366E89E5AA8F6A5B54DB763A92301C4458CDB217FBD5E5F5127B92493DF4B4EB3B948071A5AB688230AA1578000016E196FF7A7964696435662598F524D49F8DBC8C7AA3F7EAABBC457C216D1E6D9A272236BEF3A971D795D6E38DB345BEA90A534663CD8EB65A9C1A2974F404E1125B5071A0AFEF894A5BD5B119709DA6D362354D6E3CC694E17A4F984992147E50527B27A7B8EDEBAFBB0B52505B2B516C90AE9CF627EB8FE27FAF5ABC6F0B8EF5118A651949D41F23C410743D0F11695EC1ED7DEB09BD8BE5C5CAC8A3465F31AAB820865E4CA41534F61B0DF6DBF89778CEF86EC085B5DCCCE0A8E5E6D2D2526343BE76F63A99796C03FDD9E7A130E3053DFB07E2C5796AEA2B5A94ACEACFF0083BF881386DCCDDE6678ED56B6F7438CBBD32FCB6A934BBF63C78AC57251F5871A436EAB127390969D4B65CCA423A947A058AB1F953FBF55B1E241E165B1BE22B6332E57C1DBADFDA3C750B56FAA7B589505632A44796918322275FCDD0485A0E54DA9054AEA175FF62EF102E6BB39603846E06A3A07D0D7A57DF66AB00DF4E11884823C5AECB133E8D7BBBB3808DC98C04B2915F5C29534A951C05ACF391B30AEAF6CD333DDA8EEBC47DD6B09FF00EDEB9C378D7729F7AF7A3989C8CDA5AE6E85C8F6C85915F668F43B55890534D66434CB6D38EADA4612E3DE6224ABADCEA5A0A8A52523B6AE67895E2D5BB9C5FE40543C3CBC54EEDA6CCBDED0931ADBA5EE50A8372D94B1E5A5D8C8AA4847771B5B4F34532D603A8EB02484A838B48D0F2D6AECEEAF2179E3B91064B352873B732AF5384F32F879B5463539453D0E0012B406968C287A8483EFA01EDEE3EA50115073AAB29E20E60A41B5957652DD2CA97B78DC2BAF712CB14ABAAC8A217955E33E794539EA01E36229F0A3E30DBF69ED0EC35B50D8621DDDB8726953EAF520D8F394672D018464F70969A79B0104E02BCC56015AB477564D8B696DC5A549B26CFA342A15B10580CB31DB400318F994B3EAA5A8E4A9472544924E740BBE1D7BC4F5CFC68E3CDFD40A823F9474087129EB59505AE3CDA7AC3492E0FE71F21A73BF72160FBEAE4773FC43B90BBA16A4EB39F76D0B2A9B2DB53331DA1C47997E534460B65C75D70A127DFA3A4904827071A26E14AA215C9C2829F0B15FB41EE4B14DA1FA24387BA2DDD149933311958D3C7940F19CB5A73AD751526D4A7E249C07DA6E59EE35E35FDBEA9D336FEE387704D6A955B661F9EDCFA4090E069879B4A91D6128E8285E72903A7D15DB7CE39F1876A78C566336AEDCD15A13DC427F49D624252A9D57740FCCEB80764E73D2DA7094E7B0C924C8BD2D7E930D8849DE80331E7FD7CECDAE1BB3F0C34602AC1554B9E2682953E6799E765AA41E64499DC0EE6B71BF9DDB3E5FA0CF915B2F5C512210845414D140928527D312E2BCFB4E01EA52A5FE65156AEFB54ADE26509EE406FEF0FF0087966A5EA95E95EAFB424351C657144D90D456144E084E0094B513D9294051EDDF5A5DB0443756CFCA94F6D7F4ADB47BC58216B83F7F4A539FC0FCAB5F2AD8FB23498F363B12E23ECCA88EA12EB4EB4A0A438823214923B10460E46BEBAF84287169D0E253E0B2DC684C3496596D2301B42400903EC00C6BEFA5BED52A2CB4D6EFAEEBD1B6236537777B2E268BF42B46D9A9DCB29A4AFA54FB712338F96D27F9CAF2FA476EE54300E9D2D429F125B72A577787EF34E83486FCFA93BB6171AD96F049754DC079CE8481FB4AE8291F7235FB8C6B6CBB842AF2AA3702CA0FB09D6C1E7E1E36056B92DB83BAFE205C847D37C6EADC3714934B7263616888E27A0B92594AB213D194C7640C794864A53DB18378E2070436CE06DC5B7B81BBD6CC4BCEF2AC446E7B50E692A8B4C8EE0EA6D1E503D2B714829528AC1E927A40182541E3E1355B8555E1CDB90A2B895BF4DADD5214900E7A5C2F79E01FA7C921B3FC468AE297E29D49A06DFD0E874CDA3A8C9BAA1D398861522A494C4F310D8475E528EB29C8CF4E013E9D43D74CC6CDDD952EEB979804FB6CEA6FBF66F1E9B07BBDCB66D58673F5ED1BAA10328CA33165214926B4E4A01D343431F8893C3BEC4A06E751B90FC54A4B5B65BD543A0C6B966B3437171DC9823BCE80EB5D0416E4B68610B6CA70A3E5948CE51D35CEBF127F17EF121B36D7B0F6AABB0B8F7B790E98C53EE1BBE881DA5AABF35B404BCFAEA090A790B5AB2AF87861011D58564608BB8DD7DD3BBF79AFAADEE0DEF2D9935D9CB4E50CA4A198CDA4610D3292494A123B00493EA4924925B38B122C1611160C58F0A3233D2D348084A72727091DBD493FBF5AFC4F64219A612B7BC0E67AF979D88DB2DB954FA1DDD71321E6890091CEB99F9F88EA69C2A454D01E36A4E6BC19A8F5C6DEAC6E0F22EF3B8EF694A2FCE9C8A6A0875D23B95175D5B8E1CFED2940AB19C27D355DFBB9B3D7EF09B77626D95EF5772E5DBBAA341FA356BC92D34FA3212A52524A836B6D4425C6FA8E0290AF450C9666AAB3C5EECFA3D738AECDCF31119159A1DC109F84E1ECE10F7532E349EDDC10B4AC8EDFDC81F6C6B4BB5FB0F7596E8CB9780AD75FCCF1E9E7630E1ACD8438C430EAAC9151B89A3A8F591C57552388B5495EEA5A6CCBB56DAD4DAD34C94A0A070410D2B446FF008516DBB529FB7DCB0DC09F446EA5587AE1A352A42D470A5446A33EE25B42BD523AE42D47070A29467F28D0D34692E55769449964B8EBD40579A4939592C104FF001EFA245FC2A73E539B63CC9A72DE52A0B55DB7DF6DBC0C256B8F3028E7D7B86903FC51A1BF664BB818818DB91715FEE30D3E76137A67B13336CC477B8F4578E17A1E86F31B508E0788A8E1A58B02A0A8EE4990A88DB8CC52E28B4959EA52519EC09F738C77D2D7C5EF51FEEB4B562B1F0B7291335589B57CD39BDDB8AE35508FB9576ADF6D5D494BCE075A247F39B57623EDA93942DE589176F2B1755D918B157A504B53A3461FE98714406D4C827F2AF3EFF970A04E139D616972E882992039D05CEFD27B6A336E6488E1B98DB2E14B4BC294907E55919E9247A64751C7EF3F5D2C1826D95E2EE49A9208228C49A1A6875E878F95AF5F6DF71384ED2B2412C31C4D1C919EF628D14B479877B192A05432D72935CAD461CC1D6EECF10ABE2DF9925712C9B699A7824B6DBA875E7129FF000961D6C13FE28D49FE32F352C8DF87A650A72625B77430DADE5365CE969C424152890A3941002D5DCA810927ABB1029AB74D4CFF006C8181EBA6176AF64377390F52DDDDA7D94B8E1D9579D76CDABD223D6A5F9A98D4E548614DF53AB6815B614952D21C482A4150524288093EB866D9DF3BE1525AA7D4D35F21D0F4B319BCEEC25B1526CB5E2F51C49767BBC4D225E833F80AAD7EB2AC73A9A50835635D0D686C35DC95BFE95CC7E74F277781B90FCAB46E0BA2B154A6BC9050BFD1DE716A11EE07CC1911CE08EFD2723D75FAB0F6E22D9D43ACD1654C4559A9AE2BCD3E5F402D94F4F49193ED9CFEFD6677A76617E1E7BCDB8BC79DD7BA6CEBFB74294EC54D4E4D9D257360321C8EDBC8692EBE86161C487CA5685212A4AD24608014AF5D1EF1B76B742FE51C3A9B0DD29209756EA823C823D43809F94FA7AFAFB763A4C37917EBEB5E5C3860A5A874E2E0EB4FEF569D682D65FD8CB65F6662C22EF240F03DE04264521C556EEF1A840C2B423BA0A5811552CC08153671F845CA87F85BB9B58DB3DCA7A63DB1F70481204C0852FF004548C04A65A50904A925212DBA81F3612850CF4E16703C3AF104DB4B1368E8F6D5C56352B71ACD5A15368D5CA27C33C6630F28AF0E15612E8CA958702B3D38491DB3A0319F4FB5370E88B61D541AE52D6A3D0EB2E0516D63B652A1F95433FF00E7B6A5DEC7ECFF0035B8CBB3B6E723B8AD5E6B917B253274A877458AC36E3D50B7E634A4F5F9D4F492BC2DB7197132A293949FD6A1011D3A2B6ED37A9980BADE41CCBCFF001FE63E1D2C11ED2FD9F2E777BB01781DE61F2C80C2C8CD9A07219946653AA533656AEA3C275A548F772EE1B7EEDDC2BDAE8B5A829B66DCA85524CC854E012043656E1525002474A700FE54F61E83B0D699AADED8FF0013EE37EE8D3DD8B7DD68EC7DED1D2BF8CA65C0BE963281F3F932FA421583D821610E13901074CC6E2F8905EBBC77833B21C04DB1B8776770E6A8B2DD6DF80AF223A7A824BCD30BE9C363A812FC92DB68EC549527BE8E536D15DD53BCCC29C80E3F0B46E2C7AE776BBAE57195540515A9200A0AD7527A93EF369ABCADE5DED9714ECD7EAF74CD66AF7BC9614AA25BAC3A049A939DC254AF5F2980A1F33A46000A0029584973FC0D3C3FF766F6DD8ABF8A6F2EE972E0DEF5B65D5EDD5265B6A696C467D92D2AA459272DB3F0EA31E3215925A5ADC2305A5972BC3E7C03D8B52F783CA2F117B9E172077E5D7113D8B59D77E368F497BA41499CB58C4D75BEC90D2408EDF4E079C3A542DBBC4AB9A71FC3FF0087DB8DC888569377DDDD0DC8545B6284A5A9B6AA95898FA188CDB8B4F74B292B2EAF0525486949490A527427C5B1B9B119D6EB00F5982AAF524D057E3C7801F1B23DBF3DFDADEA3682EE6912839DFCA9AD3AD4713C295038D6D3D34B5CE9367F697C523C6979193F6DEB5C96BAEE6BD64409770CF853EEC9543B46D6A7A1C65B5962045C84B616F45670D32E3CE15254B0405AD39DE77780F73C7C3A36C687BEDB8BBA96A5DF652EAADD35DA8D917AD5DD7E8925632CA9E4CA662AC0594AC256D7580A4E15D1D49EA23FF9BF946114D38121FB0A95F812EA4FC059013BE88482F1C6C507DBA8FD0DBA1F6BC753A653EB54DA851EAD0E3542952D87234A8EF27A90FB4B494A90A1EE9209047DCE80A3C2A7C63B96BC66DF5DA6D89E4DEE25D9C86E335DF5EA75AA2A3734E5CCAD58F2A4BC9623C96A6B84B8F430B71B0EB2E9514A120B6525250E1F1E855B73B0978C2E611CD4218551C7DA1C0E87504731ECA75B11765F6AA1BFC5DEC1C8D08E86C035B4B44A9F85FF003EB7C3837BB325EA6ED957AA49A85975998A296A530E295F00F959C27F5EC9F21C50C84C88FD19F954745C3C5A81C0FBE76899A06F4C1B72D4DCB8A5F6664D9D53930D7350A70A9B7D970381BC84A92928FAA0E52527BE95E27DE18DB51E243B44D506B8EC7B337B284D3CE59F7621BEA305D5004C59491DDD86E2929EA4FE6410168EF94AC56B6B393FBD9C1ADD693C32F10EA1D5ADAAB53088F46BB1F2A7DA762E7A59756F81FDB30D6127A250CA927E5700E9596E57B15B5AB94412E9D0FEB67C36476AA2C7B0E5C3669E78658D9584D0B956A8D35FBC8731A83A06A578036BB3BC2150A9B765D14EB5AA8E56AD98F5192C53A6AD3D2A97152EA834E918182A404AB1DB19D60B58FA7D42055A9F0EA94A9F0EA74C90D21F8F223BA975A7DB50CA5685A721492082140907B69B0DD7DF9D9DD8FA52AB1BABB876D59AC7475B6CC99199327DBF53191975D3FEE1271A28C9305198914EB672E32238C676D001576A6BA713C06BCF80B3BFAA00F162E42C2DC5B96CDE2A6DED41BAAC885504D46E379858536CCB08521A8CA29F76D2B75C707A249403F3214138FE43F8A8DF9BA9FA4B6EB8A76D562D782FA4B2FDCB342533CB646096100944607BE1C5294BC774842B18847B79B6ED5A264562AB29558BAE5655224A89574951CA8249EE493DCA8F73F6D057795BCD82084C31105CFF005F0EA7DC2D26D83DDFDE7686710C0185D811DF5E48206506AC919FB4E7869A0E26DB6CDA5C78367CDA2C749F85669AB8A81EE521A291FC70357F9F84DEBB090F737287597132A96D48B3A708885252EB893FA592EA93DC288C2191EB8048EE0AB544CE212EB6B69C054850208FA83AB0DFC35BBBB1F6B39DDBA1B1B5C95F0ACDE76ACA890D0A501E7D4E9EF09084E0E33FDAFF00A415DBBF6F4C67106ECD78885C4A8E789FF89597F123E56197A643645E4D930D028A468DA5340239629694E9911BDC0D8ED2A8B88E4D98E4065D620A9E5A986D672A43793D209FA818D2D791DC1E9074B5661168296E416692AC4FE16AECBC917CED916D8BA23A1FA73A4259A9444A8C6756467CB24F742C615D95EA01233DF51B2F5BFDB90DBB9781C83EFAB8CAA32C5C36BD46CAAD32C546D796B0E3F15C40295AC020282BF3020138C1EC707D40D410B4B861186E7D7665D13644DB0232D0ED3DBEA01733ABBF428839484FA28FA9F6C672007B45BB595251F46D558D06A7C3A7DA3D38EBEEE95BA9ECDDDBAB049F0F925DA3A4779BBA0725174BD7882810AD7496A56ABA2D097140182C26DBFE39EE6F23AAD398B7233747B7E3A43932A92CF434CA490004E7BAD473D929C9F7C601225B6FDD3291E18DE1FF00C99DE7DAFF002AB1B9B4AB71D7E3D5A5C704B95179688F196A6F24796DBAFB4B28CFCDD24138C62CCE894AA5D0A045A5D169F12994C653D0D30C3610840FB01FF43A623997B15FE89CE26F21B60DB09FD25745A950A6D39454121BA8164AA2AD44903A52FA1851C900807B8CE7524B96C3ADD6166435972B656FBA72E9947B79F1B2F3BE2EDDB88ED55EE2C3E51DCE162584C9745209951640499DE80B69AE4144068684806DCD836FADB62B147937A5E04DDD76D7DD72A5539F523F12F4A71D595A94B5B992A528A8AD4A392A528939D33558DBCA6CDDD372CBA14999028CE3699939B0BF95AEC55D281EFD9490339C751F61A7C36965CE6ADC916B56A2C8A6DC74396ED327457D050EC75A16474AD27BA48EE820FBA15AD826D91499B76532F20ECD8B568C82D90D2FA51213820058C64E3A8FA1EFDB3AAD3971D960BDCBDEB354E703F8BEC1A7B387BADD5B5C775787E2DB3D70FA0C5114537767A50131D297850C35A962738E746035A5BC9C57B1E8752E53527642B1559341B3AB957A7C753DD63A9869C79B4ABCB52B202BA5E500A391948CE71A3668B176A38D7B501A67F43EDEED85BD0CA94A51210D201EEA51EEA71D5A8FDD6B5ABF694AD0316EAD32A343AB50773E84D1765D3541B98DA7B1718C9EF9FDCA5A49F51D40FB6A524FDFEDC7DE1B3ADE8370EE85ED7A5A4C04B90E1D46A6F486A32C27A7050A510169194F7C90320763ADB5DB695618FE9416ACE154B74751421BC8D01F3B0F71ADC84B89DF7F613CDDDC3769249638287C77795F3AB43C8946678CD410B4079D091EDC7C5FF0FDF116DB8B7B77DED977057274B7DC9B7021BFD0F5679E69D536A69D54570A5E4108FCCEF5AC850C741035609C59E226DA6DFD323D95B27B6F6C6DA58B1D48F8E7A0450953D8FF00BEBC72E48788FDA714A563D4E3516BC0776D6DBBD3895B9156B95A9351535B87321C74079C406109A753D671D2AC6145ECE31D88FBE88129148A650A9D1E954886CC0A7B43A5B6903B0FBF7EE4FDCF727534C2F1B692EEAE7D6235FE5FA5AB03B426D2C38262F79C22E39C98A475577A7841D47F1100D0680695F2B7BF50CBC40B8716F73C38AFB87C74ACDC52AC9AB4F545AA502BEC321E5D0AB311F4488927CB3D9680E3610B4762A6DC7120A490A13374355B53F89FF85576DCF2A87B9DB63BD5B4545321D6E2568C762A914B216421C7DB6141F6CA9010A28436EF49246481D472F09BD4D0CAB3C04864219587220D41F88B28575D969AFB1BAC685940A381D0D797135A1E16A50B9F6EF9B3E179B9702F7DD8B3772760EE8A4B4B761EE6D8CDCAAA5AF3993942C9A8476C98C958042A34D4364A4F70A4904B71C84F139BE398D0E8567EF5F302E2DE9A7C7909769D408CDADC6DE9402825C453E1B290F3E038B485F429C0144038C8D193EDEF8C1F864EE6A5955B7CCCD9BA6859C27F94329DA091E9F98545B63A7D47AE3DFE874F07F6443C3FFF00F0E7E1DFFED3689FFECE9ACC3FB53C8101BD5D227940A77A18AFCB2353CE84596FC53B2A1EF0AC525E5109A98B2923E74F9D6C26FE1B1E14DC86E49EFF00EC96F96E96D25E9C7DE2F5A17053AF5449BAA288558BE25C37D3222458B4D59F3D886A71B65C7243E9475B784B60951524E335052E6F141F0E8B4E3AA55579B7C6396CA505C22997941A8AC8CE3F24571C513F6033EF8C6A3F5A5E399E1957E6EA5A5B3F67F2165576EAAE5562D129AEA2D6AB350DF9AFBA1A69B2FB919294852D684F987E41D592A032401B787B7B7AC62F0279D400A2888A0D1471F793CCD8D1B0FBAD7C3EEDDCDDA3948F599CAB1A9A712694B58DEE86E741DBEA736869B44DAFC849F856159E948F42B591FB23E9EA4F6FA91505CA3E2B6D973B6DF93636F55B2E5D55590E2DCA7556314B551A33E477762C820F94004A72920B442005A5494EADAF7536986E13B4EA8C5AA2699538E82CFEB1054875B273DF1DC1049EFEF9D7E6DDD9AA4DBD6957A8AC484C8AF5421B91DD9EA460A3A92474A07AA519C647A9F7F6C442ED3A22D79D980D8EDA8C3EE1740EBACCE68D507C3AF5FBA050D06A4FC8276B1E149E239B33745C5B2BC73E51D1A66C13B20390EB2ED61FA7161246549F210DBAF32A0AEA04B07A1CF954719213AE567C3BF877C4744DBC39C5BB3B81CA8DEA970BE329162D0DF769912A0F7E5CD4EA1D4B9422820FEB12B61C56084A55D2AC18CDB3C77B91FADA51742E2C2A1B6ACB8B61E0B5C900FA207AA73F523B0F63A027DC8BDAB3B8D7E5DB7BD7EAD51AE54EA539D92A932D7D4EA90547A01F60129E94848EC90001D80D6936CF6B9E08824649278127D5029C3CF5F65AC2BB2DEEDAE7B57799229E57686EAB099023105CB96C8A187AA0F74D9F2D1A9A022B51A8CF5D31FA954A6D26DBB6AD284FBCA7514EA4444C6891527B0436D8C9C0000EA5152CE32A52944A8F9B4B4B4089242C7331A93C49E76B8BB861F14112C30A8545015500A0500500039002CB5731E103E16113783766C2E7C4DDECA95889B4EF02E45B520D312A7EBAA8CC364BCA9A5F1E4C75ADE2CADBF2565696DD1D49EBC8A33BBEFDB76CC8DE655A6032D49CB515BC29D73F70F61F7381A273F090DC0B2B7C788D4AABEDDD12EAB2AB96956245167CB79C017227A92896A79971B57747F6D84E0E140240C630746FDC55DBBBBF8BD4C84A28341522AD50453AD295E951436AE7F48FDFA0C4F675B00BA5E523BCC8EB5611AC863428C1C302464CE18293EB856254703626F789F4ED8D2D33DB337CCFBE6C96A5568A4DC305F553A7A9231E6BA8008731EDD495215D86324E34B568B875E96689658F830047F5D6DC576DC6C95E70AC425C3AF407790BB23D0E8483C54E95522854F3041B3AAF459702439167C5910E5A71D6D3CD942D39191949EE3B107F8EBDAC287F4EB1D22A132A729D9950952264B5E3ADD757D4A56000324FD801FC35EA6558C7B6B30A9A78B8F3A7CED1489D731CB5A54D2BC69CABE76CDB2AEC3595655E875E53FA2C53A02A3BB355552B70494A9203694F6E8E83EA4FAE73AFD32AF54EB5726B692C3E134D391D3CC57E3D7CEC0D9E3B9C369BC45E5E35CB3B2E94B6B61775E4A8D73C86B0D51AE3C753E158F4F88E932D24F7528CB0000819ABF42D0E210E36B4B8DA802950390A1F507DF5D173957C65DB5E626C06E371E775A12A45A970C22C264B6906452E5A485B132393E8EB4E250E0F63D2527295281E73B7DED26E9711F7C6FCE256FC4114EBEADD92A6E9D2D39F87AD4023A9991196402B65C6F0E20FA804A1412A4292103ED23BB130CDFB4601E16F5C0E479FEBECAF4B750FE879EDA097DB90D91C51FEB62A7D1D98FACBC00D7DC3F8F29E3269F571B6DE6D6D3A843AD2C14A92A0085023B823DC6A3D5568B5BDA3AB49B9AD561DA9596FA82A753C124C5FF093F61ECAF61D8F6EFA913AFCAD095A54149041EC41F71A5770CC4CC2684555B4643C08FC88E4788B5DCEDBEC2C78822BAB149E225A0BC2D3346DCFC991B83A1F0B0D0F220BAFF0E85DD6F5DBC2ADCD9142A9C698A4EE5CE5BAC858F3638552E9813E623394E4A16067B1E938CE357EFAE63FB3BB87BFBC46DCA4EF2F11772AABB63761284D429885F553AB6CA55D5E4498EACB4EB64E7E4582124E5050403A23BE337E26EDB67A2C2B4F9BBB1D786D2DE48404395EB55933E9731400CBAA88E292FB09273808323F78F62E60334324416035A0F54D2A3DA39FB4696A12ED71B82DA2BBE3536297C8832CED9FBC881CA4D00396BA8AD3453E21D3992A5D7379E1F785ED6F947B8DC98B01BDC8B6B6D58DBEBC5DB7EA7124539DA83ED8F3A434953682B4050061B89F99609E9393DBB9D3F1DBC49F82DCAD910699B1BC97DB4BAAE592AE862892E42E99567959030DC09896A42F04819421432460F71A1F2DBD8A38B1E3C9CCFD969C5506DADD8826F3A32947A04F9CEA45456523D1585BB594E7D72D1FBE889B1587C32DED60BC83958EA2A46BCB5143C48B06F7278ADE2E37A92300AB94068CBC81A1D08FDEE966769DF879B687E1108AF6FEDDF50A876EA76150598AD9EC3384175C23BE4FE63D8E3DB27D5FF5BC9B0BFECE1B8DFF00A031FF002B4429A5A64D37798781409FE27FF9AC799369676356C9FEEE3FF96C343737E1DDA634CADFB279191E449C7CB1AAB6CAD2852BBF72F3729440FC831E59F73F6D474E227006EBD8DF19BE1771FAF8AA59771CC8B2DADC232A8A1E723B2D416E5CC683BE636D9439E6D312076291D6DF72558D174EAA1FC3621B5C9EF1B8E67723213099F61ED85B49B2A99253F325BA8AD4889D4958ECA0BF83ACA863B14A87EF239DE2EC9DCAE9077B082189A0F131E5AE849F2F8DB4BB5DB6132E1D2AB64A653A84406A745D401CC8B15469696B195CAF50ED8A44EAFDCB5AA4DBD438A8F364CD9D210C311919C7538EAC84A464E324E80405923E7416C9EB98FE8CF395FE3BDE1DBC7CA3DC344A3EF248DEEBF036F466606DF309A9865EE8212E19C56DC3090A23252F297F44AB1A03AA36E56E7EEB5CD02C5D94DB4B86EEBB66A8B70E053A0BD519F24FFB546652493FC14077D46F68F66EF179645897EF549F3A53DBEEADAD23D1F3BC9B8ECD5DAFF79C5CB2097E8BDDAE46AB84131723400019D7562A35E367E6A956A6D1613B50AB4C8F021207CCE3AAC01F61F53F61DCEA3B57B79AB97354A2DABB5D44A9D4AAD2DD4C68CA6A329E9329C51C250C309049513D8641273E80EAE638E7F875B9D5C81A61DC3E48D7A95B0F452C97E2D1AA2FA665766FA10DA63367C88614323F5AE05A158CB58EE2C478D9C3ED99E1BD5E652AD7B1053EFD6818D36B555CBF527B194A8798A03C90718536DA509C8EE33A99E0BB947BB8596F8A75D40234F8713EFA7B2C65BFF6E0FED53CD73D9A9A2458682528E1A420F0208D141EA84D0D467E22D5F9C03F027BAB766A54ADD5E6F572AB65DA4EA91291684391FF00662A80E08F8E923222208C02DA7A9EC150259527457D42DBBD98D87DB4A4EDCED05956CEDB6DE5298298D4FA7B41B69BEDF338B51CA9C7158CA9C592B51C95127BE991DBEABDD373486A9768D12A35FA8903E56861B6C7F39C70E1284FDCEA65DA1B20EA5F855ADC9A846AFD41A50718A6B00FC1475FB15F5777963EAA0123D93EFA3D6CA6C44B39CB0AD178173C07EBEC16ACADFDEF670DD9F90CD8ACD5905592EA86AF213A8256BE104FDB92838D093A5BDDB156EC9A259922A9398762CAAC4D72A41A5F6534C94A50D023D894212BC7A8EBC1F4D2D3FC8A942669751A7BB4989225BAA429B96A5282E38072401E841F4FFA0C2D357835C1618442B5A28001EBA6A7DE6B6A21DE5EDAC98BE272E273D33CECCE505691D4D15012350AA1403AE94AEB5B6AED287AEB34966432861C79879A69C49534A52080E0CE09493EA3231DBDF3AD75A58C8FA6B6072A73A6B3063CA96F4862323CA612A390D2739C0FE275B59D4F2A79FF002B40AE4EB424D6BCBE3CFDD5F7D2D906579F6F4D6C948950233EB72A104D4182DAD211E61474AC8ECAC8FA1EF8F7D6A4D2F18D64DA5E3B6B59788EA29690DC2F254D4534EA07E078DB38D2FF0086AA7BC5BFC2AA91E22DB20CDD3653D49B4392F6702BB46BCEAC34998092E1A6CB581D7E438415216325974858CA4BA955ABB2BFD93AC8B4BF4EFDF51DC6F088EF11186500AB6841FCBCFA1B11F6076DEF5855F5310B9B159623546079D39F553CC731516E5D91665E5675E772ECD6F3DB156DBDDE4A0495C0AAD2AA4CF90F79A9F5F94F6C9042BB652A4A82924A4EB72D1BD789D7844EC9788BDB69BB1994DED4726A97143542BCE233912528EA2887526D382F47EA51E958C3AD1C14929EA69611BBFDB37C96E0B6E17FD49797BB7156B6DE2B5229772C5429FA657194FF007E8D2529087D38E9240C388C80E3695646ABC37ABB8BBC5C24335D816889D29CBFAE9F0E83ACBEC2DE93CC2B69AEA987636E22BE2800B31D1E83893CC7EF74F5E9EB379F5E6950A24E68B1362C796C9F543A80B49FE07B6BE14CAAD36B311B9D499D16A1115F95C656143F776F43F63E9AC8697B652A75A823E56B6F8E48E68F32E56561A1142181F9106CD35C3B2F63D710B5C780AA1CB3E8E433D29FE2D9CA71FB80FDFAD3A9950DF5D90DCAB137CE9175CFB9EB366CC8932932E54B71E2CB0CBA5618536B51296095B895360F4F4B8BF627522B5F27996A4B4EC77DA43CC2D250B42C0295248C1041F518D4AF05DB6BD5D9810C480468796BC8F11E5CBCAC01DE37665C131552CB1AC72D1B2CB100BAD34CEA065615A13A063F7AC66BC60E4A6DC72BF66AD4DE4DB4A930F5327B0913601792B91459A00F361C803F2B8856467002D252B4E52B04C80D03EF0F3673998DF20E956DF002FAABDB7B835A0B53B015212882A61A4A9C52A625E4AE3B8CA07560BC9382A0139528037DB1387BF88BEF8625506B3BE7C6EDB584F9434E540AE1075B4127A94DAA3407969200F5001F98749F521DED9DDF7DCE7803B86CDC0D00E34F3229F31D0DA9FB7A5B2926CF5F4DC7146447A6651981CC84901969AE5254D2A01D0822CF4F89773E2D5E186CCD5A0D0AAF4F9FC82AF455C4B56908712B7A2297941A8BEDF72961AEE53D43F5AE242076EB520657851E293CCAE08D817E58BB09656DF4917355D75AAB56AB76E499F539524B4969397FCE4A549474A9494A92475B8E139EB3AB44E6BF8275DDC4AD94A6F2C371F7EAE0E4AEF0AEBA866F29B3D958621A1F4A511DF616EAD6F3A50EA7CA538E2B2AF399E96DBE8575550E80FBCDDEF34D79C813C2A3C209EBCF86BC35F653CECC6767FECC787ED661071079C18CBB2776A95A3211EBE6CB43A820007C255ABAD03BBBB7E36FE2DD7A407645677DEE0DB4B79C21AF26836D41A5F42F24F69018F8904E31FDD3181F7399EDB11E039CF0F106B56C8DFDE4B7372DC976157E9EC55E8B54975D9D7A545D8EFA42F210B71B65BEC70521FC8525495253D3AA9CAAD2E0D6E9D329753613260BE8287107DC7D7EC41C107D41C6AD1FC14BC4DEA5C0ADE185C46E43DD211C4BBB6A3D745AE4F7BA59B1EA2EABFBB951EC886EA884BE92425B590F0E905DEBCADD2ED4DC6F779EE6FCB4AFAB4240F7F3F6FB8F5A05BB70765EC6365708FDA3B2795957FD2931465875CBA65D47AB506A6A9C72D6F978D3F8743C3B761154CACDFB6C5D7C97BC584852E45DF3314E0F7BA9BA7470DB4518C8E87CBE07D49C116DDB39C6FE3E71D29B51A4EC36CAED7ECFD3E52FAE5A6DDA24782662BBE0BCA69014E63BE3A89C0F4D3FD57663C49B222C49CCD4A3208E87DB23A5D18072304FD7EA758179DCF6074F361381DDA15061451D081AFC78FC6DCE3EDAEF2315BFBB0BFCF2BEBAAB39A0A1E4A0E502BC2829CC5BE2F2FD7B6A226F3F17ED8DD8BFED3BBE4ADAA532C157E960D0C39392903A31DB1D47BA4A8FB04FAE31A964A2A7141284AD6B3D801DC9FE1AC63ABF556B737BC2A39D7BB9454541A798FEBE15B68F6137A1896057BFA761523472E5923CEBF75D72B020E8695045783056E56D5A816CDBF67D298A25B5498947A6343096D9463A8FD547D54AFAA8924EBD8F2FD4FA6B3ED55D7129D52A70854D7D327A4175C6429D67A4E72DABD539F43EBAD59E560635BCB9C3946500003414E94F958678EE2724F219A676677AB3B312496275CC492589E24F9DBC8F28773EDA5AF8BA4FCDEDA5ADAAADA24F2EB6FD3C28A293497A1CA9AE5694A77E31A5A006DA0143A3A15FB591DCFDFF0076BF0D2FD3BF6D609A5FA1D6DD4EB8E7C1A1D5EDF60471066ADA5BC4A3E7F90E4007D867BFF01F7CFEE68C81A6BAF33C89D79721C3D80579DBF174991DBC5A0A7215A90B415D7ED11A9E55240E56D56EDBDEDFB0A88F57AE29823C449E94211DDD90E7B21B4E47528F7EDFC4F6D3169E5ECF5D38D3E26CB497A2097E7A67AEA21124B7D38E82DF96401EF8EA3DFDF5A1EEF79D71EED354E967AE15329EC7C3B44E521C74A94A5E3D9584A53FB9235BB516C66E543EB4B40E13F4D2F9B67B79785BC98603408695A035238D6A0E9D3E36B7FECF7D9676793028B11C6A3334B7A41205324AAB1236A81723A9662B42C589153940D2A5F8DB2DDEB5F7358928A4FC6536B7192152E9D313D0FB03D3A80F45233DB23ED9033A785A7076EFA806D21BDBFBD681773690C3719EF2661F4EA88BF95CCFD4241F331F540D323C8FDECBD6E0ADD629D42B86752ED165C2CC762328B62484F62E384775F51EE01EC063B67BEB6171DE32FD17BC9855C1A651CF4AD7C875E3AF2B45B14EC2335FF6845D3057C973923EF7BE96ADDC9CD95A31400BB6A192B97C0482D55A9B89A53B4B0EBC6AA89CA67CA57962394821CFD92ACFECFAFDFD34D9EECECF6D4EFE58958DB2DE9DBEB4F736C19E312A975884892C2940109712143287139252E270B41EE920F7D0E14EDFADD1B0AA88AA516E59ED38D2B23A5E5B6A23DC752083FD3DBEC75709C28E5D237FE8EE5BF5F7126ED8AD15F9A404ADF09C7521C480075A7A810A000527BE014AB3EB836DA437A7EE9D482DA004D41F2E1CFD94B6D37F3E8F6C7F6530CFDB976992686220C9246AC8F1746A666AA83C486A8E34A548A7BE447E18CD9AABCFBAAF1E1D6FBDEBB0B70BE80F53EDDAC8554E8CDBA093E499191290C9F97BB864292413858C003F9C91E13F3EF848F545DE46F1DEE1AF6DE444ADC55F56820D528CA61271E73CF343118139C264A63AC81908C6BA4BC4A830D419F11C84C3EFBDE5F43CA3F331D2727A7F7FA6BF8D4B79B6E4328756969E4169D483D9C41F54A87B8EDE87514DAFDC761B7E04E4CADC997F4E9E4296C5DC0FA4936C765DD5639CCB0FDA864D7CA80914A9A0AB10E684D0D6DCB2E83B8D65DC61229B5E85E79380CBCAF29CCFD92AC67F8675BB68DFB9D1E121E1DDBE1B73B9BB9775F1CED9B4AFBA6512A3584D6ACD57E8296FBCD30B74A9E4C70187D6A281F33CD387D707401DB01083166499BE6BCB5C898BF94AC94A02401D93EC7D73F5EDA4DB7ABB9E383A890BD431F08A7C6A74A7CEDD0F7617F4867F94199AE7F46EEE489734AF9B41A69957C45AA46A495A74B19A7E1FBE3CC0A06D46E6725AAF0506E1B82A26DCA43AB48CB54E8DD2B79483F475F574A87D6227443FA825E18B69C1B2F80FC60A4C04A434FDB68AB2881EAE4C75C96B27FC690AD4EDD7E704BB08E0551D013ED3A9FC6D54DDA7B6DA5C576AAF97B90923BE9234F28E36EEE31E5E1404F9926D073C4BAD845DDC0BE52529511A9A19B59FA9F42C1C24C45A2505F619CA4C70A1ED948CF6CEB9FD4B9716047765CE931E144460ADD75610848FB93D87AEBA4F6F4D9477276737676E9284BAAAFDB354A284AB1857C445719C1CF6FEF9EFAE6AB5DA240AFD327D12AF1CBB0DF4F4388F42920E4107D882011F42350FDB48477A8CD5A1142474075A7C6D65DE8BBC7A4382DFAE9065324722488AC48199E22AB9A8090098752013416C8B4EA1E421D69685B6A0149524E4281F420FD35AB5E569D3EF3A14AA3CE484B87E78EF63BB0E0F450FEB047B8274C3D997F1DBEB86A3B7B72CB53F438F256CC596B1F33033D82877F908C1FF000727DBD250A168710871B5A5C6D4014A81C850FA83EFA8EE21874B7494329D346471CC7107F516B0BD90DB1B8ED0DC5E09146619A2BCDD5882636D5594F51507230E34A8D4100A0FF0F7F88FD6F76AC7A9F0437EAB0B73796C381D76A4F96F296F57E8083D3F0E54AFCCEC40A692920E571D4DE07EA56A24BAE39EC481AE6094CDCDBCF8D3BCBB43CB1DB07047BE2CBACC79C51D65089F1BABA1C8EE91DFCB750B7185E3B96DE50F6D74C2B06F7A1EE76DAED96EADAB3589D6A5DB6E53AE7A53A85851543991D0FB5D58F4574389C8F6D58D6E1B780312B88490FD647A1F31FCBF0CB6E437D26FD95CEC6ED333DD81FA35E6B24669C093AFB2BF0CE24A0A016CF54AF28F624772E9935114A6E30243A520904823001F52413FD7A60207226CEAACB0CA235510C295D25DE8CE3BFA91ADAF7A6D2AB5F162CEA25090A7EABE6B6FB2CA7D5F293F907DCE4EA09DA917E1DF315F4743EDACB6B493F9540E08FE9D15716C4A48A50129C06B4E3AFE565FB72BBA7C2F14C29EF37A2E5D5CAE456A08FC20834E65BA9D3C34A696B11A8DC747810E3D425CE6D311E00B2A4852CB808CF609049EC7E9AC6C0B8293590F7E8D98890B4F7524A4A149CFB94A8038FBE31A6BADA6D13D988DCC7CB8DB480DB6147B2139CE00FE3ACAA22B71AE8A52A028020B81641EC5BE939CFDB3D3FC7A759B72DA4679428028683CEC36DA2DCBDDAEF75919A47EF115DC1F0E5216A40232D6A40D4D789E16752B55266A521A7A3D3A15290965B68B71D24254529C159CFB9C64E96B04EAFD7FAF4B53F861A0A0B2AD78BE333163C4DB16CA8E71EBADCE876FCBAD53EE0A8C67A3B4DD3A3892E859395A4A82709C0F5EE4F7FA69696BCF179CA479978D547C5803F236F6D98BA2CB3647E195CFBC46587CC0B455DE4A5AE8F72D0AFA6D20C1928452A6608CA1C0A5299581EA73D4B49FA7CBF7D6D140BB84583D09EA394E0F6D2D2D2C3BCFB9AC77F397ED0563EDE7F85AEF3B20E2B2623B1F0FD2B530BCB0A1FDC521901EA467A0E1E10A3954B5D7DD79B9097958393F6D423DC29C95F9E3BE7B9D2D2D0F2B6B12DD65C9148A795A0AEE1C94ABE2300FBEA6F78505B1519DB9976DD08C2697123F7391DDCE8523A719CFFAA1273F6D2D2D49364220D7C407EF03F0D7F2B12FB6DE2D25D776B7F78A9568D6335FBAF22A37BE84D2D7FEDB9DFBEBD497BA7DF3A5A5A64196DC992486CC7F28A22EAFC64E4552DA98FD39F956257D84C86FF3B0554F7D2169C11DC6723B8D7325D8B752BDBD8284A482990F249FE77CF9CFF58D2D2D279DAC97EA223E67FAF9DAFF007D04F31FDAD7D1FF0056BF8FF216E911C03AAFE98E11F13E5E184F45814489F22481FA988DB3EFDF3FABC93E84E4EA5CE9696829706FAA5F60FC2C1DDEBA04C6EF6ABC05E2F007FBE6B2D73B5E65EDE37B51CAFE456DF46432DC0A6DE1544434378C222AE42DC647D8F94E3608F639FA69696A25B72A3BA53D0FE5FCAD619E8AEC46418D5EE007C2D02B11D4ACA029F7091BE36CE78516C3ED1F23FC432FAD83DEAB2E9F7A6DD5E3B6D548739977E47A1B8D98AFB7262BC3E766421711B2971041EEA07295292AF2F884F868EFEF85C544DDACD6A06F371327D4443A3D6DC96D3151A63AE7529112546242BCDE9428F5B495B2A09CFEA94AE80B4B4CDEC8EC7DD6FDB3024BC2D5901CADCF451A7B3E7C69651F7EFBFCC6F66B7CEF77C225291DE1C0923E209323D580E153415AD54D0660682957971EE831B970E26DF59941AACAB82B32A3D3D8449534D24BAB7501094ABAF1952B032A290339275D2DB845B3773F1D787FC6ED8FBD6609B78DB367D369755525E0EA1B9696525D69B58ECA6DB5A94DA48F54A13A5A5A9C7672D9A82EE253103F6471EBA9FF00845971F4ACEF9713C666B9ADF8A91494E8A053210140A72FAD7279D4F1D00B49B5ACA724120FAF6F6D465DD9B023C55BD79511B6E33A93D535A1D82F27F38FBFD7F869696992C52E6AF110DC8123CB4B55CEEAB69EF373C522303102474475E4CACC01047BEA3A1A1B622C38D5AAFB25D86B6A242410971E59C91F64A47727F7E069F916AB96D330A43F1D61C98C879121C5A54B791FC3F28F5F9703F769696B13676EA881180156AD49E541CBA70B49B7F1B4B7896FB78BA9622384A6545D3354AEAFCDB8E9C81034B798871D58436871D5FB252324E969696A6AF291C2CB243006D4D6DFFFD9, N'公举狸', N'女', N'1993-11', N'福建莆田', N'汉族', N'团员', N'本科', N'', N'15988123323', N'4536546354', N'阿斯顿')
SET IDENTITY_INSERT [dbo].[imimage] OFF
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20050010, N'令狐冲', N'22', N'男', N'住院', N'需要手术', N'CT图', N'异己真气反噬', N'吸星大法心法', N'百年竹叶青', N'', N'黄海', CAST(0x0000A4BB00A9B7AA AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160001, N'1121', N'12', N'女', N'住院', N'需要手术', N'不需要', N'偶没', N'广泛单干户', N'后果搞活', N'合乎', N'黄海', CAST(0x0000A5AD011B43FD AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160002, N'234', N'23', N'男', N'住院', N'需要手术', N'不需要', N'yti', N'yugi', N'hgf', N'gjf', N'黄海', CAST(0x0000A5AD011A9008 AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160003, N'11', N'11', N'女', N'住院', N'需要手术', N'B超', N'dsfdsf', N'sadfdsf', N'dsfdsf', N'dsfdsf', N'黄海', CAST(0x0000A5B200B6AB44 AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160005, N'按时', N'12', N'男', N'住院', N'需要手术', N'纤维内窥镜实验', N'反对感 ', N'后果后', N'鬼画符 ', N'规范化内', N'黄海', CAST(0x0000A5B200C53294 AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160006, N'hjhk', N'12', N'女', N'', N'', N'不需要', N'', N'', N'', N'', N'黄海', CAST(0x0000A5B20111F9D1 AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160007, N'111', N'11', N'男', N'住院', N'需要手术', N'不需要', N'sadf', N'adsf', N'dsf', N'asdf', N'黄海', CAST(0x0000A5B30170F6CA AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160008, N'按时的', N'12', N'女', N'住院', N'需要手术', N'CT图', N'按时大苏打', N'赌东道 ', N'cv ', N'按时的', N'黄海', CAST(0x0000A5B400F2E2B7 AS DateTime))
INSERT [dbo].[jiuzhen] ([挂号号码], [姓名], [年龄], [性别], [住院], [手术], [实验], [诊断病况], [所开药方], [调剂], [复核], [医师], [日期]) VALUES (20160009, N'龙用并', N'12', N'男', N'住院', N'需要手术', N'CT图', N'大师傅士大夫', N'士大夫士大夫', N'士大夫', N'士大夫', N'黄海', CAST(0x0000A5B8015CF07A AS DateTime))
INSERT [dbo].[nanbing] ([挂号号码], [姓名], [性别], [年龄], [疑难病况], [过敏药物], [医师], [上传日期]) VALUES (N'20160001', N'李小兵', N'男', N'18', N'ad', N'asdsad', N'黄海', CAST(0x0000A5B30164E126 AS DateTime))
INSERT [dbo].[nanbing] ([挂号号码], [姓名], [性别], [年龄], [疑难病况], [过敏药物], [医师], [上传日期]) VALUES (N'20160005', N'黄美珠', N'女', N'59', N'213', N'123', N'黄海', CAST(0x0000A5B301663D40 AS DateTime))
INSERT [dbo].[nanbing] ([挂号号码], [姓名], [性别], [年龄], [疑难病况], [过敏药物], [医师], [上传日期]) VALUES (N'20160008', N'朱强', N'男', N'38', N'sdf', N'sdf', N'黄海', CAST(0x0000A5B400F356DC AS DateTime))
INSERT [dbo].[nanbing] ([挂号号码], [姓名], [性别], [年龄], [疑难病况], [过敏药物], [医师], [上传日期]) VALUES (N'20160009', N'林敏', N'女', N'43', N'地方', N'盛大', N'黄海', CAST(0x0000A5B8015D0FEF AS DateTime))
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'111', N'黄海', N'111', N'男', N'福州', N'111')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'222', N'222', N'222', N'男', N'222', N'2222')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'333', N'111', N'111', N'男', N'13', N'123')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'444', N'222', N'444', N'男', N'222', N'2222')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'admin', N'徐林莉', N'admin', N'女', N'福州', N'13237997264')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'Eva', N'', N'111111', N'男', N'', N'')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'jack', N'jack.M', N'111111', N'男', N'', N'')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'john', N'John M', N'111', N'男', N'ssss', N'111')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'mark', N'', N'111111', N'男', N'', N'')
INSERT [dbo].[useinfo] ([useid], [usename], [pwd], [sex], [addr], [phone]) VALUES (N'阿狸', N'徐林莉', N'123456', N'女', N'答复都是', N'多少是')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'111', N'挂号')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'222', N'就诊')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'333', N'床位分配')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'admin', N'医生管理')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'Eva', N'挂号')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'jack', N'挂号')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'john', N'挂号')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'mark', N'挂号')
INSERT [dbo].[useright] ([useid], [rights]) VALUES (N'阿狸', N'医生管理')
ALTER TABLE [dbo].[bednum] ADD  DEFAULT ('出院') FOR [进出实况]
GO
ALTER TABLE [dbo].[guahao] ADD  DEFAULT (getdate()) FOR [日期]
GO
ALTER TABLE [dbo].[jiuzhen] ADD  CONSTRAINT [DF__jiuzhen__日期__060DEAE8]  DEFAULT (getdate()) FOR [日期]
GO
ALTER TABLE [dbo].[nanbing] ADD  CONSTRAINT [DF__nanbing__上传日期__1BC821DD]  DEFAULT (getdate()) FOR [上传日期]
GO
ALTER TABLE [dbo].[bednum]  WITH CHECK ADD FOREIGN KEY([栋号])
REFERENCES [dbo].[dongtable] ([栋号])
GO
ALTER TABLE [dbo].[useright]  WITH CHECK ADD FOREIGN KEY([useid])
REFERENCES [dbo].[useinfo] ([useid])
GO
