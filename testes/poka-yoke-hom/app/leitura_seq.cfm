<html>
  <head>
    <title>Poka-Yoke</title>
    <link rel="stylesheet" href="leitura.css">
  </head>

<body onLoad="document.entrar.seq_grupo.focus()">
  <cfset cookie.item = url.item>

  <!--- Caso o veíclo for bipado, execute o código abaixo --->
  <table width="270" border="0" align="center" cellpadding="1" bgcolor="#AAAAAA">
    <tr>
      <td align="center" id="titulo_formulario">
        Leia a Posição
      </td>
    </tr>
    <tr>
      <td align="center"></td>
    </tr>
    <tr>
      <td align="center">
        <form id="entrar" name="entrar" method="POST" action="valida.cfm?item=<cfoutput>#cookie.item#&cod_veiculo=#form.cod_veiculo#</cfoutput>">
          <input id="entrar" name="seq_grupo" type="text" id="entrar" maxlength="50"  onchange="document.getElementById('entrar').submit()"/>
        </form>
    </td>
    </tr>
    <tr>
    <td align="center" ><input  name="Submit" type="submit" id="Submit"  value="OK" />
      </tr>
    <tr>
      <td align="left"><a href="index.cfm" target="_self"></a></td>
    </tr>
  </table>

  <!--Botão de retorno fora do formulário-->
    <form id="form" name="form" method="post" action="index.cfm">
      <input type="submit" name="primeira" id="voltar" value="Voltar"/>
    </form>

</body>
</html>