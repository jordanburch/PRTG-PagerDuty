param ($device, $name, $status, $down, $message, $from_email, $api_token, $service_id)

#Authors: Jordan Burch:jordan@yobo.dev
#license: MIT

$url = "https://api.pagerduty.com/incidents"
$headers = @{
	'Authorization' = "Token token=$api_token";
	'Accept' = 'application/vnd.pagerduty+json;version=2';
	'Content-Type' = 'application/json';
	'From' = "$from_email";
}

$body ='{"incident": {"type": "incident","title":"'+$device +" "+$name +" is "+$status+'","body":{"type":"incident_body","details":"'+$message+'"},"service": {"id": "'+$service_id+'","summary": "test from PRTG","type": "service_reference","self": null,"html_url": null}}}'

# Make API request, selecting JSON properties from response
Invoke-WebRequest -Uri $url -UseBasicParsing -Headers $headers -Method Post -ContentType 'application/json' -Body $body;
