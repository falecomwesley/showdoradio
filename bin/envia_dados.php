<?php

$para = "contato@adersonmendes.com.br";
$assunto = "Contato - Email enviado pelo Site"; 
$data = date("Y-m-d");
$cabecalho = "From: $email"."\r\n"."Subject: $assunto"."\r\n"."Date: $data"."\r\n"."Reply-To: " . $_POST["email"] . "\r\n"."Return-Path: " . $_POST["email"]. "\r\n";

$mensagem = "Nome: ".$_POST["nome"]."\n";
$mensagem .= "E-mail: ". $_POST["email"]."\n";
$mensagem .= "Telefone: ".$_POST["telefone"]."\n";


$mensagem .= "Mensagem: ".$_POST["mensagem"]."\n";

if(mail($para, $assunto, $mensagem, $cabecalho))
{

}else{
	echo "<h1>ERRO AO ENVIAR MENSAGEM</H1>";}

?>