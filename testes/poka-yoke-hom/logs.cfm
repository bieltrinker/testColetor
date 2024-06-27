<cfinvoke  method="inicializando" component="cf.ini.index">
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
      <link rel="stylesheet" href="style.css?v=3">
      <link rel="shortcut icon" href="#raizWeb#/cf/assets/images/favicon.png" />
   </head>
   <body>
      <div id="solid" class="container-scroller">
         <nav id="shadow_toolbar" class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div id="solid"class="header">
               <img src="#raizWeb#/cf/assets/images/CAOATEC.png" alt="logo" id="img"/>
                  </div>
                     <div class="navbar-menu-wrapper d-flex">
                        <ul class="navbar-nav navbar-nav-left header-links">
                              <a>
                                 <labels class="btn btn-primary" onclick="window.open('#raizWeb#/cf/auth/poka-yoke/index.cfm')">Início</labels>
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
   <div id="painel_3">
            <form id="form" name="form" action="logs.cfm?item=ok" method="GET" enctype="multipart/form-data">
    <button type="submit" value="save" id="button_buscar2"><span>Exportar</span></button>
</form>
</div> 
</div> 
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

<cfquery name="carga" datasource="SINCPROD">

select * from intcoldfusion.logs_pokayoke
where data > sysdate-30

</cfquery>

<cfspreadsheet action="write" filename="logs.xlsx" query="carga" sheetname="relatorio_pokayoke_logs" overwrite=true>
    <h1> Relatório Pokayoke gerado com sucesso </h1>
<meta http-equiv="refresh" content="0; URL=<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/logs.xlsx"/>