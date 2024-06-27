<cfinclude template="select/_user.cfm">


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
   <head>
   <cfoutput>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>CAOATEC - Monitor Poka-Yoke</title>
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/ionicons/css/ionicons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/typicons/src/font/typicons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.base.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.addons.css">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/styleSeqCentral.css?v=6">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/shared/style.css?v=6">
      <link rel="stylesheet" href="#raizWeb#/cf/assets/css/demo_1/style.css?v=6">
      <link rel="stylesheet" href="style.css?v=5555">
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
                                 <cfif usuario.acessos contains "AcessosFull" OR usuario.acessos contains "Excluir" OR usuario.acessos contains "Editar" OR usuario.acessos contains "Administrador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/criaruser.cfm'">Criar Usuário</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Moderador" OR usuario.acessos contains "Monitorar">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/monitor.cfm'">Monitor</labels>
                                 <cfelse>
                                 </cfif>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/index.cfm'">Início</labels>
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
      <h4 id="text2">Usuários Cadastrados</h4>
         <table class="table table-hover">
   <thead>
      <tr>
         <th>Matrícula</th>
         <th>Usuário</th>
         <th>Nome</th>
         <th>Status</th>
         <th>Ação</th>
      </tr>
   </thead>
<tbody>
<cfloop query="buscaItens">
<cfoutput>
   <tr>
      <td>#buscaItens.ID#</td>
      <td>#buscaItens.USUARIO#</td>
      <!--- <td>#mid(buscaItens.validacao, 1, findNoCase(" |", buscaItens.validacao))#<br>#mid(buscaItens.validacao, findNoCase("MES", buscaItens.validacao), findNoCase(" - ", buscaItens.validacao))#</td> --->
      <td>#buscaItens.NOME#</td>
		<!--- <td>#buscaItens.barcode#</td>
      <td><cfif buscaItens.STATUS EQ "OK"><labels class="btn btn-success">OK</labels><cfelse><labels class="btn btn-danger">ERRO</labels></cfif></td>
		<td>
         #buscaItens.data#
		</td> --->
      <td><labels class="btn btn-<cfif buscaItens.STATUS eq "1">success<cfelse>danger</cfif>"><cfif buscaItens.STATUS eq "1">Liberado<cfelse>Bloqueado</cfif></labels></td>
      <td>
         <form id="form" name="form" method="GET" action="edituser.cfm">
            <input class="btn btn-primary" type="hidden" name="ID" id="ID" value="<cfoutput>#buscaItens.ID#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="USERNAME" id="USERNAME" value="<cfoutput>#buscaItens.USUARIO#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="NOME" id="NOME" value="<cfoutput>#buscaItens.NOME#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="PASSWORD" id="PASSWORD" value="<cfoutput>#buscaItens.SENHA#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="STATUS" id="STATUS" value="<cfoutput>#buscaItens.STATUS#</cfoutput>"/>
            <input class="btn btn-primary" type="hidden" name="acessos" id="acessos" value="<cfoutput>#buscaItens.ACESSOS#</cfoutput>"/>
            <cfif usuario.acessos contains "AcessosFull" OR usuario.acessos contains "Editar" OR usuario.acessos contains "Administrador">
            <input class="btn btn-warning" type="submit" name="ref1" id="ref1" value="<cfoutput>Editar</cfoutput>"/>
            <cfelse>
            </cfif>
            <cfif usuario.acessos contains "AcessosFull" OR usuario.acessos contains "Excluir" OR usuario.acessos contains "Administrador">
            <input class="btn btn-primary" type="button" name="ref2" id="ref2" onclick="deletar(#buscaItens.ID#);" value="<cfoutput>Deletar</cfoutput>"/>
            <cfelse>
            </cfif>
         </form>
		</td>
	</tr>
   </cfoutput>
</cfloop>
</tbody>
</table>
</body>
</html>

   <cfoutput>
      <script src="#raizWeb#/cf/assets/vendors/js/vendor.bundle.base.js"></script>
      <script src="#raizWeb#/cf/assets/vendors/js/vendor.bundle.addons.js"></script>
      <script src="#raizWeb#/cf/assets/js/shared/off-canvas.js"></script>
      <script src="#raizWeb#/cf/assets/js/shared/misc.js"></script>
      <script src="#raizWeb#/cf/assets/js/demo_1/dashboard.js"></script>
    </cfoutput>

   <!-- painel para filtros -->
<cfoutput>
</div>
   <div id="painel_2">
      <p id="text">Painel de Filtro</p>
         <div class="form-style-2">
            <form id="form" name="form" action="user.cfm" method="GET">
                    <label for="field2"><span>Matrícula</span>
         <input type="text" class="input-field" maxlength="100" placeholder="<cfif isDefined("url.ID")>#url.id#<cfelse>13471</cfif>" style="width: 100px;" name="ID"/></label>
      <label for="field2"><span>Nome</span>
         <input type="text" class="input-field" maxlength="50" placeholder="<cfif isDefined("url.USUARIO")>#url.USUARIO#<cfelse>Fulano</cfif>" style="width: 100px;" name="USERNAME"/></label>
<button type="submit" value="save" id="button_buscar" style="vertical-align:middle"><span>Filtrar</span></button>
</form>
</div> 
</div>
</div>
</cfoutput>

<script>

         function deletar (user_id) {
            conf = confirm('Deseja realmente deletar a matrícula ' + user_id + ' ?');
            if(conf == true){
              self.location = 'edituser.cfm?id='+user_id+'&REF2=SIM'
            }
          }

</script>

   </body>
</html>