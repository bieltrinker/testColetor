<!DOCTYPE html>
<html>
<head>
    <title>Poka-Yoke</title>
    <link rel="stylesheet" href="leitura.css">
</head>
<body onLoad="document.entrar.cod_item.focus()">
    <!---<cfset cookie.item = url.item>--->

    <!--- Caso o veículo for bipado, execute o código abaixo --->
    <table width="270" border="0" align="center" cellpadding="1" bgcolor="#AAAAAA">
        <tr>
            <td align="center" id="titulo_formulario">
                <!--- <Leia o <cfoutput>#url.item#</cfoutput>--->
            </td>
        </tr>
        <tr>
            <td align="center"></td>
        </tr>
        <tr>
            <td align="center">
                <form id="entrar" name="entrar" method="POST" action="">
                    <input id="entrar" name="cod_teste" type="text" id="entrar" maxlength="50" onchange="document.getElementById('entrar').submit()" />
                </form>
            </td>
        </tr>
        <tr>
            <td align="center"><input name="Submit" type="submit" id="Submit" value="OK" /></td>
        </tr>
        <tr>
            <td align="left"><a href="index.cfm" target="_self"></a></td>
        </tr>
    </table>

    <!--Botão de retorno fora do formulário-->
    <form id="form" name="form" method="post" action="index.cfm">
        <input type="submit" name="primeira" id="voltar" value="Voltar" />
    </form>

    <!-- Áudio de bip -->
    <audio id="bip-som" src="templates/áudio/beep.wav" preload="auto"></audio>

    <!--- Verificar o item --->
    <cfset itens = ["1", "2", "3"]>

    <cfif structKeyExists(form, "cod_teste")>
        <cfset item = trim(form.cod_teste)>
        <cfif arrayContains(itens, item)>
            <p style='color: green; text-align: center;'>Item encontrado!</p>
        <cfelse>
            <p style='color: red; text-align: center;'>Erro: Item não encontrado!</p>
            <script>
                document.getElementById('bip-som').play();
            </script>
        </cfif>
    </cfif>
</body>
</html>