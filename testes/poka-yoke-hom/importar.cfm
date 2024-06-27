<cfif isDefined("url.STATUS")>

<cfparam name="url.fileUpload" default="">

<cfif len(trim(url.fileUpload))>
  <cffile action="upload"
     fileField="fileUpload"
     destination="#raizPasta#\cf\auth\poka-yoke\importar"
     result="import" nameconflict="makeunique">

<cfset arquivo = import.serverfile>

<!--- Ler qual o arquivo Excel com formato xlsx, e importa-lo para query. --->
<cfspreadsheet action="read" src="#ExpandPath( 'importar\#arquivo#.xlsx' )#" query="importdata" headerrow="1" />
 
<!--- Cria uma variável para guardar os imports que deram erros --->
<cfset failedimports = ""/>
 
<!--- Loop que inicia a parti da linha 2 para não pegar o nome da coluna --->
<cfloop query="importdata" startrow="2">

<!--- Valida se já existe a informação no banco, se sim, apenas atualiza ela. --->
<cfquery name="valida" datasource="SINCPROD">

select id from intcoldfusion.central_pokayoke
where id like '%#importdata.id#%'

</cfquery>

<cfif importdata.id EQ verifica.id>

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
            <cfif url.STATUS EQ "0">#importdata.STATUS#<cfelse>#url.STATUS#</cfif>, 
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

<cfelse>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
   <head>
   <cfoutput>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>CAOATEC - Cadastra Itens Poka-Yoke</title>
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/ionicons/css/ionicons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/typicons/src/font/typicons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.base.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.addons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/styleSeqCentral.css?v=6">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/shared/style.css?v=6">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/demo_1/style.css?v=6">
      <link rel="stylesheet" href="style.css?v=2">
      <link rel="shortcut icon" href="#raizWeb#/cf/assets/images/favicon.png" />
   </head>
   <body>
      <div id="solid" class="container-scroller">
         <nav id="shadow_toolbar" class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div id="solid"class="header">
               <img onclick="location.href='#raizWeb#/cf/auth/poka-yoke/index.cfm'" src="#raizWeb#/cf/assets/images/CAOATEC.png" alt="logo" id="img"/>
                  </div>
                     <div class="navbar-menu-wrapper d-flex">
                        <ul class="navbar-nav navbar-nav-left header-links">
                              <a>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/index.cfm'">Retornar</labels>
                              </a>
                           </li>
                        </ul>
                  </cfoutput>
               </div>
            </div>
         </nav>
      </div>
   </div>
<!-- Painel principal para ambos -->
<br><br>
<br><br>
<div id="painel_principal">
<!-- painel para filtros -->
<cfoutput>
</div><center>
   <div id="painel_2">
      <p id="text">Cadastrar item Poka-Yoke</p>
         <div class="form-style-2">
            <form id="form" name="form" action="insere.cfm" method="POST" enctype="multipart/form-data">
               <label for="field2"><span>Arquivo</span>
                  <input type="file" name="fileUpload" required>
               </label>
            <label for="field1"><span>Status </span>
                <select name="STATUS" class="select-field" required>
                  <option value="0">Padrão Carga</option>
                  <option value="1">Liberado</option>
                  <option value="2">Desativado</option>
                </select>
            </label>
    <button type="submit" value="save" id="button_buscar" style="vertical-align:middle"><span>Importar</span></button>
</form>
</div> 
</div>
</div></center>
</cfoutput>
</body>
</html>

   <cfoutput>
      <script src="#raizWeb#/cf/assets/vendors/js/vendor.bundle.base.js"></script>
      <script src="#raizWeb#/cf/assets/vendors/js/vendor.bundle.addons.js"></script>
      <script src="#raizWeb#/cf/assets/js/shared/off-canvas.js"></script>
      <script src="#raizWeb#/cf/assets/js/shared/misc.js"></script>
      <script src="#raizWeb#/cf/assets/js/demo_1/dashboard.js"></script>
    </cfoutput>

   </body>
</html>

</cfif>

