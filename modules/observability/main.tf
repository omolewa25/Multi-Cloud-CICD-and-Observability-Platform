provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

resource "datadog_integration_aws" "aws" {
  account_id = var.aws_account_id
  role_name  = var.datadog_aws_role_name
  filter_tags = ["env:prod"]
  host_tags   = ["app:multi-cloud"]
}

resource "datadog_monitor" "ec2_cpu" {
  name               = "High CPU on EC2"
  type               = "metric alert"
  query              = "avg(last_5m):avg:aws.ec2.cpuutilization{*} > 70"
  message            = "High CPU usage detected on EC2 instances!"
  escalation_message = "Urgent: CPU over threshold"
  thresholds = {
    critical = 70
  }
  notify_no_data     = false
  renotify_interval  = 10
}

resource "datadog_monitor" "lambda_errors" {
  name    = "Lambda Error Rate High"
  type    = "metric alert"
  query   = "avg(last_5m):sum:aws.lambda.errors{*} > 5"
  message = "More than 5 Lambda errors in last 5m!"
  thresholds = {
    critical = 5
  }
}

resource "datadog_dashboard" "main" {
  title        = "Multi-Cloud Observability Dashboard"
  layout_type  = "ordered"
  description  = "Live metrics for EC2 and Lambda services"
  is_read_only = false

  widget {
    layout {
      x      = 0
      y      = 0
      width  = 47
      height = 15
    }

    timeseries_definition {
      title        = "EC2 CPU Utilization"
      show_legend  = true
      requests {
        q             = "avg:aws.ec2.cpuutilization{*} by {host}"
        display_type  = "line"
      }
    }
  }

  widget {
    layout {
      x      = 0
      y      = 16
      width  = 47
      height = 15
    }

    timeseries_definition {
      title        = "Lambda Error Count"
      show_legend  = true
      requests {
        q             = "sum:aws.lambda.errors{*} by {functionname}"
        display_type  = "bar"
      }
    }
  }
}