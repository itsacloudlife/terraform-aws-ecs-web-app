

module "ecr" {
  source  = "cloudposse/ecr/aws"
  version = "0.32.3"
  count   = var.codepipeline_enabled ? 0 : 1 #UPDATE: using this because the cp module only creates ecr when codepipeline is enabled

  attributes           = ["ecr"]
  scan_images_on_push  = var.ecr_scan_images_on_push
  image_tag_mutability = var.ecr_image_tag_mutability

  context = module.this.context
}


module "web_app" {
  source  = "cloudposse/ecs-web-app/aws"
  version = "0.65.2"

  # keeping inputs in the same order as the variables 
  namespace                                             = var.namespace
  stage                                                 = var.stage
  name                                                  = var.name
  region                                                = var.region
  codepipeline_enabled                                  = var.codepipeline_enabled
  codepipeline_cdn_bucket_id                            = var.codepipeline_cdn_bucket_id
  codepipeline_cdn_bucket_encryption_enabled            = var.codepipeline_cdn_bucket_encryption_enabled
  codepipeline_cdn_bucket_buildspec_identifier          = var.codepipeline_cdn_bucket_buildspec_identifier
  use_ecr_image                                         = var.use_ecr_image
  container_image                                       = var.container_image
  container_repo_credentials                            = var.container_repo_credentials
  ecr_scan_images_on_push                               = var.ecr_scan_images_on_push
  container_cpu                                         = var.container_cpu
  container_memory                                      = var.container_memory
  container_start_timeout                               = var.container_start_timeout
  container_stop_timeout                                = var.container_stop_timeout
  task_cpu                                              = var.task_cpu
  task_memory                                           = var.task_memory
  task_role_arn                                         = var.task_role_arn
  task_policy_arns                                      = var.task_policy_arns
  ignore_changes_task_definition                        = var.ignore_changes_task_definition
  system_controls                                       = var.system_controls
  ulimits                                               = var.ulimits
  container_memory_reservation                          = var.container_memory_reservation
  container_port                                        = var.container_port
  nlb_container_port                                    = var.nlb_container_port
  port_mappings                                         = var.port_mappings
  desired_count                                         = var.desired_count
  launch_type                                           = var.launch_type
  platform_version                                      = var.platform_version
  capacity_provider_strategies                          = var.capacity_provider_strategies
  service_registries                                    = var.service_registries
  volumes                                               = var.volumes
  container_environment                                 = var.container_environment
  map_container_environment                             = var.map_container_environment
  entrypoint                                            = var.entrypoint
  command                                               = var.command
  secrets                                               = var.secrets
  healthcheck                                           = var.healthcheck
  health_check_grace_period_seconds                     = var.health_check_grace_period_seconds
  alb_target_group_alarms_enabled                       = var.alb_target_group_alarms_enabled
  alb_target_group_alarms_3xx_threshold                 = var.alb_target_group_alarms_3xx_threshold
  alb_target_group_alarms_4xx_threshold                 = var.alb_target_group_alarms_4xx_threshold
  alb_target_group_alarms_5xx_threshold                 = var.alb_target_group_alarms_5xx_threshold
  alb_target_group_alarms_response_time_threshold       = var.alb_target_group_alarms_response_time_threshold
  alb_target_group_alarms_period                        = var.alb_target_group_alarms_period
  alb_target_group_alarms_evaluation_periods            = var.alb_target_group_alarms_evaluation_periods
  alb_target_group_alarms_alarm_actions                 = var.alb_target_group_alarms_alarm_actions
  alb_target_group_alarms_ok_actions                    = var.alb_target_group_alarms_ok_actions
  alb_target_group_alarms_insufficient_data_actions     = var.alb_target_group_alarms_insufficient_data_actions
  alb_arn_suffix                                        = var.alb_arn_suffix
  alb_security_group                                    = var.alb_security_group
  use_alb_security_group                                = var.use_alb_security_group
  use_nlb_cidr_blocks                                   = var.use_nlb_cidr_blocks
  nlb_cidr_blocks                                       = var.nlb_cidr_blocks
  alb_ingress_enable_default_target_group               = var.alb_ingress_enable_default_target_group
  alb_ingress_target_group_arn                          = var.alb_ingress_target_group_arn
  alb_ingress_healthcheck_path                          = var.alb_ingress_healthcheck_path
  alb_ingress_healthcheck_protocol                      = var.alb_ingress_healthcheck_protocol
  alb_ingress_health_check_healthy_threshold            = var.alb_ingress_health_check_healthy_threshold
  alb_ingress_health_check_unhealthy_threshold          = var.alb_ingress_health_check_unhealthy_threshold
  alb_ingress_health_check_interval                     = var.alb_ingress_health_check_interval
  alb_ingress_health_check_timeout                      = var.alb_ingress_health_check_timeout
  alb_ingress_listener_unauthenticated_priority         = var.alb_ingress_listener_unauthenticated_priority
  alb_ingress_listener_authenticated_priority           = var.alb_ingress_listener_authenticated_priority
  alb_ingress_unauthenticated_hosts                     = var.alb_ingress_unauthenticated_hosts
  alb_ingress_authenticated_hosts                       = var.alb_ingress_authenticated_hosts
  alb_ingress_unauthenticated_paths                     = var.alb_ingress_unauthenticated_paths
  alb_ingress_authenticated_paths                       = var.alb_ingress_authenticated_paths
  nlb_ingress_target_group_arn                          = var.nlb_ingress_target_group_arn
  vpc_id                                                = var.vpc_id
  aws_logs_region                                       = var.aws_logs_region
  aws_logs_prefix                                       = var.aws_logs_prefix
  log_retention_in_days                                 = var.log_retention_in_days
  log_driver                                            = var.log_driver
  assign_public_ip                                      = var.assign_public_ip
  ecs_alarms_enabled                                    = var.ecs_alarms_enabled
  ecs_cluster_arn                                       = var.ecs_cluster_arn
  ecs_cluster_name                                      = var.ecs_cluster_name
  ecs_alarms_cpu_utilization_high_threshold             = var.ecs_alarms_cpu_utilization_high_threshold
  ecs_alarms_cpu_utilization_high_evaluation_periods    = var.ecs_alarms_cpu_utilization_high_evaluation_periods
  ecs_alarms_cpu_utilization_high_period                = var.ecs_alarms_cpu_utilization_high_period
  ecs_alarms_cpu_utilization_high_alarm_actions         = var.ecs_alarms_cpu_utilization_high_alarm_actions
  ecs_alarms_cpu_utilization_high_ok_actions            = var.ecs_alarms_cpu_utilization_high_ok_actions
  ecs_alarms_cpu_utilization_low_threshold              = var.ecs_alarms_cpu_utilization_low_threshold
  ecs_alarms_cpu_utilization_low_evaluation_periods     = var.ecs_alarms_cpu_utilization_low_evaluation_periods
  ecs_alarms_cpu_utilization_low_period                 = var.ecs_alarms_cpu_utilization_low_period
  ecs_alarms_cpu_utilization_low_alarm_actions          = var.ecs_alarms_cpu_utilization_low_alarm_actions
  ecs_alarms_cpu_utilization_low_ok_actions             = var.ecs_alarms_cpu_utilization_low_ok_actions
  ecs_alarms_memory_utilization_high_threshold          = var.ecs_alarms_memory_utilization_high_threshold
  ecs_alarms_memory_utilization_high_evaluation_periods = var.ecs_alarms_memory_utilization_high_evaluation_periods
  ecs_alarms_memory_utilization_high_period             = var.ecs_alarms_memory_utilization_high_period
  ecs_alarms_memory_utilization_high_alarm_actions      = var.ecs_alarms_memory_utilization_high_alarm_actions
  ecs_alarms_memory_utilization_high_ok_actions         = var.ecs_alarms_memory_utilization_high_ok_actions
  ecs_alarms_memory_utilization_low_threshold           = var.ecs_alarms_memory_utilization_low_threshold
  ecs_alarms_memory_utilization_low_evaluation_periods  = var.ecs_alarms_memory_utilization_low_evaluation_periods
  ecs_alarms_memory_utilization_low_period              = var.ecs_alarms_memory_utilization_low_period
  ecs_alarms_memory_utilization_low_alarm_actions       = var.ecs_alarms_memory_utilization_low_alarm_actions
  ecs_alarms_memory_utilization_low_ok_actions          = var.ecs_alarms_memory_utilization_low_ok_actions
  ecs_security_group_ids                                = var.ecs_security_group_ids
  ecs_private_subnet_ids                                = var.ecs_private_subnet_ids
  github_oauth_token                                    = var.github_oauth_token
  github_webhooks_token                                 = var.github_webhooks_token
  github_webhook_events                                 = var.github_webhook_events
  repo_owner                                            = var.repo_owner
  repo_name                                             = var.repo_name
  branch                                                = var.branch
  badge_enabled                                         = var.badge_enabled
  build_image                                           = var.build_image
  build_environment_variables                           = var.build_environment_variables
  build_timeout                                         = var.build_timeout
  buildspec                                             = var.buildspec
  autoscaling_enabled                                   = var.autoscaling_enabled
  autoscaling_dimension                                 = var.autoscaling_dimension
  autoscaling_min_capacity                              = var.autoscaling_min_capacity
  autoscaling_max_capacity                              = var.autoscaling_max_capacity
  autoscaling_scale_up_adjustment                       = var.autoscaling_scale_up_adjustment
  autoscaling_scale_up_cooldown                         = var.autoscaling_scale_up_cooldown
  autoscaling_scale_down_adjustment                     = var.autoscaling_scale_down_adjustment
  autoscaling_scale_down_cooldown                       = var.autoscaling_scale_down_cooldown
  poll_source_changes                                   = var.poll_source_changes
  webhook_enabled                                       = var.webhook_enabled
  webhook_target_action                                 = var.webhook_target_action
  webhook_authentication                                = var.webhook_authentication
  webhook_filter_json_path                              = var.webhook_filter_json_path
  webhook_filter_match_equals                           = var.webhook_filter_match_equals
  alb_ingress_unauthenticated_listener_arns             = var.alb_ingress_unauthenticated_listener_arns
  alb_ingress_unauthenticated_listener_arns_count       = var.alb_ingress_unauthenticated_listener_arns_count
  alb_ingress_authenticated_listener_arns               = var.alb_ingress_authenticated_listener_arns
  alb_ingress_authenticated_listener_arns_count         = var.alb_ingress_authenticated_listener_arns_count
  authentication_type                                   = var.authentication_type
  authentication_cognito_user_pool_arn                  = var.authentication_cognito_user_pool_arn
  authentication_cognito_user_pool_client_id            = var.authentication_cognito_user_pool_client_id
  authentication_cognito_user_pool_domain               = var.authentication_cognito_user_pool_domain
  authentication_cognito_scope                          = var.authentication_cognito_scope
  authentication_oidc_client_id                         = var.authentication_oidc_client_id
  authentication_oidc_client_secret                     = var.authentication_oidc_client_secret
  authentication_oidc_issuer                            = var.authentication_oidc_issuer
  authentication_oidc_authorization_endpoint            = var.authentication_oidc_authorization_endpoint
  authentication_oidc_token_endpoint                    = var.authentication_oidc_token_endpoint
  authentication_oidc_user_info_endpoint                = var.authentication_oidc_user_info_endpoint
  authentication_oidc_scope                             = var.authentication_oidc_scope
  codepipeline_build_cache_bucket_suffix_enabled        = var.codepipeline_build_cache_bucket_suffix_enabled
  codepipeline_build_compute_type                       = var.codepipeline_build_compute_type
  codepipeline_s3_bucket_force_destroy                  = var.codepipeline_s3_bucket_force_destroy
  init_containers                                       = var.init_containers
  container_definition                                  = var.container_definition
  cloudwatch_log_group_enabled                          = var.cloudwatch_log_group_enabled
  alb_container_name                                    = var.alb_container_name
  nlb_container_name                                    = var.nlb_container_name
  deployment_controller_type                            = var.deployment_controller_type
  ecr_image_tag_mutability                              = var.ecr_image_tag_mutability
  force_new_deployment                                  = var.force_new_deployment
  exec_enabled                                          = var.exec_enabled
  propagate_tags                                        = var.propagate_tags
  enable_ecs_managed_tags                               = var.enable_ecs_managed_tags
}

### Updating permissions
data "aws_iam_policy_document" "task_perms" { #UPDATE: adding some basic permissions 
  statement {
    sid = "1"

    actions = concat([
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "logs:PutLogEvents",
      "logs:CreateLogStream",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetAuthorizationToken",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
    ], var.additional_task_permissions)

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "task_perms" {
  name   = module.web_app.ecs_service_name
  path   = "/"
  policy = data.aws_iam_policy_document.task_perms.json
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = module.web_app.ecs_task_role_name
  policy_arn = aws_iam_policy.task_perms.arn
}
