<!-- Banco de dados -->

<cfinvoke  method="inicializando" component="cf.ini.index">

   <cffunction
   name="coldfusionconfig"
   access="public">
   </cffunction>

<cfset dtsource="SINCPROD">
<cfset date=Dateformat(now(),'yyyy-mm-dd')>
<cfset username = url.username>
<cfset nome = url.NOME>
<cfset senha = url.password>
<cfset status = url.STATUS>
<cfset acessos_geral = url.acessos>

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


   <cfif isDefined("url.REF2")>
   
      <cfquery name="deletar" datasource="SINCPROD">
      
      delete intcoldfusion.usuarios_pokayoke
      where ID = '#url.id#'
      
      </cfquery>
      
      <script>
      
      alert("Usuário deletado com SUCESSO!");
      self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/user.cfm";
      
      </script>
      
      <cfelse>
      </cfif>
   
   <!-- Verifica se precisa atualizar algum item do poka-yoke -->
   
   <cfif isDefined("url.ATUALIZA")>
   <cfif url.ATUALIZA EQ "SIM">

    <!--- Valida se o usuário é inferior ao nível de permissão do Administrador --->

<!--- Busca usuário --->
<cfquery name="valida" datasource="SINCPROD">

select * from intcoldfusion.usuarios_pokayoke
where id = '#url.id#'

</cfquery>

<!--- Valida se a permissão é diferente do necessário ---->
<cfif usuario.acessos NEQ valida.acessos>

<script>
   
  alert("Você não tem permissão para isso!");
  self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/user.cfm";
   
</script>

<cfelse>

  <cfquery name="buscarItensExistentes" datasource="#dtsource#">
   
   update intcoldfusion.usuarios_pokayoke
   set 
      ID = '#url.id#',
      USUARIO = '#url.username#',
      SENHA = '#url.password#',
      STATUS = '#url.status#',
      NOME = '#url.nome#',
      DATA_STS = sysdate,
      ACESSOS = '#url.NIVEL##url.NIVEL2#'
   where
      ID = '#cookie.userid#'
   
   </cfquery>
   
   <script>
   
   alert("Usuário Alterado com SUCESSO!");
   self.location="<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/user.cfm";
   
   </script>
   
   <meta http-equiv="refresh" content="5; url=<cfoutput>#raizWeb#</cfoutput>/cf/auth/poka-yoke/user.cfm">
   </cfif>
   <cfelse>
   <cfset url.ATUALIZA = "NAO">
   

</cfif>

   
   
   <cfelse>
   <cfset cookie.userid = url.id>
   </cfif>
   
   <!-- Quando os filtros são preenchidos (recomendado caso saiba qual é o barcode e o sequenciamento) -->
   <cfset cookie.userid = url.id>
   <cfquery name="buscaProdutos" datasource="#dtsource#">
   
   select *
   from intcoldfusion.central_pokayoke
   
   </cfquery>

   <!--- Aplica busca para saber qual é os acessos atual do usuário --->

<cfset Acesso_1 = acessos_geral>
<cfset Acesso_2 = acessos_geral>

<!-- Encontra a posição do ponto e vírgula -->
<cfset posicao_1 = Find(";", Acesso_1)>
<cfset posicao_2 = Find(";", Acesso_2)>

<cfif posicao_1 neq 0>
<!-- Remove o conteúdo à frente do ponto e vírgula -->
<cfset Acesso_1 = left(Acesso_1, posicao_1 - 1)>
</cfif>

<cfif posicao_2 neq 0>
<!-- Remove o conteúdo atrás do ponto e vírgula -->
<cfset Acesso_2 = left(Acesso_2, posicao_2 - 1)>
</cfif>