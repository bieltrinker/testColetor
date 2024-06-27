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
<cfif isDefined("url.ID") OR isDefined("url.USERNAME")>

<cfif not isDefined("url.LIMITE")>

<cfset limite = 20>

<cfelse>
<cfset limite = 20>
</cfif>

<cfquery name="buscaItens" datasource="#dtsource#" maxrows="#limite#">

select  ID, USUARIO, NOME, SENHA, NIVEL, STATUS, DATA_STS, ACESSOS from intcoldfusion.usuarios_pokayoke
where ID like '%#url.id#%'
and USUARIO like '%#url.username#%'
--and NIVEL in ('11','12')
order by DATA_STS desc

</cfquery>
<cfelse>

<cfset url.limite=20>

<!-- Busca os itens cadastrados na central do poka-yoke -->
<cfquery name="buscaItens" datasource="#dtsource#" maxrows="#limite#">

select  ID, USUARIO, NOME, SENHA, NIVEL, STATUS, DATA_STS, ACESSOS from intcoldfusion.usuarios_pokayoke
order by DATA_STS desc

</cfquery>

</cfif>

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