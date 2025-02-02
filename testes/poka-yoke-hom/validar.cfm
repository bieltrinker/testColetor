<cfoutput>  

   <cfinvoke  method="inicializando" component="cf.ini.index">

   <!--Verificar posteriormente se existe-->
   <cfquery name="mat" datasource="SINCPROD">
      SELECT MATRICULA FROM INTCOLDFUSION.VOT_CIPA_CANDIDATOS
   </cfquery>
   
   <!-- Valida se o usuário está pedindo para deslogar. -->
   <cfif isDefined("url.logoff")>
   
   <cfcookie  name="user" expires = "now">

   <cfelse>
   </cfif>

   <!--Validar se o usuário existe-->
   <cfif isDefined("url.user")>

      <cfquery name="val" datasource="SINCPROD">
         select * from intcoldfusion.usuarios_pokayoke
         where UPPER(usuario) = UPPER('#url.user#')
         and UPPER(SENHA) = UPPER('#url.senha#')
      </cfquery>


      <cfif trim("#val.USUARIO#") eq "#url.user#">
      <cfcookie  name="user" value="#url.user#">
      <meta http-equiv="refresh" content="0; URL=index.cfm"/>
      <cfelse>
      
      <u class="btn btn-danger" style="width: 100%">USUÁRIO E/OU SENHA INCORRETOS</u>

      </cfif>

      
      
   </cfif>
<!DOCTYPE html>
   <html lang="pt">
      <head>
         <!-- Required meta tags -->
         <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
         <title>CAOATEC - Login Central</title>
         <!-- plugins:css -->
         <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
         <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/ionicons/css/ionicons.css">
         <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/typicons/src/font/typicons.css">
         <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
         <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.base.css">
         <link rel="stylesheet" href="#raizWeb#/cf/assets/vendors/css/vendor.bundle.addons.css">
         <link rel="stylesheet" href="arquivo.css?v=6">
         <!-- endinject -->
         <!-- plugin css for this page -->
         <!-- End plugin css for this page -->
         <!-- inject:css -->
         <link rel="stylesheet" href="#raizWeb#/cf/assets/css/shared/style.css?v=3">
         <!-- endinject -->
         <!-- Layout styles -->
         <link rel="stylesheet" href="#raizWeb#/cf/assets/css/demo_1/style.css?v=3">
         <!-- End Layout styles -->
         <link rel="shortcut icon" href="#raizWeb#/cf/assets/images/favicon.png" />


      </head></cfoutput>
      
      <body>
        <cfset setLocale("Portuguese (Brazilian)")>
         <div class="container-scroller">
  
            <!-- partial -->
            <div class="main-panel">
               <div class="content-wrapper">
                  <!-- Page Title Header Starts-->
                  <div class="row page-title-header">
                     <div class="col-12">
                       <img src="/cf/assets/images/CAOATEC.png" alt="logo" style="height:10%;"/>
                       <h1>Central de itens Poka-yoke</h1>
                       
                       <div class="container" style="margin-left:38%; padding-top: 2cm"><br>
                        
                           <form id="form1" name="form1" class="form-horizontal" action="validar.cfm" method="GET">
                              
                              <div class="form-group">
                                <label class="control-label col-sm-2"><h3>Usuário:</h4></label>
                                <div class="col-sm-10">
                                  <input class="ele" type="text" min="0" placeholder="Digite sua usuário" name="user" value="<cfif isDefined("url.usuario")><cfoutput>#url.usuario#</cfoutput></cfif>" required>
                                  
                                </div>
                              </div><br>
                              <cfoutput>
                              
                              <div>
                                    <label class="control-label col-sm-2"><h3>Senha</h4></label><br><br>
                                    <input class="can" name="senha" placeholder="Informe a senha" type="password" min="0" value="<cfif isDefined("url.usuario")><cfoutput>#url.senha#</cfoutput></cfif>"required>
                                  
                              </div>

                              </cfoutput>
                              <div class="form-group">        
                                <div class="col-sm-offset-2 col-sm-10">
                                 <cfif not isDefined('form.user')> 
                                    <button class="butt" type="submit" style="background-color: green; width: 6cm"> ENTRAR</button>
                                    
                                    <button class="butt" type="reset" style="background-color: RED; margin-left: 8px; width: 3.6cm"> CANCELAR</button>
                                 <cfelseif form.user eq val.usr_codigo>
                                       <meta http-equiv="refresh" content="0; URL=index.cfm"/> 
                                       <cfcookie  name="user" value="#form.user#">
                                 <cfelse>
                                       <button type="reset" class="btn btn-default" style="font-size:18; height: 1.5cm; width:10cm;background-color: red; margin-left: 3px; color:black"> USUÁRIO E/OU SENHA INCORRETOS</button>
                                       <cfoutput>
                                          <meta http-equiv="refresh" content="1; URL=validar.cfm?usuario=#form.user#&senha=#form.senha#"/>
                                       </cfoutput>
                                 </cfif>
                                 
                           </form>

                          </div>
  
                       </body>
                    </div>
                 </div>
              </div>
           </div>
        </div>
     </body>
  </html> 
<!---<cfcatch type="any">
  <br><br><br><br>
  <label  style="font-size:18; color: black; background-color: red; width: 14cm; border-radius: 5px">
  <h4> - ERROR!!! CONTATE O ADM DO SISTEMA /luiz.barreira</h3></label>
</cfcatch>
</cftry>--->