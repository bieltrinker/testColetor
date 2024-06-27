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
<cfif isDefined("url.STATUS") OR isDefined("url.ITEM") OR isDefined("url.COD_ITEM") OR isDefined("url.LIMITE") OR isDefined("url.BARCODE")>

<cfif len(url.LIMITE) LE 1 or not isDefined("url.LIMITE")>

<cfset limite = 50>

<cfelse>
<cfset limite = url.LIMITE>
</cfif>

<cfquery name="buscaItens" datasource="#dtsource#" maxrows="#limite#">

select usuario, tipo, validacao, status, DATA, barcode, replace(replace(replace(replace(replace(replace(modelo, 'CARROCERIA PINTADA',''), 'CONJUNTO TRIM', ''), 'CONJUNTO', ''), 'CARROCERIA SOLDADA', ''), 'NOVO MOTOR TRIM', ''), 'MAX DRIVE 1.6 TGDI', '') as MODELO
from intcoldfusion.logs_pokayoke
where tipo like '%#url.ITEM#%'
and validacao like '%#url.COD_ITEM#%'
and STATUS like '%#url.STATUS#%'
and barcode like '%#url.BARCODE#%'
order by data desc

</cfquery>
<cfelse>

<cfset url.limite=50>

<!-- Busca os itens cadastrados na central do poka-yoke -->
<cfquery name="buscaItens" datasource="#dtsource#" maxrows="#limite#">

select usuario, tipo, validacao, status,  DATA, barcode, replace(replace(replace(replace(replace(replace(modelo, 'CARROCERIA PINTADA',''), 'CONJUNTO TRIM', ''), 'CONJUNTO', ''), 'CARROCERIA SOLDADA', ''), 'NOVO MOTOR TRIM', ''), 'MAX DRIVE 1.6 TGDI', '') as MODELO
from intcoldfusion.logs_pokayoke
order by data desc

</cfquery>

</cfif>

<!-- Trás itens existentes no poka-yoke -->
<cfquery name="itensExistentes" datasource="#dtsource#">

select tipo
from intcoldfusion.logs_pokayoke
where tipo <> 'F'
and tipo <> ' '
group by tipo

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