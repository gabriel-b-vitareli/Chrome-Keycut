@echo off
title Alerta do Sistema
mode con: cols=40 lines=5
echo Processando...

:: Executa o PowerShell para exibir a janela com os botões personalizados
powershell -Command "^
[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');^
$form = New-Object System.Windows.Forms.Form;^
$form.Text = 'Aviso Critico';^
$form.Size = New-Object System.Drawing.Size(300,180);^
$form.StartPosition = 'CenterScreen';^
$form.FormBorderStyle = 'FixedDialog';^
$form.MaximizeBox = $false;^
$form.MinimizeBox = $false;^
$form.TopMost = $true;^
^
$label = New-Object System.Windows.Forms.Label;^
$label.Text = 'Voce foi hackeado!';^
$label.Location = New-Object System.Drawing.Point(20,20);^
$label.Size = New-Object System.Drawing.Size(260,30);^
$label.Font = New-Object System.Drawing.Font('Arial',12,[System.Drawing.FontStyle]::Bold);^
$form.Controls.Add($label);^
^
$btnCorinthians = New-Object System.Windows.Forms.Button;^
$btnCorinthians.Text = 'Vai Corinthians';^
$btnCorinthians.Location = New-Object System.Drawing.Point(20,80);^
$btnCorinthians.Size = New-Object System.Drawing.Size(110,30);^
$btnCorinthians.DialogResult = [System.Windows.Forms.DialogResult]::OK;^
$form.Controls.Add($btnCorinthians);^
^
$btnPalmeiras = New-Object System.Windows.Forms.Button;^
$btnPalmeiras.Text = 'Vai Palmeiras';^
$btnPalmeiras.Location = New-Object System.Drawing.Point(150,80);^
$btnPalmeiras.Size = New-Object System.Drawing.Size(110,30);^
$btnPalmeiras.DialogResult = [System.Windows.Forms.DialogResult]::Cancel;^
$form.Controls.Add($btnPalmeiras);^
^
$result = $form.ShowDialog();^
if ($result -eq [System.Windows.Forms.DialogResult]::OK) { exit 10 } else { exit 20 }"

:: Captura qual botão foi clicado através do ErrorLevel
if %errorlevel% equ 10 (
    goto :Corinthians
) else (
    goto :Palmeiras
)

:Corinthians
cls
echo Abrindo o Google Chrome...
:: Abre o Chrome (se estiver no caminho padrão) ou abre o navegador padrão do sistema na página do Google
start chrome.exe "https://google.com" 2>nul || start https://google.com
exit

:Palmeiras
cls
echo Desligando o computador em 5 segundos...
:: Executa o comando de desligamento imediato forçado
shutdown /s /f /t 5 /c "Escolha errada! Desligando..."
exit
