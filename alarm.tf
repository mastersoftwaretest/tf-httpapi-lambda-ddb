resource "aws_sns_topic" "alert_topic" {
  name = "${local.name_prefix}-alert-topic"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.alert_topic.arn
  protocol  = "email"
  endpoint  = "jq.tu@hotmail.com"   
}


resource "aws_cloudwatch_metric_alarm" "info_count_breach" {
  alarm_name          = "${local.name_prefix}-info-count-breach"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "info-count"   
  namespace           = "/moviedb-api/jiaqing"   
  period              = 60                
  statistic           = "Sum"
  threshold           = 10

  alarm_description   = "Alarm when info count > 10"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alert_topic.arn]
}
