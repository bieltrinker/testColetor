<cfinclude template="select/_index.cfm">

<cfif NOT find(usuario.acessos, "Pesquisar") EQ 0 OR NOT find(usuario.acessos, "Administrador") EQ 0 OR NOT find(usuario.acessos, "Moderador") EQ 0 >

<meta http-equiv="refresh" content="0; URL=monitor.cfm"/>

<cfelse>



</cfif>

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
               <img onclick="location.href='#raizWeb#/cf/auth/poka-yoke/index.cfm'" src="#raizWeb#/cf/assets/images/CAOATEC.png" alt="logo" id="img"/>
                  </div>
                     <div class="navbar-menu-wrapper d-flex">
                        <ul class="navbar-nav navbar-nav-left header-links">
                              <a>
                                 <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Moderador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/cadastrar.cfm'">Cadastrar item</labels>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/importar.cfm'">Importar Carga</labels>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/exportar.cfm'">Exportar Banco</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Pesquisar" OR usuario.acessos contains "Moderador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/logs.cfm'">Relatório</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "AcessosFull" OR usuario.acessos contains "Administrador" OR usuario.acessos contains "Moderador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/user.cfm'">Usuários</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Monitorar" OR usuario.acessos contains "Moderador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/monitor.cfm'">Monitor</labels>
                                 <cfelse>
                                 </cfif>
                                 <labels class="btn btn-success">#cookie.user#</labels>
                                 <labels class="btn btn-danger" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/validar.cfm?logoff=sim'">Sair</labels>
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

<!-- Painel para items -->

   <div id="painel_1">
      <h4 id="text2">Central de itens Poka-Yoke</h4>
         <table class="table table-hover">
   <thead>
      <tr>
         <th>Item</th>
         <th>Cód. Item</th>
         <th>Còd. Produto</th>
         <th>Status</th>
         <th>Lock</th>
         <th>Ação</th>
      </tr>
   </thead>
<tbody>
<cfloop query="buscaItens">
<cfoutput>
   <tr>
      <td>#buscaItens.ITEM#</td>
      <td>#buscaItens.COD_ITEM#</td>
      <td>#buscaItens.PRODUTO_VEICULO#</td>
      <td><cfif buscaItens.STATUS EQ 1><labels class="btn btn-success">Liberado</labels><cfelse><labels class="btn btn-danger">Desativado</labels></cfif></td>
      <td><cfif buscaItens.STATUS_LOCK EQ 1><labels class="btn btn-success">Liberado</labels><cfelse><labels class="btn btn-danger">Desativado</labels></cfif></td>
		<td>
         <form id="form" name="form" method="GET" action="editar.cfm">
            <input class="btn btn-primary" type="hidden" name="ITEM" id="ITEM" value="<cfoutput>#buscaItens.ITEM#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="PRODUTO_VEICULO" id="PRODUTO_VEICULO" value="<cfoutput>#buscaItens.PRODUTO_VEICULO#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="MODELO" id="MODELO" value="<cfoutput>#buscaItens.MODELO#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="COD_ITEM" id="COD_ITEM" value="<cfoutput>#buscaItens.COD_ITEM#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="STATUS" id="STATUS" value="<cfoutput>#buscaItens.STATUS#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="STATUS_LOCK" id="STATUS_LOCK" value="<cfoutput>#buscaItens.STATUS_LOCK#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="editaritem" id="editaritem" value="<cfoutput>#buscaItens.ID#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="PECAXPECA" id="PECAXPECA" value="<cfoutput>#buscaItens.PECAXPECA#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="COD_ITEM_2" id="COD_ITEM_2" value="<cfoutput>#buscaItens.COD_ITEM_2#</cfoutput>"/>
            <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Editar">
            <input class="btn btn-primary" type="submit" name="ref" id="ref" value="<cfoutput>Editar</cfoutput>"/>
            <cfelse>
            </cfif>
         </form>
		</td>
	</tr>
   </cfoutput>
</cfloop>
</tbody>
</table>
   <!-- painel para filtros -->
<cfoutput>
</div>
   <div id="painel_2">
      <p id="text">Painel de Filtro</p>
         <div class="form-style-2">
            <form id="form" name="form" action="index.cfm" method="GET">
               <label for="field2"><span>Código</span>
                  <input type="text" class="input-field" maxlength="100" placeholder="AAA000430" name="COD_ITEM"/></label>
<label for="field1"><span>Item </span>
   <select name="ITEM" class="select-field">
      <option value="">- Todos - </option>
      <cfloop query="itensExistentes">
      <option value="#itensExistentes.item#">#itensExistentes.item#</option>
      </cfloop>  
   </select>
</label>
<label for="field1"><span>Status </span>
   <select name="STATUS" class="select-field">
      <option value="">- Todos - </option>
      <option value="1">Liberado</option>
      <option value="2">Desativado</option>
   </select>
</label>
<label for="field1"><span>Lock </span>
   <select name="STATUS_LOCK" class="select-field">
      <option value="">- Todos - </option>
      <option value="1">Ativado</option>
      <option value="2">Desativado</option>
   </select>
</label>
<button type="submit" value="save" id="button_buscar" style="vertical-align:middle"><span>Filtrar</span></button>
</form>
</div> 
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