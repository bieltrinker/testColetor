<cfif isdefined("FORM.local")>

	<cfset url.local_para=FORM.local>

</cfif>

<cfif url.local_para EQ "">
  <script>
      alert("Erro! Modelo não bipado!")
      self.location="index.cfm";
  </script>
<cfelseif len(url.local_para) LE 5>
<script>
      alert("Erro! Código não é um barcode ou é inválido!")
      self.location="index.cfm";
  </script>
<cfelse>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<link href="leitura.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="document.formleitura.leitura.focus()">
<table width="270" border="0" align="center" cellpadding="1" bgcolor="#CCCCCC">
  <tr>
    <cfoutput><td colspan="2" align="center" valign="middle">LEITURA MOTOR: #cookie.volan#</td>
    
  </tr>
  <tr>

    <td colspan="2" align="center" valign="middle">LEITURA VEÍCULO: #url.local_para#</td>
	

  </tr>
</table></cfoutput>
<form action="validacao.cfm?tipo=box&amp;local_de=<cfoutput>&amp;#URL.local_de#&amp;local_para=#url.local_para#</cfoutput>" method="post" name="formleitura" target="_self" id="formleitura">
<cfinclude template="leitura.cfm">  
</form>
</body>




</html>