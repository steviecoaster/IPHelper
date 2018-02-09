$ethAlias = "Ethernet"
$wifiAlias = "Wi-fi"


Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Remote IP Gatherer"
$Form.TopMost = $true
$Form.Width = 370
$Form.Height = 336

$btnCapture = New-Object system.windows.Forms.Button
$btnCapture.Text = "Capture Details"
$btnCapture.Width = 170
$btnCapture.Height = 67

$btnCapture.Add_Click({

    $ethernet = Get-NetIPAddress -InterfaceAlias $ethAlias -AddressFamily IPv4 | Select-Objet InterfaceIndex,Get-NetIPAddress
    $ethernet | Add-Member -MemberType NoteProperty -Name MACAddress -Value $(Get-NetAdapter -InterfaceIndex $ethernet.InterfaceIndex | Select-Object -ExpandProperty MACAddress)
    $lblEethernetIP.Text = $ethernet.IPAddress
    $lblEthernetMAC.Text = $ethernet.MACAddress -replace ("-",":")

    If((Get-NetIPAddress).InterfaceAlias -contains $wifiAlias){

        $wifi = Get-NetIPAddress -InterfaceAlias $wifiAlias -AddressFamily IPv4 | Select-Objet InterfaceIndex,Get-NetIPAddress
        $wifi | Add-Member -MemberType NoteProperty -Name MACAddress -Value $(Get-NetAdapter -InterfaceIndex $wifi.InterfaceIndex | Select-Object -ExpandProperty MACAddress)

        $lblWifiIp.Text = $wifi.IPAddress
        $lblWifiMAC.Text = $wifi.MACAddress

    }

    Else {

        $lblWifiIp.Text = "No Wi-Fi Found"
        $lblWifiMAC.Text = "No Wi-fi Found"
    }
})


$btnCapture.location = new-object system.drawing.point(51,223)
$btnCapture.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($btnCapture)

$lblEthernet = New-Object system.windows.Forms.Label
$lblEthernet.Text = "Ethernet:"
$lblEthernet.AutoSize = $true
$lblEthernet.Width = 25
$lblEthernet.Height = 10
$lblEthernet.location = new-object system.drawing.point(53,58)
$lblEthernet.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEthernet)

$lblEthernet = New-Object system.windows.Forms.Label
$lblEthernet.Text = "Ethernet:"
$lblEthernet.AutoSize = $true
$lblEthernet.Width = 25
$lblEthernet.Height = 10
$lblEthernet.location = new-object system.drawing.point(53,58)
$lblEthernet.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEthernet)

$lblEthernetIPDesc = New-Object system.windows.Forms.Label
$lblEthernetIPDesc.Text = "IP Address:"
$lblEthernetIPDesc.AutoSize = $true
$lblEthernetIPDesc.Width = 25
$lblEthernetIPDesc.Height = 10
$lblEthernetIPDesc.location = new-object system.drawing.point(84,81)
$lblEthernetIPDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEthernetIPDesc)

$lblEthernetMACDesc = New-Object system.windows.Forms.Label
$lblEthernetMACDesc.Text = "MAC Address:"
$lblEthernetMACDesc.AutoSize = $true
$lblEthernetMACDesc.Width = 25
$lblEthernetMACDesc.Height = 10
$lblEthernetMACDesc.location = new-object system.drawing.point(85,101)
$lblEthernetMACDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEthernetMACDesc)

$lblEthernetMACDesc = New-Object system.windows.Forms.Label
$lblEthernetMACDesc.Text = "MAC Address:"
$lblEthernetMACDesc.AutoSize = $true
$lblEthernetMACDesc.Width = 25
$lblEthernetMACDesc.Height = 10
$lblEthernetMACDesc.location = new-object system.drawing.point(85,101)
$lblEthernetMACDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEthernetMACDesc)

$lblWifi = New-Object system.windows.Forms.Label
$lblWifi.Text = "Wi-Fi:"
$lblWifi.AutoSize = $true
$lblWifi.Width = 25
$lblWifi.Height = 10
$lblWifi.location = new-object system.drawing.point(54,131)
$lblWifi.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifi)

$lblWifi = New-Object system.windows.Forms.Label
$lblWifi.Text = "Wi-Fi:"
$lblWifi.AutoSize = $true
$lblWifi.Width = 25
$lblWifi.Height = 10
$lblWifi.location = new-object system.drawing.point(54,131)
$lblWifi.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifi)

$lblWifiIPDesc = New-Object system.windows.Forms.Label
$lblWifiIPDesc.Text = "IP Address:"
$lblWifiIPDesc.AutoSize = $true
$lblWifiIPDesc.Width = 25
$lblWifiIPDesc.Height = 10
$lblWifiIPDesc.location = new-object system.drawing.point(85,153)
$lblWifiIPDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifiIPDesc)

$lblWifiIPDesc = New-Object system.windows.Forms.Label
$lblWifiIPDesc.Text = "IP Address:"
$lblWifiIPDesc.AutoSize = $true
$lblWifiIPDesc.Width = 25
$lblWifiIPDesc.Height = 10
$lblWifiIPDesc.location = new-object system.drawing.point(85,153)
$lblWifiIPDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifiIPDesc)

$lblWifiMACDesc = New-Object system.windows.Forms.Label
$lblWifiMACDesc.Text = "MAC Address:"
$lblWifiMACDesc.AutoSize = $true
$lblWifiMACDesc.Width = 25
$lblWifiMACDesc.Height = 10
$lblWifiMACDesc.location = new-object system.drawing.point(85,172)
$lblWifiMACDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifiMACDesc)

$lblWifiMACDesc = New-Object system.windows.Forms.Label
$lblWifiMACDesc.Text = "MAC Address:"
$lblWifiMACDesc.AutoSize = $true
$lblWifiMACDesc.Width = 25
$lblWifiMACDesc.Height = 10
$lblWifiMACDesc.location = new-object system.drawing.point(85,172)
$lblWifiMACDesc.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifiMACDesc)

$lblEethernetIP = New-Object system.windows.Forms.Label
$lblEethernetIP.Text = "label"
$lblEethernetIP.AutoSize = $true
$lblEethernetIP.Width = 25
$lblEethernetIP.Height = 10
$lblEethernetIP.location = new-object system.drawing.point(161,80)
$lblEethernetIP.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEethernetIP)

$lblEthernetMAC = New-Object system.windows.Forms.Label
$lblEthernetMAC.Text = "label"
$lblEthernetMAC.AutoSize = $true
$lblEthernetMAC.Width = 25
$lblEthernetMAC.Height = 10
$lblEthernetMAC.location = new-object system.drawing.point(175,103)
$lblEthernetMAC.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblEthernetMAC)

$lblWifiIp = New-Object system.windows.Forms.Label
$lblWifiIp.Text = "label"
$lblWifiIp.AutoSize = $true
$lblWifiIp.Width = 25
$lblWifiIp.Height = 10
$lblWifiIp.location = new-object system.drawing.point(158,152)
$lblWifiIp.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifiIp)

$lblWifiMAC = New-Object system.windows.Forms.Label
$lblWifiMAC.Text = "label"
$lblWifiMAC.AutoSize = $true
$lblWifiMAC.Width = 25
$lblWifiMAC.Height = 10
$lblWifiMAC.location = new-object system.drawing.point(173,172)
$lblWifiMAC.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($lblWifiMAC)

$btnExit = New-Object system.windows.Forms.Button
$btnExit.Text = "Exit"
$btnExit.Width = 60
$btnExit.Height = 30

$btnExit.Add_Click({

    $Form.Dispose()
    Exit
    
})

$btnExit.location = new-object system.drawing.point(289,262)
$btnExit.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($btnExit)

[void]$Form.ShowDialog()
