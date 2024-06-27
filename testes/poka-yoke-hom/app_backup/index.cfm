<html>
  <head>
    <title>Poka-Yoke</title>
    <link rel="stylesheet" href="leitura.css">
  </head>
</html>

<!-- Valida cookies -->
<cfif isDefined("url.item")>
<cfset cookie.item = url.item>
</cfif>

<cfif isDefined("url.cod_item")>
<cfset cookie.cod_item = url.cod_item>
</cfif>

<cfif isDefined("url.cod_veiculo")>
<cfset cookie.cod_veiculo = url.cod_veiculo>
</cfif>

<!-- Validações e trativas para a rotina poka-yoke -->
<!-- Valida se o usuário existe em nosso sistema -->
<cfif isDefined("url.usuario")>
<cfquery name="buscaUsuario" datasource="SINCPROD">
	  SELECT id as cracha, senha, usuario FROM intcoldfusion.usuarios_pokayoke
    where senha = Upper('#url.usuario#')
    and senha = Upper('#url.usuario#')
    and status = '1'
</cfquery>

<cfif buscaUsuario.recordcount gt 0>

  <cfset cookie.user = "#buscaUsuario.usuario#">

<cfelse>

  <cfcookie  name="user" expires="now">
  <script>
    alert("Erro! Usuário não encontrado em nosso sistema ou está bloqueado")
    window.location.href="index.cfm";
  </script>

</cfif>

<cfelse>
</cfif>
<!-- Valida se o usuário quer deslogar -->
<cfif isdefined("url.logoff")>
 
  <cfcookie name="user" expires="now">
  <script>
    alert("Você precisa logar para continuar")
    window.location.href="index.cfm";
  </script>
  <cfelse>
  
</cfif>

<cfif isdefined("cookie.user")>
<!---Busca Configurações--->
<cfquery name="buscaconfiguracoes" datasource="SINCPROD">
	SELECT INSTR(item, ' ')-1 QTDCaracteres, case when INSTR(item, ' ')-1 > 1 then substr(item, 1, INSTR(item, ' ')-1) else item end as item, item as item2 FROM INTCOLDFUSION.central_pokayoke 
  where status = '1'
  group by item
</cfquery>

<!-- Melhora busca de botões para o usuário -->



<!-- Verifica item escolhido pelo usuário -->
<!-- Gera visualmente a página pós configurações do usuário -->

<cfif not isDefined("url.item")>
<!--- Caso o item for escolhido, execute o código abaixo --->

<!DOCTYPE HTML>
<!---Montar página--->
<html>
	<head>
    <link rel="stylesheet" type="text/css" href="global.css">
    <script src="templates/jquery.js"></script>
    <title>CAOA - PokaYoke</title>
  </head>
<body>
  <table width="270" border="0" cellspacing="1">
    <tr>
      <td align="center" id="titulo_formulario">
        <strong style="color: green; text-decoration: bold;"><cfoutput>#cookie.user#</cfoutput></strong>
      </td>
    </tr>
    <tr>
      <td align="center" id="titulo_formulario">
        
      </td>
    </tr>
    <tr>
      <td align="center" id="titulo_formulario">
        ESCOLHA O ITEM
      </td>
    </tr>
  <cfloop query="buscaconfiguracoes">
		<tr>
			<td align="center">
				<form id="entrar" name="entrar" method="GET" action="leitura_prod.cfm">
				  <input style="font-size: 12;" type="submit" name="item" id="entrar" value="<cfoutput>#buscaconfiguracoes.item#</cfoutput>"/>
			  </form>
		  </td>
		</tr>
  </cfloop>
  </table>
</body>
</html>

<!--Botão para deslogar da aplicação-->
	<form id="form" name="form" method="GET" action="index.cfm?logoff=sim">
		<input type="submit" name="logoff" id="voltar" value="Sair"/>
	</form>

<cfelse>

ERRO! Não encontrado o caminho correto. Por favor, entre em contato com o administrador do sistema.

</cfif>

<cfelse>
<!--- Usuário não estiver logado, execute o código abaixo --->

<!---Modo coletor--->
<html>
  <head>
    <title>Menu do sistema</title>
  </head>
<body onLoad="document.form.local.focus()">
  <form id="form" name="form" method="GET" action="index.cfm">
    <table width="270" border="0" cellspacing="1">
      <tr>
        <td colspan="2" align="center" id="titulo_formulario">
          <strong>SISTEMA DO COLETOR</strong>
        </td>
      </tr>
      <tr>
        <td width="81">&nbsp;
        </td>
        <td width="182">&nbsp;
        </td>
      </tr>
      <tr>
        <td>
          <strong>USUÁRIO</strong>
        </td>
        <td>
          <label for="cracha">
          </label>
            <input type="text" name="usuario" id="cracha" id="local" />
        </td>
      </tr>
      <tr>
        <td>&nbsp;
        </td>
        <td>
          <input type="submit" name="entrar" id="entrar" value="Entrar"/>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;
        </td>
      </tr>
      <tr>
        <td colspan="2" id="textsegundacontagem" align="center">
        </td>
      </tr>
    </table>
  </body>
</html>
</form>

<script>
			$("p").focusout(function() {
				if (!$("#local").val()) {
					document.all.local.focus();
					<!---alert("E necessario realizar a leitura do codigo de  barras.");--->
				}
			});
		</script>

</body>

</cfif>