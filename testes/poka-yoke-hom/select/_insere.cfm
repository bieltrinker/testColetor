<cfparam name="form.fileUpload" default="">

<cfif len(trim(form.fileUpload))>
  <cffile action="upload"
     fileField="fileUpload"
     destination="#raizPASTA#\cf\auth\poka-yoke\arquivosExcel"
     result="import" nameconflict="makeunique">

<cfset arquivo = import.serverfile>

<!--- Ler qual o arquivo Excel com formato xlsx, e importa-lo para query. --->
<cfspreadsheet action="read" src="#ExpandPath( 'arquivosExcel\#arquivo#' )#" query="importdata" headerrow="1" />
 
<!--- Cria uma variável para guardar os imports que deram erros --->
<cfset failedimports = ""/>
 
<!--- Loop que inicia a parti da linha 2 para não pegar o nome da coluna --->
<cfloop query="importdata" startrow="2">

<!--- Valida se já existe a informação no banco, se sim, apenas atualiza ela. --->
<cfif isDefined("importdata.id")>

  <cfquery name="valida" datasource="SINCPROD">

    select id from intcoldfusion.central_pokayoke
    where id like '%#importdata.id#%'
    
  </cfquery>

  <cfif importdata.id EQ valida.id>
  
   <cfquery datasource="SINCPROD" name="atualiza">
     update intcoldfusion.central_pokayoke set 
     ITEM = '#importdata.ITEM#',
     PRODUTO_VEICULO = '#importdata.PRODUTO_VEICULO#',
     MODELO = '#importdata.MODELO#',
     STATUS = '#importdata.STATUS#',
     COD_ITEM = '#importdata.COD_ITEM#',
     USUARIO_ALT = '#cookie.user#',
     DATA_ALT = sysdate
     where id like '%#importdata.id#%'
   </cfquery> 
</cfif>
   <cfelse>

    <cftry>
      <!--- Insira o produto no banco de dados usando substituir para garantir que os produtos existentes com o mesmo código (que devem ser uma chave exclusiva) não são duplicados --->
      <cfquery datasource="SINCPROD" result="foobar">
        insert into intcoldfusion.central_pokayoke values 
        (
            SEQ_CENTRAL_POKAYOKE.nextval,
            '#importdata.ITEM#', 
            '#importdata.PRODUTO_VEICULO#', 
            '#importdata.MODELO#', 
            sysdate, 
            null, 
            'IMPORTADO_POR_EXCEL', 
            null, 
            <cfif form.STATUS EQ "0">#importdata.STATUS#<cfelse>#form.STATUS#</cfif>, 
            '#importdata.COD_ITEM#'
        ) 
      </cfquery> 
 
      <cfcatch type="any">
        <!--- Pegue quaisquer produtos que não pudessem ser importados e adicione -os à nossa lista de importações com falha --->
        <cfset failedimports = ListAppend( failedimports, cod_item) />
      </cfcatch>
    </cftry>
    </cfif>
</cfloop>

 
<cfoutput>
  <!--- exibir os produtos que não puderam ser importados --->
  <h1>Erros de importação</h1>
 
  <cfif ListLen( failedimports )>
    <p>Tivemos um total de #ListLen( failedimports )# Itens que não tiveram sucesso no import.</p>
 
    <cfloop list="#failedimports#" index="index">
      #index#<br />
    </cfloop>
  <cfelse>
   <script>
      alert("Itens atualizados/importados com sucesso para a CENTRAL!");
      self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/index.cfm";
   </script>
  </cfif>
</cfoutput>

</cfif>