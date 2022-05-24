param ($device, $name, $status, $down, $message, $from_email, $api_token)

#Authors: Jordan Burch:jordan@yobo.dev
#license: MIT

$url = "https://events.pagerduty.com/v2/enqueue"

$body = '{"payload": {"summary":"'+$device+' '+$name+' is '+$status+'","severity":"critical","source":"'+$device+'","custom_details":{"message": "'+$message+'"}},"routing_key": "'+$api_token+'","event_action": "trigger"}';
# Make API request, selecting JSON properties from response
Invoke-WebRequest -Uri $url -UseBasicParsing -Method Post -ContentType 'application/json' -Body $body;