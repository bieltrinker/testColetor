<html>

<cfquery name="valida" datasource="MES" >

select
top 1 (case 
	when pro.name like '%TL PE%' then '20100T92Z1'
    when pro.name like '%TIGGO 8 FL ADAS%' and pro.code like '%886%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8 FL ADAS%' and pro.code like '%886%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8%' and pro.name like '%PL7%' and pro.name not like '%ADAS%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8 1.6%' and pro.code like '%858%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 8 1.6%' and pro.code like '%858%' then 'F4J16-0000E02AA'
    when pro.name like '%TIGGO 7 PRO%' and pro.code like '%554%' then 'F4J16-0000E02AA'
    when pro.secondname like '%MTR%' then 'F4J16-0000E04AA'
    when pro.name like '%TIGGO 5X PRO ICE HIGH%' and pro.code like '%755%' then 'E4T15C-0000E04AA'
    when pro.name like '%ICE LOW%' then 'E4T15C-0000E04AA'
    when pro.name like '%TIGGO 5X PRO%' and pro.code like '%754%' then 'E4T15C-0000E04AA'
    when pro.name like '%TIGGO 5X PRO 48V%' and (pro.code like '%764%' or pro.code like '%775%') then 'E4T15C-0000E07AA'
	when pro.name like '%TIGGO 7 PRO%' and (pro.code like '%555%' or pro.code like '%556%') then 'F4J16-0000E02AA'
	when pro.name like '%TIGGO 7 PRO 48V%' and pro.code like '%566%' then 'E4T15C-0000E07AA'
    when pro.name like '%LM%' then 'VZ76'
    when pro.name like '%TIGGO 7 PRO ADAS%' and (pro.code like '%586%' or pro.code like '%587%') then 'F4J16-0000E02AA/F4J16-0000E04AA'
	when pro.name like '%TIGGO 7%' and pro.code like '%553%' then 'E4T15B-0000E05AA'
    when pro.name like '%TIGGO 7%' and pro.code like '%503%' then 'E4T15B-0000E05AA'
    when pro.name like '%TIGGO 5%' and pro.code like '%703%' then 'E4T15B-0000E05AA'
    when pro.name like '%TIGGO 5%' and pro.code like '%753%' then 'E4T15B-0000E05AA'
	else '6VL' end) cod, pro.idproduct, pro.name, lot.code as code
	from pcf4..tbllot lot 
	inner join pcf4..tblproduct pro 
	on lot.IDProduct = pro.IDProduct
where lot.code = '#url.local_para#'
order by idproduct desc

</cfquery>

<cfset veiculo=#valida.cod[1]#>
<cfset volante=trim(cookie.volan)>

<!--- <cfif mid(cookie.volan, 38, 2) EQ "$$">
    <cfset veiculo=#valida.cod[1]#>
    <cfset volante=mid(cookie.volan, 10, 3)>
<cfelseif cookie.volan EQ "6VL">
    <cfset veiculo=#valida.cod[1]#>
    <cfset volante=cookie.volan>
<cfelse>
    <cfset veiculo=#valida.cod[1]#>
    <cfset volante=mid(cookie.volan, 1, 3)>
</cfif> --->

<cfif veiculo eq volante or veiculo contains volante>
    <cfquery datasource="SINCPROD" name="logs">
    insert into intcoldfusion.logs_pokayoke
    (USUARIO, VALIDACAO, BARCODE, MODELO, STATUS, DATA, TIPO) VALUES
    ('VAZIO', '#cookie.volan#','#valida.code#', '#valida.name#', 'OK', sysdate, 'Motor')
    </cfquery>
    Motor validado com o modelo do veiculo!
<meta http-equiv="refresh" content="2; URL=index.cfm?"/>

    <cfelse>

    <cfquery datasource="SINCPROD" name="logs"> 

    insert into intcoldfusion.logs_pokayoke
    (USUARIO, VALIDACAO, BARCODE, MODELO, STATUS, DATA, TIPO) VALUES
    ('VAZIO', '#cookie.volan#','#valida.code#', '#valida.name#', 'ERRO', sysdate, 'Motor')
    
    </cfquery>

    <script>
    alert("Erro! Modelo diferente! <cfoutput>COD do VEICULO: #veiculo# COD do MOTOR: #volante#</cfoutput>")
    self.location="index.cfm";
    </script>
    

</cfif>

</html>

 




