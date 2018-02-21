$Origem = “C:\DirOrigem”
$DestinoDir = “D:\DirDestino“
$Destino = “D:\DirDestino\backupNome_”+(Get-Date).AddDays(-2).ToString(‘ddMMyyyy’)+”_a_”+(Get-Date).AddDays(-1).ToString(‘ddMMyyyy’)+”.zip”
Add-Type -AssemblyName “System.IO.Compression.FileSystem”
$ArquivosLog  = Get-ChildItem “$Origem” -Recurse -Include “MDM013*” | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-1)}
$ArquivosAntigosCompactados  = Get-ChildItem “$DestinoDir” -Recurse -Include “*.zip” | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-90)}

function Compactar-Arquivos ($Arquivos, $Destino) {
	$ArquivoCompactado= [System.IO.Compression.ZipFile]::Open($Destino,”Update”)
	ForEach ($ArquivoLog in $Arquivos) {
		[System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($ArquivoCompactado, $ArquivoLog.FullName, $ArquivoLog.Name, ”optimal”)
	}
	$ArquivoCompactado.Dispose()
}

function Excluir-Arquivos ($Arquivos) {
	ForEach ($Arquivo in $Arquivos) {
		Remove-Item $Arquivo.FullName | Out-Null
	}
}

If ($ArquivosLog -ne $Null) {
	Compactar-Arquivos $ArquivosLog $Destino 
	Excluir-Arquivos $ArquivosLog
}


If ($ArquivosAntigosCompactados -ne $Null) {
	Excluir-Arquivos $ArquivosAntigosCompactados
}