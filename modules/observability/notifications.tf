
resource "datadog_integration_slack_channel" "alerts" {
  account_name = var.slack_account
  channel_name = var.slack_channel
}

resource "datadog_monitor" "notify_slack" {
  name    = "EC2 CPU High Alert Notification"
  type    = "metric alert"
  query   = "avg(last_5m):avg:aws.ec2.cpuutilization{*} > 80"
  message = "{{#is_alert}}@slack-${datadog_integration_slack_channel.alerts.channel_name}{{/is_alert}}: EC2 CPU is critically high!"
  thresholds = {
    critical = 80
  }
  notify_no_data = true
  renotify_interval = 30
}