<!-- Banco de dados -->

<cfinvoke  method="inicializando" component="cf.ini.index">

<cffunction
name="coldfusionconfig"
access="public">
</cffunction>

<cfif isDefined("cookie.USER")>

<cfelse>

<script>

alert('Você precisa estar logado para continuar')
window.location = 'validar.cfm';
</script>

</cfif>

<cfset dtsource="SINCPROD">
<cfset date=Dateformat(now(),'yyyy-mm-dd')>

<!-- Valida filtro de busca -->
<cfif isDefined("url.STATUS") OR isDefined("url.ITEM") OR isDefined("url.COD_ITEM") OR isDefined("url.LIMITE") OR isDefined("url.BARCODE_ini")>

<cfif len(url.LIMITE) LE 1 or not isDefined("url.LIMITE")>

<cfset limite = 50>

<cfelse>
<cfset limite = url.LIMITE>
</cfif>

<cfquery name="buscaItens" datasource="#dtsource#" maxrows="#limite#">

select usuario, tipo, validacao, status, DATA, barcode, replace(replace(replace(replace(replace(replace(modelo, 'CARROCERIA PINTADA',''), 'CONJUNTO TRIM', ''), 'CONJUNTO', ''), 'CARROCERIA SOLDADA', ''), 'NOVO MOTOR TRIM', ''), 'MAX DRIVE 1.6 TGDI', '') as MODELO
from intcoldfusion.logs_pokayoke
where tipo like '%#url.ITEM#%'
and validacao like '%#url.COD_ITEM#%'
and STATUS like '%#url.STATUS#%'
<cfif isDefined("url.barcode_ini") and isDefined("url.barcode_fim") and url.barcode_fim neq "">
and barcode BETWEEN '#url.BARCODE_ini#' and '#url.barcode_fim#'
<cfelseif NOT isDefined("url.barcode_fim") and isDefined("url.barcode_ini") and url.barcode_fim eq "">
and barcode = '#url.BARCODE_ini#'
</cfif>
order by data desc

</cfquery>
<cfelse>

<cfset url.limite=50>

<!-- Busca os itens cadastrados na central do poka-yoke -->
<cfquery name="buscaItens" datasource="#dtsource#" maxrows="#limite#">

select usuario, tipo, validacao, status,  DATA, barcode, replace(replace(replace(replace(replace(replace(modelo, 'CARROCERIA PINTADA',''), 'CONJUNTO TRIM', ''), 'CONJUNTO', ''), 'CARROCERIA SOLDADA', ''), 'NOVO MOTOR TRIM', ''), 'MAX DRIVE 1.6 TGDI', '') as MODELO
from intcoldfusion.logs_pokayoke
order by data desc

</cfquery>

</cfif>

<!-- Trás itens existentes no poka-yoke -->
<cfquery name="itensExistentes" datasource="#dtsource#">

select tipo
from intcoldfusion.logs_pokayoke
where tipo <> 'F'
and tipo <> ' '
group by tipo

</cfquery>

<!--- Cria seu banco de informações inicialmente de forma vazia. --->
<cfset dados_usuario = []>

<cfquery name="consultaDados" datasource="#dtsource#">

select *
from intcoldfusion.usuarios_pokayoke
where UPPER(usuario) = UPPER('#cookie.USER#')

</cfquery>

<!--- Preenche array de itens com as informações do usuário --->
<cfset arrayAppend(dados_usuario, consultaDados)>

      <cfset usuario = {
        "id": consultaDados.id,
        "usuario": consultaDados.usuario,
        "acessos": consultaDados.acessos}>
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
                                 <cfif usuario.acessos contains "Administrador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/cadastrar.cfm'">Cadastrar item</labels>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/importar.cfm'">Importar Carga</labels>
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/exportar.cfm'">Exportar Banco</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Pesquisar">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/logs.cfm'">Relatório</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "AcessosFull" OR usuario.acessos contains "Administrador">
                                 <labels class="btn btn-primary" onclick="location.href='#raizWeb#/cf/auth/poka-yoke/user.cfm'">Usuários</labels>
                                 <cfelse>
                                 </cfif>
                                 <cfif usuario.acessos contains "Administrador" OR usuario.acessos contains "Monitorar">
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
      <h4 id="text2">Acompanhamento das validações</h4>
         <table class="table table-hover">
   <thead>
      <tr>
         <th>User</th>
         <th>Item</th>
         <th>Modelo</th>
         <th>Barcode</th>
         <th>Status</th>
         <th>Data/Horário</th>
      </tr>
   </thead>
<tbody>
<cfloop query="buscaItens">
<cfoutput>
   <tr>
      <td>#buscaItens.usuario#</td>
      <td>#buscaItens.TIPO#</td>
      <!--- <td>#mid(buscaItens.validacao, 1, findNoCase(" |", buscaItens.validacao))#<br>#mid(buscaItens.validacao, findNoCase("MES", buscaItens.validacao), findNoCase(" - ", buscaItens.validacao))#</td> --->
      <td>#buscaItens.modelo#</td>
		<td>#buscaItens.barcode#</td>
      <td><cfif buscaItens.STATUS EQ "OK"><labels class="btn btn-success">OK</labels><cfelse><labels class="btn btn-danger">ERRO</labels></cfif></td>
		<td>
         #DateTimeformat(buscaItens.data,'dd/mm/yyyy HH:nn:ss')#
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
            <form id="form" name="form" action="monitor.cfm" method="GET">
                    <label for="field2"><span>Código</span>
         <input type="text" class="input-field" maxlength="100" placeholder="AAA000430" style="width: 100px;" name="COD_ITEM"/></label>
      <label for="field2"><span>Máximo</span>
         <input type="text" class="input-field" maxlength="50" placeholder="200" style="width: 100px;" name="LIMITE"/></label>
                           <label for="field2"><span>Barcode Inicial</span>
                              <input type="text" class="input-field" maxlength="50" placeholder="EX: 341234" style="width: 100px;" name="BARCODE_ini"/></label>
                           <label for="field2"><span>Barcode Final</span>
                              <input type="text" class="input-field" maxlength="50" placeholder="EX: 341235" style="width: 100px;" name="BARCODE_fim"/></label>
<label for="field1"><span>Item </span>
   <select name="ITEM" class="select-field" style="width: 100px;">
      <option value="">- Todos - </option>
      <cfloop query="itensExistentes">
      <option value="#itensExistentes.tipo#">#itensExistentes.tipo#</option>
      </cfloop>  
   </select>
</label>
<label for="field1"><span>Status </span>
   <select name="STATUS" class="select-field" style="width: 100px;">
      <option value="">- Todos - </option>
      <option value="OK">OK</option>
      <option value="ERRO">ERRO</option>
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
<meta http-equiv="refresh" content="30; URL=monitor.cfm"/>