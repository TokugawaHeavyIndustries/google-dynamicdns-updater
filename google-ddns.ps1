$user="un"
$pass="pw"
$hostname="subdomain.example.com"

##dont change below this line##

$pair="$($user):$($Pass)"

$encodedcreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicauthvalue = "Basic $encodedcreds"

$Headers = @{
    Authorization = $basicauthvalue
    }

$params = @{hostname=$hostname}

Invoke-WebRequest -Uri https://domains.google.com/nic/update -Method POST -Body $params -Headers $Headers -UseBasicParsing