@PowerShell -ExecutionPolicy Bypass -Command Invoke-Expression $('$args=@(^&{$args} %*);'+[String]::Join(';',(Get-Content '%~f0') -notmatch '^^@PowerShell.*EOF$')) & goto :EOF

echo "��ӭʹ��~"
echo "���ߣ��ŷŽ�  o(���ţ�*)"
echo "��ҳ��https://github.com/gabirel"
echo "������ѧϰ������!!"
echo "�����ܣ���AĿ¼���������Ŀ¼����ļ����ɵݹ飩�ƶ���AĿ¼��"
echo ""

Function Pause ($Message = "Press any key to continue . . . ") {
    if ((Test-Path variable:psISE) -and $psISE) {
        $Shell = New-Object -ComObject "WScript.Shell"
        $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
    } else {     
        Write-Host -NoNewline $Message
        [void][System.Console]::ReadKey($true)
        Write-Host
    }
}


echo ""
$source = Read-Host "[*] ���ƶ�Ҫ������Դ·��"
$dest = Read-Host "[*] ���ƶ�Ŀ��·��(����Դ·����ͬ��ֱ�ӻس�)"

if ($dest -eq [string]::empty) {
    $dest = $source
}
echo ""
echo ""
echo "[!!] $source  >>  $dest"
sleep 1

echo "[*] ȷ�ϵ�������С���"
$shell = new-object -comobject "WScript.Shell"
$result = $shell.popup("�Ƿ�ȷ���ƶ����˲���������ת��!!",0,"ȷ�ϴ���",4+32)
if($result -eq 7) {
	echo ""
	echo "[!!] �˳��� ~(���ԣ�*)"
	sleep 1
	Exit
}

echo ""
echo ""
echo "[*] ��ʼ�ƶ�����"
sleep 1

echo "[*] �ƶ��С���"

Get-ChildItem -Path $source -Recurse -File | Move-Item -Destination $dest -Force 
Get-ChildItem -Path $source -Recurse -Directory | Remove-Item -Recurse

echo ""
echo "[*] �ƶ����!!"
echo ""
$shell2 = new-object -comobject "WScript.Shell"
$result2 = $shell.popup("�Ƿ�������أ�",0,"Question",4+32)
if($result2 -eq 7) {
	echo ""
	echo "[!!] �ݰ� ~(���ԣ�*)"
	sleep 1
	Exit
}

echo ""
echo "[*] Ϊ��׼����Ŀ���ļ��С����һ��Զ��˳��� ~(���ԣ�*)"
sleep 2
Pause

Invoke-Item $dest
echo ""

Exit-PSSession