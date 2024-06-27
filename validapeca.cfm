<cfif isDefined("url.item")>
  <!--- Caso o critério de informações estiverem preenchidas, execute o código abaixo --->
  
  <cfif url.cod_item contains "3P">
  <cfif findnocase("3P", url.cod_item) EQ "11">
  S -> <cfset url.cod_item = mid(url.cod_item, 13, 10)> <cfoutput>#mid(url.cod_item, 13, 10)# - #findnocase("3P", url.cod_item)#</cfoutput> 
  <cfelseif findnocase("3P", url.cod_item) EQ "12">
  S -> <cfset url.cod_item = mid(url.cod_item, 12, 10)> <cfoutput>#mid(url.cod_item, 12, 10)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelseif findnocase("3P", url.cod_item) EQ "13">
  S -> <cfset url.cod_item = mid(url.cod_item, 13, 10)> <cfoutput>#mid(url.cod_item, 13, 10)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelseif findnocase("3P", url.cod_item) EQ "14">
  S -> <cfset url.cod_item = mid(url.cod_item, 16, 10)> <cfoutput>#mid(url.cod_item, 16, 10)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelseif findnocase("3P", url.cod_item) EQ "15">
  S -> <cfset url.cod_item = mid(url.cod_item, 17, 10)> <cfoutput>#mid(url.cod_item, 17, 10)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelseif findnocase("AJP", url.cod_item) EQ "8">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 8)> <cfoutput>#mid(url.cod_item, 1, 8)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelseif findnocase("AJN", url.cod_item) EQ "8">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 8)> <cfoutput>#mid(url.cod_item, 1, 8)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelse>
  N -> <cfoutput>#url.cod_item#</cfoutput>
  <cfset url.cod_item = url.cod_item>
  </cfif> 
  <cfelseif url.cod_item contains "$11">
  <cfset url.cod_item = mid(url.cod_item, 4, 11)>
  <cfelseif url.cod_item contains "NHK">
  <cfset url.cod_item = mid(url.cod_item, 1, 11)>
  <cfelse>
  <cfset url.cod_item = url.cod_item>
  </cfif>
  
  <cfif url.cod_item contains "AJ">

  <cfif findnocase("AJ", url.cod_item) EQ "7">
  <cfset url.cod_item = mid(url.cod_item, 1, 9)> <cfoutput>#mid(url.cod_item, 1, 9)# - #findnocase("3P", url.cod_item)#</cfoutput>
  <cfelseif findnocase("AJ", url.cod_item) EQ "8">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 8)> <cfoutput>#mid(url.cod_item, 1, 8)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "10">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 10)> <cfoutput>#mid(url.cod_item, 1, 10)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "9">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 9)> <cfoutput>#mid(url.cod_item, 1, 9)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "13">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 13)> <cfoutput>#mid(url.cod_item, 1, 13)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "14">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 14)> <cfoutput>#mid(url.cod_item, 1, 14)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "15">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 15)> <cfoutput>#mid(url.cod_item, 1, 16)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "16">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 16)> <cfoutput>#mid(url.cod_item, 1, 16)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "17">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 17)> <cfoutput>#mid(url.cod_item, 1, 17)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "18">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 18)> <cfoutput>#mid(url.cod_item, 1, 18)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "19">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 19)> <cfoutput>#mid(url.cod_item, 1, 19)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "20">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 20)> <cfoutput>#mid(url.cod_item, 1, 20)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "6">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 6)> <cfoutput>#mid(url.cod_item, 1, 6)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "5">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 5)> <cfoutput>#mid(url.cod_item, 1, 5)# - #findnocase("3P", url.cod_item)#</cfoutput>
<cfelseif findnocase("AJ", url.cod_item) EQ "4">
  S -> <cfset url.cod_item = mid(url.cod_item, 1, 4)> <cfoutput>#mid(url.cod_item, 1, 4)# - #findnocase("3P", url.cod_item)#</cfoutput>

  <cfelse>
  N -> <cfoutput>#url.cod_item#</cfoutput>
  <cfset url.cod_item = url.cod_item>
  </cfif>
  </cfif>

  <!--- Corte para Farol - Provisório --->
  <cfif url.cod_item contains "3010160293800230326088">
    <cfset url.cod_item = mid(url.cod_item,1,22)>
  </cfif>
  
  <cfif url.cod_item contains "3010160">
    <cfset url.cod_item = mid(url.cod_item,1,14)>
  </cfif>

  <cfif url.cod_item contains "3010165">
    <cfset url.cod_item = mid(url.cod_item,1,14)>
  </cfif>

  <cfif url.cod_item contains "3010767">
    <cfset url.cod_item = mid(url.cod_item,1,14)>
  </cfif>

  <!--- Valida o produto de qual código é referente --->
  <cfquery name="buscaItem" datasource="SINCPROD">
    SELECT trim(produto_veiculo) as produto_veiculo, modelo as modelo, cod_item, cod_item_2, pecaxpeca FROM INTCOLDFUSION.central_pokayoke 
    where status = '1'
    and item like '%#url.item#%'
    and cod_item like '%#url.cod_item#%'
  </cfquery>
  
  <!--- Busca apenas o COD necessário para uma nova validação --->
  <cfquery name="buscaItem2" datasource="SINCPROD">
    SELECT produto_veiculo FROM INTCOLDFUSION.central_pokayoke 
    where status = '1'
    --and item like '%#url.item#%'
    and cod_item like '%#url.cod_item#%'
  </cfquery>
  
  <cfset buscaItem2 = buscaItem2.produto_veiculo>
  
  <cfif buscaItem.PECAXPECA EQ 1>
  
  <!--- Valida o produto de qual código é referente do PECAXPECA --->
  <cfquery name="buscaItemPECAXPECA" datasource="SINCPROD">
    SELECT trim(produto_veiculo) as produto_veiculo, modelo as modelo, cod_item, cod_item_2, pecaxpeca FROM INTCOLDFUSION.central_pokayoke 
    where status = '1'
    --and item like '%#url.item#%'
    and cod_item like '%#url.cod_item_2#%'
  </cfquery>
  
  <cfif mid(form.COD_ITEM,1,2) eq "10">
    <cfset form.COD_ITEM = mid(form.COD_ITEM, 4,11)>
  </cfif>

  <cfif buscaItem.COD_ITEM_2 EQ form.COD_ITEM>

  <script>
  //alert("Validado com SUCESSO! Agora valide o veículo")
  window.location.href="leitura_veic.cfm?ITEM=<cfoutput>#url.item#</cfoutput>&cod_item=<cfoutput>#url.cod_item#</cfoutput>&confirm=1";
  </script>

  <cfelse>

  <script>
  alert("Erro! Peca não validada com a outra peca 1-<cfoutput>#buscaItem.COD_ITEM_2# - #buscaItemPECAXPECA.COD_ITEM#</cfoutput>")
  window.location.href="leitura_prod.cfm?ITEM=<cfoutput>#url.item#</cfoutput>";
  </script>

  </cfif>
  
  </cfif>
  
  </cfif>