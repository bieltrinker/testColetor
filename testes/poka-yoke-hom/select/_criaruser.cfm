<!-- Banco de dados -->

<cfinvoke  method="inicializando" component="cf.ini.index">

<cffunction
name="coldfusionconfig"
access="public">
</cffunction>

<cfset dtsource="SINCPROD">
<cfset date=Dateformat(now(),'yyyy-mm-dd')>
<cfset status = 1>
<cfset nivel = 1>

<!-- Verifica se precisa atualizar algum item do poka-yoke -->

<cfif isDefined("url.ATUALIZA")>
<cfif url.ATUALIZA EQ "SIM">
<cfquery name="buscarItensExistentes" datasource="#dtsource#">

insert into intcoldfusion.usuarios_pokayoke
(ID, USUARIO, NOME, SENHA, NIVEL, STATUS, DATA_STS, ACESSOS)
values 
   ('#url.id#',
   '#url.username#',
   '#url.nome#',
   '#url.password#',
   '#NIVEL#',
   '#url.status#',
   sysdate,
   '#url.NIVEL##url.NIVEL2#'
   )

</cfquery>

<script>

alert("Usuário criado com SUCESSO!");
self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/user.cfm";

</script>

<meta http-equiv="refresh" content="5; url=<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/user.cfm">

<cfelse>
<cfset url.ATUALIZA = "NAO">
</cfif>

<cfelse>

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