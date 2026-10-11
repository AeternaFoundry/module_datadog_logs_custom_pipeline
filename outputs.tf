output "logs_custom_pipelines_id" {
  description = "Map of id values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no id are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "logs_custom_pipelines_description" {
  description = "Map of description values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no description are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.description if v.description != null && length(v.description) > 0 }
}
output "logs_custom_pipelines_filter" {
  description = "Map of filter values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no filter are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.filter if v.filter != null && length(v.filter) > 0 }
}
output "logs_custom_pipelines_is_enabled" {
  description = "Map of is_enabled values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no is_enabled are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.is_enabled if v.is_enabled != null }
}
output "logs_custom_pipelines_name" {
  description = "Map of name values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no name are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.name if v.name != null && length(v.name) > 0 }
}
output "logs_custom_pipelines_processor" {
  description = "Map of processor values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no processor are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.processor if v.processor != null && length(v.processor) > 0 }
}
output "logs_custom_pipelines_tags" {
  description = "Map of tags values across all logs_custom_pipelines, keyed the same as var.logs_custom_pipelines except keys with no tags are omitted"
  value       = { for k, v in datadog_logs_custom_pipeline.logs_custom_pipelines : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

