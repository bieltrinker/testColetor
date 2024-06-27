<cfinclude template="select/_cadastrar.cfm">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
   <head>
   <cfoutput>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>CAOATEC - Cadastra Itens poka-yoke2</title>
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/ionicons/css/ionicons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/typicons/src/font/typicons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.base.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.addons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/styleSeqCentral.css?v=6">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/shared/style.css?v=6">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/demo_1/style.css?v=6">
      <link rel="stylesheet" href="style.css?=2">
      <link rel="shortcut icon" href="#raizWeb#/cf/assets/images/favicon.png" />
   </head>
   <body>
      <div id="solid" class="container-scroller">
         <nav id="shadow_toolbar" class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div id="solid"class="header">
               <img onclick="location.href='#raizWeb#/cf/auth/poka-yoke2/index.cfm'" src="#raizWeb#/cf/assets/images/CAOATEC.png" alt="logo" id="img"/>
                  </div>
                     <div class="navbar-menu-wrapper d-flex">
                        <ul class="navbar-nav navbar-nav-left header-links">
                              <a>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke2/index.cfm'">Retornar</labels>
                                 <labels class="btn btn-primary">Importar Excel</labels>
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
      <p id="text">Cadastrar item poka-yoke2</p>
         <div class="form-style-2">
            <form id="form" name="form" action="cadastrar.cfm" method="GET">
               <label for="field2"><span>Item</span>
                  <input type="text" class="input-field" maxlength="20" placeholder="Volante" name="ITEM"/></label>
                <label for="field2"><span>Código do Item</span>
                  <input type="text" class="input-field" maxlength="100" placeholder="AAA000430" name="COD_ITEM"/></label>
                <label for="field2"><span>Cód. Veículo</span>
                  <input type="text" class="input-field" maxlength="20" placeholder="T8C886" name="COD_VEICULO"/></label>
                <label for="field2"><span>Modelo</span>
                  <input type="text" class="input-field" maxlength="100" placeholder="TIGGO 5X PRO" name="MODELO"/></label>
<label for="field1"><span>Status </span>
<select name="STATUS" class="select-field">
   <option value="1">Liberado</option>
   <option value="2">Desativado</option>
<br>
</select>
</label>
<label for="field1"><span>Lock </span>
<select name="STATUS_LOCK" class="select-field">
   <option value="2">Desativado</option>
   <option value="1">Ativado</option>
<br>
</select>
</label>
<label for="field1"><span>Peça a Peça? </span>
<select name="PECAXPECA" class="select-field">
   <option value="2">Não</option>
   <option value="1">Sim</option>
<br>
</select>
</label>
<label for="field2"><span>Validação</span>
<input type="text" class="input-field" maxlength="100" placeholder="AAA000430" name="COD_ITEM_2"/></label>
<button type="submit" value="save" id="button_buscar" style="vertical-align:middle"><span>Cadastrar</span></button>
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
