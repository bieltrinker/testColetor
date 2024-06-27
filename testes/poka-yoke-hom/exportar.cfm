<cfif not isDefined("url.item")>

<cfquery name="itensExistentes" datasource="SINCPROD">

select item
from intcoldfusion.central_pokayoke
group by item

</cfquery>

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
      <p id="text">Exportar carga de itens</p>
         <div class="form-style-2">
            <label for="field1"><span>Item</span>
            <form id="form" name="form" action="exportar.cfm" method="GET" enctype="multipart/form-data">
                <select name="ITEM" class="select-field">
                  <option value="">Todos</option>
                  <cfloop query="itensExistentes">
                  <option value="#itensExistentes.item#">#itensExistentes.item#</option>
                  </cfloop> 
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

<cfelse>

<cfquery name="carga" datasource="SINCPROD">

select id, item, produto_veiculo, modelo, cod_item, status from intcoldfusion.central_pokayoke
where item like '%#url.item#%'

</cfquery>

<cfspreadsheet action="write" filename="carga_#url.item#.xlsx" query="carga" sheetname="carga_#url.item#" overwrite=true>
    <h1> arquivo carga do item <cfoutput>#url.item#</cfoutput> gerada com sucesso </h1>
<meta http-equiv="refresh" content="0; URL=<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/carga_<cfoutput>#url.item#</cfoutput>.xlsx"/>

</cfif>