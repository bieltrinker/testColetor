<!-- Banco de dados -->

<cfinvoke  method="inicializando" component="cf.ini.index">

<cffunction
name="coldfusionconfig"
access="public">
</cffunction>

<cfset dtsource="SINCPROD">
<cfset date=Dateformat(now(),'yyyy-mm-dd')>
<cfset item = url.editaritem>
<cfset tipo = url.ITEM>
<cfset codprod = url.PRODUTO_VEICULO>
<cfset coditem = url.COD_ITEM>
<cfset modelo = url.MODELO>
<cfset status = url.STATUS>
<cfset status_lock = url.STATUS_LOCK>
<cfset pecaxpeca = url.pecaxpeca>
<cfset coditem2 = url.cod_Item_2>

<!-- Verifica se precisa atualizar algum item do poka-yoke -->

<cfif isDefined("url.ATUALIZA")>
<cfif url.ATUALIZA EQ "SIM">
<cfquery name="buscarItensExistentes" datasource="#dtsource#">

update intcoldfusion.central_pokayoke 
set 
   ITEM = '#url.ITEM#',
   PRODUTO_VEICULO = '#url.PRODUTO_VEICULO#',
   MODELO = '#url.MODELO#',
   DATA_ALT = sysdate,
   USUARIO_ALT = '#cookie.user#',
   STATUS = '#url.STATUS#',
   COD_ITEM = '#url.COD_ITEM#',
   STATUS_LOCK = '#url.STATUS_LOCK#',
   PECAXPECA = '#url.PECAXPECA#',
   COD_ITEM_2 = '#url.COD_ITEM_2#'
where id = '#url.editaritem#'

</cfquery>

<script>

alert("Produto Alterado com SUCESSO!");
self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/index.cfm";

</script>

<meta http-equiv="refresh" content="5; url=<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/index.cfm">

<cfelse>
<cfset url.ATUALIZA = "NAO">
</cfif>

<cfelse>

</cfif>

<!-- Quando os filtros são preenchidos (recomendado caso saiba qual é o barcode e o sequenciamento) -->

<cfquery name="buscaProdutos" datasource="#dtsource#">

select *
from intcoldfusion.central_pokayoke

</cfquery>