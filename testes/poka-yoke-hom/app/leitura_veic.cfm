<cfif isDefined("url.confirm")>

  <html>
    <head>
      <title>Poka-Yoke</title>
      <link rel="stylesheet" href="leitura.css">
    </head>
  <body onLoad="document.entrar.cod_veiculo.focus()">
    <cfset cookie.cod_item = url.cod_item>
  
  <!--- Caso a peça for bipada, execute o código abaixo --->
    <table width="270" border="0" align="center" cellpadding="1" bgcolor="#AAAAAA">
      <tr>
        <td align="center" id="titulo_formulario">
          Leia o Veículo
        </td>
      </tr>
      <tr>
        <td align="center"></td>
      </tr>
      <tr>
        <td align="center">
          <form id="entrar" name="entrar" method="POST" action="valida.cfm?item=<cfoutput>#cookie.item#</cfoutput>">
            <input id="entrar" name="cod_veiculo" type="text" id="entrar" maxlength="50"  onchange="document.getElementById('entrar').submit()"/>
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
  
  <cfelse>

  <cfif url.item contains "AGREGADO-TR">
    <cfset form.cod_item = mid("#form.cod_item#", "1", "9")>
  </cfif>

  <cfquery name="valida" datasource="SINCPROD">
  
      SELECT trim(produto_veiculo) as produto_veiculo, modelo as modelo, cod_item, cod_item_2, pecaxpeca FROM INTCOLDFUSION.central_pokayoke 
      where status = '1'
      --and item like '%#url.item#%'
      and cod_item like '%#form.cod_item#%'
  
  </cfquery>
  
  <cfset item2 = valida.cod_item_2>
  
  <cfif valida.pecaxpeca eq 1>
  
    <script>
    //alert("Item com validação Peca X Peca Identificado, deseja continuar?")
    window.location.href="leitura_prod2.cfm?ITEM=<cfoutput>#url.item#</cfoutput>&cod_item=<cfoutput>#form.cod_item#</cfoutput>&cod_item_2=<cfoutput>#item2#</cfoutput>";
    </script>
  
  <cfelse>
  
  <html>
    <head>
      <title>Poka-Yoke</title>
      <link rel="stylesheet" href="leitura.css">
    </head>
  <body onLoad="document.entrar.cod_veiculo.focus()">
    <cfset cookie.cod_item = form.cod_item>
  
  <!--- Caso a peça for bipada, execute o código abaixo --->
    <table width="270" border="0" align="center" cellpadding="1" bgcolor="#AAAAAA">
      <tr>
        <td align="center" id="titulo_formulario">
          Leia o Veículo
        </td>
      </tr>
      <tr>
        <td align="center"></td>
      </tr>
      <tr><cfoutput>
        <td align="center">
          <form id="entrar" name="entrar" method="POST" action="<cfif url.item contains "MOTOR">leitura_seq.cfm?item=#cookie.item#
                                                                                       <cfelse>valida.cfm?item=#cookie.item#</cfif>">
            <input id="entrar" name="cod_veiculo" type="text" id="entrar" maxlength="50"  onchange="document.getElementById('entrar').submit()"/>
          </form>
      </td>
      </tr></cfoutput>
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
  </cfif>
  </cfif>