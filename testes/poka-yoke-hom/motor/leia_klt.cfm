<cftry>
<cfif mid(form.local, 5, 3) EQ "6VL">
<cfset cookie.volan = mid(form.local, 5, 3)>
<cfelseif mid(form.local, 5, 3) EQ "130">
  <script>
      alert("Erro! Código não é de um motor")
      self.location="index.cfm";
  </script>
<cfelse>
<cfset cookie.volan = form.local>
<cfset volante=cookie.volan>

<cfquery name="mod" datasource="MES">
  with consulta as (select (case 
    when pro.name like '%TL PE%' then '20100T92Z1'
    when pro.name like '%TIGGO 8 FL ADAS%' and pro.code like '%886%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8 FL ADAS%' and pro.code like '%886%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8 1.6%' and pro.code like '%858%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8 1.6%' and pro.code like '%858%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 7 PRO%' and pro.code like '%554%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 5X PRO ICE HIGH%' and pro.code like '%755%' then 'E4T15C-0000E04AA'
    when pro.name like '%TIGGO 5X PRO ICE LOW%' then 'E4T15C-0000E04AA'
    when pro.name like '%TIGGO 5X PRO%' and pro.code like '%754%' then 'E4T15C-0000E04AA'
    when pro.secondname like '%MTR%' then 'F4J16-0000E04AA'
    when pro.name like '%TIGGO 5X PRO 48V%' and (pro.code like '%764%' or pro.code like '%775%') then 'E4T15C-0000E07AA'
	  when pro.name like '%TIGGO 7 PRO%' and (pro.code like '%555%' or pro.code like '%556%') then 'F4J16-0000E02AA'
	  when pro.name like '%TIGGO 7 PRO 48V%' and pro.code like '%566%' then 'E4T15C0000E07AA'
    when pro.name like '%LM%' then 'VZ76'
    when pro.name like '%TIGGO 7 PRO ADAS%' and (pro.code like '%586%' or pro.code like '%587%') then 'F4J16-0000E02AA/F4J16-0000E04AA'
	  when pro.name like '%TIGGO 7%' and pro.code like '%553%' then 'E4T15-B0000E05AA'
    when pro.name like '%TIGGO 7%' and pro.code like '%503%' then 'E4T15-B0000E05AA'
    when pro.name like '%TIGGO 5%' and pro.code like '%703%' then 'E4T15-B0000E05AA'
    when pro.name like '%TIGGO 5%' and pro.code like '%753%' then 'E4T15-B0000E05AA'
    else '6VL' end) cod, pro.idproduct, pro.name, lot.code as code, pro.secondname
    from pcf4..tbllot lot 
    inner join pcf4..tblproduct pro 
    on lot.IDProduct = pro.IDProduct) 
select top 1 SUBSTRING(name,CHARINDEX('TIGGO',name),17) name, secondname
from consulta where cod like '%#volante#%' and name like '%CONJUNTO%' order by idproduct desc
</cfquery>
<!------------------------->

<cfset cookie.volan = form.local>
</cfif>
<center><cfoutput>MOTOR DO: <cfif isDefined("mod.name")><cfif mod.name contains "TIGGO 7 TXS">COMUM:(T15-T17)<cfelseif mod.name contains "TIGGO 5X PRO 48V">COMUM:(T19 48V-T1E 48V)<cfelseif mod.name contains "ICE">COMUM:(ICE LOW-ICE HIGH)<cfelseif mod.name contains "TIGGO 8">COMUM:(T1A-T1A ADAS-T1E)<cfelseif mod.secondname contains "MTR">(T1E-MTR)<cfelse>(#mod.name#)</cfif></cfif> </cfoutput></center>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>LEITURA ETIQUETA</title>
<link href="local.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="document.formlocal.local.focus()">
<table width="270" border="0" align="center" cellpadding="1" bgcolor="#CCCCCC">
  <tr>
    <td colspan="2" align="center" valign="middle"><H2>LEITURA DO VEÍCULO</H2></td>
  </tr>
</table>

<cfif URL.tipo EQ "box">
<form action="leitura_box.cfm?tipo=box&amp;local_de=<cfoutput>#cookie.volan#</cfoutput>" method="post" name="formlocal"  id="formlocal">
</cfif>
<cfinclude template="local.cfm">  
</form>
<cfcatch type="any">

  <script>
  alert("Conexão de internet instável, refazer o processo")
  self.location="index.cfm";
  </script>

</cfcatch>
</cftry>