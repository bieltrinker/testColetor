<cfinclude template="select/_edituser.cfm">

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
                                    <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/user.cfm'">Retornar</labels>
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
         <p id="text">Usuário: <cfoutput>#username#</cfoutput></p>
            <div class="form-style-2">
               <form id="form" name="form" action="edituser.cfm" method="GET">
                  <label for="field2"><span>Matrícula</span>
                     <input type="text" class="input-field" maxlength="100" placeholder="Volante" name="ID" value="<cfoutput>#id#</cfoutput>"/></label>
                   <label for="field2"><span>Login</span>
                     <input type="text" class="input-field" maxlength="100" placeholder="AAA000430" name="USERNAME" value="<cfoutput>#username#</cfoutput>"/></label>
                   <label for="field2"><span>Nome</span>
                     <input type="text" class="input-field" maxlength="100" placeholder="T8C886" name="NOME" value="<cfoutput>#nome#</cfoutput>"/></label>
                   <label for="field2"><span>Senha</span>
                     <input type="text" class="input-field" maxlength="100" placeholder="TIGGO 5X PRO" name="PASSWORD" value="<cfoutput>#senha#</cfoutput>"/></label>
                     <input type="hidden" class="input-field" maxlength="100" name="editaritem" value="<cfoutput>#id#</cfoutput>"/>
                     <input type="hidden" class="input-field" maxlength="100" name="ATUALIZA" value="SIM"/>
   <label for="field1"><span>Status </span>
   <select name="STATUS" class="select-field">
      <cfif status EQ 1>
      <option value="1"><cfif status EQ 1>Liberado<cfelse>Bloqueado</cfif></option>
      <option value="2">Bloqueado</option>
      <cfelse>
      <option value="2"><cfif status EQ 1>Liberado<cfelse>Bloqueado</cfif></option>
      <option value="1">Liberado</option>
      </cfif>
   <br>
   </select>
   </label>
<cfif usuario.acessos contains "Moderador" OR usuario.acessos contains "Administrador">
   <label for="field1"><span>Gestão de Usuário</span>
   <select id="meuSelect" name="NIVEL" class="select-field">
      <option value="#Acesso_1#;">#Acesso_1#</option>
      <option value="SemAcesso;">Sem Acesso</option>
      <option value="Editar;">Editar</option>
      <option value="Excluir;">Excluir</option>
      <option value="AcessosFull;">Acessos Full</option>
   <br>
   </select>
   </label>
   <cfelse>
   </cfif>
<cfif usuario.acessos contains "Moderador" OR usuario.acessos contains "Administrador">
   <label for="field1"><span>Gestão de Monitoramento</span>
   <select id="meuSelect" name="NIVEL2" class="select-field">
      <option value="#Acesso_2#">#Acesso_2#</option>
      <option value="SemAcesso2">Sem Acesso</option>
      <option value="Monitorar">Monitorar</option>
      <option value="Pesquisar">Pesquisar</option>
      <option value="Moderador">Moderador</option>
      <cfif usuario.acessos contains "Administrador">
      <option value="Administrador">Administrador</option>
      <cfelse>
      </cfif>
   <br>
   </select>
   </label>
   <cfelse>
   </cfif>

   <button type="submit" value="save" id="button_buscar" style="vertical-align:middle"><span>Salvar</span></button>
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

      <style>
        /* Estilo para a opção selecionada */
        select#meuSelect::placeholder {
            background-color: lightblue; /* Defina a cor de fundo desejada */
        }
    </style>

   </html>