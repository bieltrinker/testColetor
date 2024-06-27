<!-- Banco de dados -->

<cfinvoke  method="inicializando" component="cf.ini.index">

<cffunction
name="coldfusionconfig"
access="public">
</cffunction>

<cfset dtsource="SINCPROD">

<!-- Verifica se é algum cadastro -->
<cfif isDefined("url.status")>

<cfquery name="buscaSEQ" datasource="#dtsource#">

select max(id)+1 AS ID from intcoldfusion.central_pokayoke

</cfquery>

<cfquery name="buscarItensExistentes" datasource="#dtsource#">

insert into intcoldfusion.central_pokayoke 
(ID, ITEM, PRODUTO_VEICULO, MODELO, DATA_ADD, DATA_ALT, USUARIO_ADD, USUARIO_ALT, STATUS, COD_ITEM, STATUS_LOCK, PECAXPECA, COD_ITEM_2) 
values

(
  #buscaSEQ.ID#, 
  '#url.ITEM#',
  '#url.COD_VEICULO#',
  '#url.MODELO#', 
  sysdate, 
  null, 
  '#cookie.user#', 
  null, 
  '#url.STATUS#', 
  '#url.COD_ITEM#',
  '#url.STATUS_LOCK#',
  '#url.PECAXPECA#',
  '#url.COD_ITEM_2#'
)

</cfquery>

<script>

alert("Produto cadastrado com SUCESSO!");
self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke2/cadastrar.cfm";

</script>

<cfelse>

</cfif>