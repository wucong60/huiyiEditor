<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别
Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function

 Function if_opa(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		if_opa = "checked"
		ELSE
		if_opa = ""
		END IF	
 End Function
 
 Function if_checkbox(s_chr,d_chr)
	POP = INSTR(s_chr,"PZ"&d_chr&"ED")
		IF POP >0 THEN
		if_checkbox = "checked"
		ELSE
		if_checkbox = ""
		END IF	
 End Function 
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	
	
	SQL = "SELECT TOP 1 * FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("INFO_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	
	
	%> 
<html>
<head>
<title>文章修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">


<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统修改 </font></div>
<hr>

  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">类别：</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
           <%
        SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF RS1("CLASS_NO") = RS("CLASS_NO") THEN
        %>
        <option value="<%=RS1("CLASS_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("CLASS_NO")%>" >
				<%
				END IF
				%>
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=RS1("CLASS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料标题：</td>
      <td width="79%" class="main">
        <%=RS("INFO_TITLE")%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">副标题：</td>
      <td width="79%" class="main">
        <%=RS("SUB_TITLE")%>
       
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">简介：</td>
      <td width="79%" class="main"> 
		<style type="text/css">
img {vertical-align:middle}
</style>

		<b><font size="+2"><%=RS("INFO_TITLE")%></font></b><p>

		 <%=rs("info_source")%>
		 		<p></p>
	  <img src="http://img.dakayi.cc/pic/<%=rs("info_file")%>" width="640px">
	  <font size="3">
		<%
		  IF RS("IF_HTML") = "否" THEN
		body = replace(rs("info_descn"),chr(10),"&nbsp;&nbsp;&nbsp;&nbsp;")
		body = replace(body,"1.5em","2.0em")
		body = replace(body,";'>",";'> <font size='+16'>")
		body = replace(body,"</p>","</p></font>")
	  ELSE
		body = RS("INFO_DESCn")
	  END IF
		%>
       <%=body%>
		 
		 </font>
		 <hr>
		 <p></p>
		 <font size="3">

<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>	 </font></span></p></font>
<img src="wxgg.jpg" width="100%">
<p></p>
<font size="3">
<hr>
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>	 Android客户端下载：</font></span></p></font>
<img src="http://wap.dakayi.cc/images/a1.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>特别提示：由于Android版微信在屏幕中出现多个二维码时总是识别当前屏幕中最后一个二维码，因此Android微信用户在长按识别二维码时，请确保【所需要识别的二维码完整显示并处于当前屏幕的最下方】。iOS用户不受影响，只需长按所需识别二维码即可。</font></span></p></font>
<hr>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>iOS客户端下载：</font></span></p></font>
<img src="http://wap.dakayi.cc/images/a2.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>特别提示：由于Android版微信在屏幕中出现多个二维码时总是识别当前屏幕中最后一个二维码，因此Android微信用户在长按识别二维码时，请确保【所需要识别的二维码完整显示并处于当前屏幕的最下方】。iOS用户不受影响，只需长按所需识别二维码即可。</font></span></p></font>
<hr>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>
关注微信公众号：</font></span></p></font>
<img src="http://wap.dakayi.cc/images/a4.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>特别提示：由于Android版微信在屏幕中出现多个二维码时总是识别当前屏幕中最后一个二维码，因此Android微信用户在长按识别二维码时，请确保【所需要识别的二维码完整显示并处于当前屏幕的最下方】。iOS用户不受影响，只需长按所需识别二维码即可。</font></span></p></font>
<hr>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>
关注新浪微博：</font></span></p></font>
<img src="http://wap.dakayi.cc/images/a3.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>	<font size='+16'>特别提示：由于Android版微信在屏幕中出现多个二维码时总是识别当前屏幕中最后一个二维码，因此Android微信用户在长按识别二维码时，请确保【所需要识别的二维码完整显示并处于当前屏幕的最下方】。iOS用户不受影响，只需长按所需识别二维码即可。</font></span></p></font>
<hr>

<img src="http://wap.dakayi.cc/images/about.png" width="100%">




      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">视频URL：</td>
      <td width="79%" class="main"> 
       <%=rs("sp_url")%>
     
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
       <%=rs("info_find")%>
     
       
      </td>
    </tr>
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料来源：</td>
      <td width="79%" class="main"> 
        <%=rs("info_source")%>
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">手机图片：</td>
      <td width="79%" class="main"> 
		 <%=rs("info_file")%><font color=red>制作小的图片100X100的，可以为空</font>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否备忘：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_bw" value="是" <%=check_op("是",rs("if_bw"))%>>
        是 
        <input type="radio" name="if_bw" value="否" <%=check_op("否",rs("if_bw"))%>>
        否 </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否推荐：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_tj" value="是" <%=check_op("是",rs("if_tj"))%>>
        是 
        <input type="radio" name="if_tj" value="否" <%=check_op("否",rs("if_tj"))%>>
        否 </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">相关栏目：</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>"  <%=IF_OPA(s_class_corre,RS1("CLASS_NO"))%>><%=RS1("Class_NAME")%>
				<%
				RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		 
		 
		 
       </td>
		 </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">所属专题：</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_ZHUANTI ORDER BY NUM"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="zhuanti" value="<%=RS1("zt_name")%>"  <%=IF_OPA(rs("zhuanti"),RS1("zt_name"))%>><%=RS1("ZT_NAME")%>
				<%
				RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		 
		 
		 
       </td>
		 </tr>
		  <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">推广地址：</td>
      <td width="68%" class="main"> 
     http://www.dakayi.cc/article/X<%=REQUEST("INFO_NO")%>.html
        
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
	 <td width="32%" class="main">现在推广:</td>
      <td width="68%" class="main"> 
     <a href="http://zhanzhang.baidu.com/linksubmit/url" target='_blank'>打开百度推广</a> （复制上面的网址进行提交）
        
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
         <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
