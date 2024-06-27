<!DOCTYPE html>
<html>
<head>
    <title>Poka-Yoke</title>
    <link rel="stylesheet" href="leitura.css">
    <script>
        function verificarItem() {
            var itens = ["1", "2", "3"];
            var item = document.getElementById('cod_teste').value.trim();
            var mensagem = document.getElementById('mensagem');
            var audio = document.getElementById('bip-som');

            if (itens.includes(item)) {
                mensagem.innerHTML = "Item encontrado!";
                mensagem.style.color = "green";
            } else {
                mensagem.innerHTML = "Erro: Item não encontrado!";
                mensagem.style.color = "red";
                audio.play();
            }
        }
    </script>
</head>
<body onload="document.getElementById('cod_teste').focus()">

    <!--- Caso o veículo for bipado, execute o código abaixo --->
    <table width="270" border="0" align="center" cellpadding="1" bgcolor="#AAAAAA">
        <tr>
            <td align="center" id="titulo_formulario">
                Leia o Volante
            </td>
        </tr>
        <tr>
            <td align="center"></td>
        </tr>
        <tr>
            <td align="center">
                <form id="entrar" name="entrar" method="POST" action="javascript:void(0);" onsubmit="verificarItem()">
                    <input id="cod_teste" name="cod_teste" type="text" maxlength="50" />
                </form>
            </td>
        </tr>
        <tr>
            <td align="center"><input name="Submit" type="submit" id="Submit" value="OK" onclick="verificarItem()" /></td>
        </tr>
        <tr>
            <td align="left"><a href="index.cfm" target="_self"></a></td>
        </tr>
    </table>

    <!--Botão de retorno fora do formulário-->
    <form id="form" name="form" method="post" action="index.cfm">
        <input type="submit" name="primeira" id="voltar" value="Voltar" />
    </form>

    <p id="mensagem" style="text-align: center;"></p>

    <!-- Áudio de bip -->
    <audio id="bip-som" src="templates/audio/beep.wav" preload="auto"></audio>

</body>
</html>
