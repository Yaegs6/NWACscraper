

$w = Invoke-WebRequest -Uri "https://nwac.us/mountain-weather-forecast"
[array]$x = $w.ParsedHtml.getElementsByTagName('h4') | select -ExpandProperty  innerText
$x[2] | ConvertFrom-String
$y=$x[2].Split(" ")
$z = $y[1]
	
DO
{	
	Start-Sleep -Seconds 120
	$a = Invoke-WebRequest -Uri "https://nwac.us/mountain-weather-forecast"
	[array]$b = $a.ParsedHtml.getElementsByTagName('h4') | select -ExpandProperty  innerText
	$b[2] | ConvertFrom-String
	$c=$b[2].Split(" ")
	$d = $c[1]
} Until ($z -ne $d)

$g = Invoke-WebRequest -Uri "https://nwac.us/mountain-weather-forecast"
[array]$j = $g.ParsedHtml.getElementsByClassName('mwr-forecast') | select -ExpandProperty innerHtml

$hash = @{}
$hash.'<TBODY>' = ''
$hash."<TR>" = ""
$hash.'<TH></TH>' = ''
$hash.'<TH></TH></TR>' = ''
$hash.'<TH class=row-header>' = ''
$hash.'</TH>' = ''
$hash.'<TD class=description>' = ''
$hash.'</TD></TR></TBODY>' = ''
$hash.'</TR>' = ''


Foreach ($key in $hash.Keys) {
    $j[9] = $j[9].Replace($key, $hash.$key)
}


$k = $j[9]

$hash = @{}
$hash.'<TH>' = ''
$hash.'</TD>' = ''
$hash.'</TD></TBODY>' = ''
$hash.'</TBODY>' = ''

Foreach ($key in $hash.Keys) {
    $k = $k.Replace($key, $hash.$key)
}

$l = $k.Trim()


$text = "Forecast for Mt Hood Meadows: `n" + "`n`r" + "$l"

$username = "yourgmailaddress"
$password = "yourgmailpassword"
$sstr = ConvertTo-SecureString -string $password -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -argumentlist $username, $sstr
$body = "NWAC has updated its mountain weather forecast"
$recipients = "Person1 <person1email@gmail.com>, Person2 <person2email@gmail.com>, etc."
[string[]]$To = $recipients.Split(',')
Send-MailMessage -To $To -From "youremail" -Subject 'NWAC UPDATE!!' -Body $text -SmtpServer smtp.gmail.com -UseSSL -Credential $cred -Port 587

