<cfif isDefined("url.item")>
  <!--- Caso o critério de informações estiverem preenchidas, execute o código abaixo --->
  <cfif cookie.cod_item contains "3P">
  <cfif findnocase("3P", cookie.cod_item) EQ "11">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 13, 10)> 
  <cfelseif findnocase("3P", cookie.cod_item) EQ "12">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 12, 10)> 
  <cfelseif findnocase("3P", cookie.cod_item) EQ "13">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 13, 10)> 
  <cfelseif findnocase("3P", cookie.cod_item) EQ "14">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 16, 10)> 
  <cfelseif findnocase("3P", cookie.cod_item) EQ "15">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 17, 10)> 
  <cfelseif findnocase("AJP", cookie.cod_item) EQ "8">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 8)> 
  <cfelseif findnocase("AJN", cookie.cod_item) EQ "8">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 8)> 
  <cfelse>
  <cfset cookie.cod_item = cookie.cod_item>
  </cfif> 
  <cfelseif cookie.cod_item contains "$11">
  <cfset cookie.cod_item = mid(cookie.cod_item, 4, 11)>
  <cfelseif cookie.cod_item contains "NHK">
  <cfset cookie.cod_item = mid(cookie.cod_item, 1, 11)>
  <cfelse>
  <cfset cookie.cod_item = cookie.cod_item>
  </cfif>
  
  <cfif cookie.cod_item contains "AJ">

  <cfif findnocase("AJ", cookie.cod_item) EQ "7">
  <cfset cookie.cod_item = mid(cookie.cod_item, 1, 9)> 
  <cfelseif findnocase("AJ", cookie.cod_item) EQ "8">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 8)>
<cfelseif findnocase("AJ", cookie.cod_item) EQ "10">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 10)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "9">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 9)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "13">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 13)>
<cfelseif findnocase("AJ", cookie.cod_item) EQ "14">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 14)>
<cfelseif findnocase("AJ", cookie.cod_item) EQ "15">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 15)>
<cfelseif findnocase("AJ", cookie.cod_item) EQ "16">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 16)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "17">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 17)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "18">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 18)>
<cfelseif findnocase("AJ", cookie.cod_item) EQ "19">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 19)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "20">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 20)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "6">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 6)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "5">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 5)> 
<cfelseif findnocase("AJ", cookie.cod_item) EQ "4">
  S -> <cfset cookie.cod_item = mid(cookie.cod_item, 1, 4)>

  <cfelse>
  <cfset cookie.cod_item = cookie.cod_item>
  </cfif>
  </cfif>

  <!--- Corte para Farol - Provisório --->
  <cfif cookie.cod_item contains "3010160293800230326088">
    <cfset cookie.cod_item = mid(cookie.cod_item,1,22)>
  </cfif>
  
  <cfif cookie.cod_item contains "3010160">
    <cfset cookie.cod_item = mid(cookie.cod_item,1,14)>
  </cfif>

  <cfif cookie.cod_item contains "3010165">
    <cfset cookie.cod_item = mid(cookie.cod_item,1,14)>
  </cfif>

  <cfif cookie.cod_item contains "3010767">
    <cfset cookie.cod_item = mid(cookie.cod_item,1,14)>
  </cfif>

  <cfif cookie.cod_item contains "DMO">
    <cfset cookie.cod_item = mid(cookie.cod_item,4,12)>
  </cfif>

  <!--- Valida o produto de qual código é referente --->
  <cfquery name="buscaItem" datasource="SINCPROD">
    SELECT trim(produto_veiculo) as produto_veiculo, modelo as modelo, cod_item FROM INTCOLDFUSION.central_pokayoke 
    where status = '1'
    and item like '%#url.item#%'
    and cod_item like '%#cookie.cod_item#%'
  </cfquery>
  
  <!--- Busca apenas o COD necessário para uma nova validação --->
  <cfquery name="buscaItem2" datasource="SINCPROD">
    SELECT produto_veiculo FROM INTCOLDFUSION.central_pokayoke 
    where status = '1'
    and item like '%#url.item#%'
    and cod_item like '%#cookie.cod_item#%'
  </cfquery>
  
  <cfset buscaItem2 = buscaItem2.produto_veiculo>
  
  <!--- Busca qual é o código do veículo que foi bipado --->
  <cfquery name="buscaVeiculo" datasource="MES">
    SELECT p.code as COD, substring(p.secondname, 1, 25) as modelo, ( case 
                                    when len(SUBSTRING(p.code, 7, 7)) = '7' then SUBSTRING(p.code, 7, 7)
                                    when len(SUBSTRING(p.code, 7, 6)) = '6' then SUBSTRING(p.code, 7, 6)
                                    when len(SUBSTRING(p.code, 6, 6)) = '5' then SUBSTRING(p.code, 7, 6)
                                    else SUBSTRING(p.code, 6, 6) end ) as CODE_VEIC_MES 
    FROM PCF4..TBLProduct p
    INNER JOIN PCF4..TBLLot l
    ON p.idproduct = l.idproduct
    where l.code like '%#form.cod_veiculo#%'
    and p.code not like '%P%'
    and p.code not like '%M%'
    and p.code not like '%T1A%'
    and p.code not like '%D3W%'
  </cfquery>
  
  <cfquery name="buscaVeiculo2" datasource="MES">
    SELECT p.code as COD, substring(p.secondname, 1, 25) as modelo, ( case 
    when p.code like '%HPC576%' and p.code like '%T1E%' then 'TEC576'
    when len(SUBSTRING(p.code, 7, 7)) = '7' then SUBSTRING(p.code, 7, 6)
                                    when len(SUBSTRING(p.code, 7, 6)) = '6' then SUBSTRING(p.code, 7, 6)
                                    when len(SUBSTRING(p.code, 6, 6)) = '5' then SUBSTRING(p.code, 7, 6)
                                    else SUBSTRING(p.code, 6, 6) end ) as CODE_VEIC_MES
    FROM PCF4..TBLProduct p
    INNER JOIN PCF4..TBLLot l
    ON p.idproduct = l.idproduct
    where l.code like '%#form.cod_veiculo#%'
    and p.code like '%P%'
  </cfquery>
  
  <cfquery name="buscaVeiculo3" datasource="MES">
    SELECT top(1)p.code as COD, substring(p.secondname, 1, 25) as modelo, ( case 
    
                                    when len(SUBSTRING(p.code, 7, 6)) = '6' then SUBSTRING(p.code, 7, 6)
                                    when len(SUBSTRING(p.code, 6, 6)) = '5' then SUBSTRING(p.code, 7, 6)
                                    else SUBSTRING(p.code, 6, 6) end ) as CODE_VEIC_MES 
    FROM PCF4..TBLProduct p
    INNER JOIN PCF4..TBLLot l
    ON p.idproduct = l.idproduct
    where l.code like '%#form.cod_veiculo#%'
    and p.code like '%M%'
  </cfquery>

<cfquery name="buscaVeiculo4" datasource="MES">
  SELECT p.code as COD, substring(p.secondname, 1, 25) as modelo, ( case 
  when p.code like '%HPC576%' and p.code like '%T1E%' then 'TEC576'
    when len(SUBSTRING(p.code, 7, 7)) = '7' then SUBSTRING(p.code, 7, 6)
                                    when len(SUBSTRING(p.code, 7, 6)) = '6' then SUBSTRING(p.code, 7, 6)
                                    when len(SUBSTRING(p.code, 6, 6)) = '5' then SUBSTRING(p.code, 7, 6)
                                    else SUBSTRING(p.code, 6, 6) end ) as CODE_VEIC_MES
  FROM PCF4..TBLProduct p
  INNER JOIN PCF4..TBLLot l
  ON p.idproduct = l.idproduct
  where l.code like '%#form.cod_veiculo#%'
  and p.code like '%T1E%'
</cfquery>
  
  <cfset listaDisp = QuotedValueList(buscaItem.produto_veiculo)>
  <cfset ListaMes = QuotedValueList(buscaVeiculo.CODE_VEIC_MES)>
  <cfset ListaMes2 = QuotedValueList(buscaVeiculo2.CODE_VEIC_MES)>
  <cfset ListaMes3 = QuotedValueList(buscaVeiculo3.CODE_VEIC_MES)>
  <cfset ListaMes4 = QuotedValueList(buscaVeiculo4.CODE_VEIC_MES)>
  
  <cfif ListFind(listaDisp, ListaMes4) GT 0 OR ListFind(listaDisp, ListaMes3) GT 0 OR ListFind(listaDisp, ListaMes2) GT 0 OR ListFind(listaDisp, ListaMes) GT 0> 
  <h2>Todos os critérios</br>foram preenchidos.</h2>
  <h3 style="color: green;">SUCESSO!</h3>
  <cfquery datasource="SINCPROD" name="logs">
    insert into intcoldfusion.logs_pokayoke
    (USUARIO, VALIDACAO, BARCODE, MODELO, STATUS, DATA, TIPO) VALUES
    ('#cookie.user#', 'Central: <cfif len(listaDisp) LE 2> VAZIO <cfelse> #listaDisp# </cfif>| MES: #ListaMes# - #ListaMes2# - #ListaMes3# - #ListaMes4#','#form.cod_veiculo#', '#buscaVeiculo.modelo#', 'OK', sysdate, '#url.item#')
  </cfquery>
  <cfcookie  name="item" expires="now">
  <cfcookie  name="cod_item" expires="now">
  <cfcookie  name="cod_veiculo" expires="now">
  <meta http-equiv="refresh" content="2; URL=leitura_prod.cfm?ITEM=<cfoutput>#url.item#</cfoutput>"/>
  <cfelse>
    <cfquery datasource="SINCPROD" name="logs">
      insert into intcoldfusion.logs_pokayoke
      (USUARIO, VALIDACAO, BARCODE, MODELO, STATUS, DATA, TIPO) VALUES
      ('#cookie.user#', 'Central: <cfif len(listaDisp) LE 2> VAZIO <cfelse> #listaDisp# </cfif>| MES: #ListaMes# - #ListaMes2# - #ListaMes3# - #ListaMes4#','#form.cod_veiculo#', '#buscaVeiculo.modelo#', 'ERRO', sysdate, '#url.item#') 
    </cfquery>
  
  <audio id="beepSound" preload="auto">
    <source src="templates/audio/beep.wav" type="audio/wav">
    Seu navegador não suporta o elemento de áudio.
  </audio>
  
  <script>
// Função para reproduzir o som de beep
    function tocarSomDeBeep() {
        var beepSound = document.getElementById('beepSound');
        beepSound.play();
    }

    // Função para exibir o popup de erro e, em seguida, tocar o som de beep
    function exibirErroComSom() {
        tocarSomDeBeep();
        setTimeout(function() {
            alert("Erro! Modelo inválido com o produto -\n<cfoutput>#cookie.cod_item#</cfoutput>\nModelo: <cfoutput>#buscaVeiculo.modelo# -  #buscaVeiculo.CODE_VEIC_MES# - #buscaVeiculo2.CODE_VEIC_MES# - #buscaVeiculo3.CODE_VEIC_MES# - #buscaVeiculo4.CODE_VEIC_MES#</cfoutput>\nProduto: <cfoutput>#buscaItem.modelo# - #buscaItem.produto_veiculo#</cfoutput> \n<cfoutput>CODES Disponíveis: #listaDisp# - #cookie.cod_item#</cfoutput>")
            window.location.href="leitura_prod.cfm?ITEM=<cfoutput>#url.item#</cfoutput>";
        }, 1000); // Aguarde 1 segundo (1000 milissegundos) antes de exibir o alerta
    }

    // Chame a função para simular um erro (você pode chamar essa função em resposta a eventos específicos)
    exibirErroComSom();
  </script>
  
  </cfif>
  <cfelse>
  
  <script>
  alert("Parece que algo deu errado.")
  window.location.href="leitura_prod.cfm?ITEM=<cfoutput>#url.item#</cfoutput>";
  </script>
  
  
  
  </cfif>