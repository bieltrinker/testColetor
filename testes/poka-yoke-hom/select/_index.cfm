<!-- Banco de dados -->

<cfinvoke  method="inicializando" component="cf.ini.index">

<cffunction
name="coldfusionconfig"
access="public">
</cffunction>

<cfif isDefined("cookie.USER")>

<cfelse>

<script>

alert('Você precisa estar logado para continuar')
window.location = 'validar.cfm';
</script>

</cfif>

<cfset dtsource="SINCPROD">
<cfset date=Dateformat(now(),'yyyy-mm-dd')>

<!-- Valida filtro de busca -->
<cfif isDefined("url.STATUS") OR isDefined("url.ITEM") OR isDefined("url.COD_ITEM")>

<cfquery name="buscaItens" datasource="#dtsource#">

select *
from intcoldfusion.central_pokayoke
where item like '%#url.ITEM#%'
and COD_ITEM like '%#url.COD_ITEM#%'
and STATUS like '%#url.STATUS#%'
and STATUS_LOCK like '%#url.STATUS_LOCK#%'
order by item

</cfquery>
<cfelse>

<!-- Busca os itens cadastrados na central do poka-yoke -->
<cfquery name="buscaItens" datasource="#dtsource#">

select *
from intcoldfusion.central_pokayoke

</cfquery>

</cfif>

<!-- Trás itens existentes no poka-yoke -->
<cfquery name="itensExistentes" datasource="#dtsource#">

select item
from intcoldfusion.central_pokayoke
group by item

</cfquery>

<!--- Cria seu banco de informações inicialmente de forma vazia. --->
<cfset dados_usuario = []>

<cfquery name="consultaDados" datasource="#dtsource#">

select *
from intcoldfusion.usuarios_pokayoke
where UPPER(usuario) = UPPER('#cookie.USER#')

</cfquery>

<!--- Preenche array de itens com as informações do usuário --->
<cfset arrayAppend(dados_usuario, consultaDados)>

      <cfset usuario = {
        "id": consultaDados.id,
        "usuario": consultaDados.usuario,
        "acessos": consultaDados.acessos}>

      
