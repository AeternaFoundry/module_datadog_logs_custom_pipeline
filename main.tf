resource "datadog_logs_custom_pipeline" "logs_custom_pipelines" {
  for_each = var.logs_custom_pipelines

  name        = each.value.name
  description = each.value.description
  is_enabled  = each.value.is_enabled
  tags        = each.value.tags

  dynamic "filter" {
    for_each = each.value.filter
    content {
      query = filter.value.query
    }
  }

  dynamic "processor" {
    for_each = each.value.processor != null ? each.value.processor : []
    content {
      dynamic "arithmetic_processor" {
        for_each = processor.value.arithmetic_processor != null ? [processor.value.arithmetic_processor] : []
        content {
          expression         = arithmetic_processor.value.expression
          is_enabled         = arithmetic_processor.value.is_enabled
          is_replace_missing = arithmetic_processor.value.is_replace_missing
          name               = arithmetic_processor.value.name
          target             = arithmetic_processor.value.target
        }
      }
      dynamic "array_map_processor" {
        for_each = processor.value.array_map_processor != null ? [processor.value.array_map_processor] : []
        content {
          is_enabled      = array_map_processor.value.is_enabled
          name            = array_map_processor.value.name
          preserve_source = array_map_processor.value.preserve_source
          dynamic "processors" {
            for_each = array_map_processor.value.processors
            content {
              dynamic "arithmetic_processor" {
                for_each = processors.value.arithmetic_processor != null ? [processors.value.arithmetic_processor] : []
                content {
                  expression         = arithmetic_processor.value.expression
                  is_replace_missing = arithmetic_processor.value.is_replace_missing
                  name               = arithmetic_processor.value.name
                  target             = arithmetic_processor.value.target
                }
              }
              dynamic "attribute_remapper" {
                for_each = processors.value.attribute_remapper != null ? [processors.value.attribute_remapper] : []
                content {
                  name                 = attribute_remapper.value.name
                  override_on_conflict = attribute_remapper.value.override_on_conflict
                  preserve_source      = attribute_remapper.value.preserve_source
                  sources              = attribute_remapper.value.sources
                  target               = attribute_remapper.value.target
                  target_format        = attribute_remapper.value.target_format
                }
              }
              dynamic "category_processor" {
                for_each = processors.value.category_processor != null ? [processors.value.category_processor] : []
                content {
                  dynamic "category" {
                    for_each = category_processor.value.category
                    content {
                      filter {
                        query = category.value.filter.query
                      }
                      name = category.value.name
                    }
                  }
                  name   = category_processor.value.name
                  target = category_processor.value.target
                }
              }
              dynamic "string_builder_processor" {
                for_each = processors.value.string_builder_processor != null ? [processors.value.string_builder_processor] : []
                content {
                  is_replace_missing = string_builder_processor.value.is_replace_missing
                  name               = string_builder_processor.value.name
                  target             = string_builder_processor.value.target
                  template           = string_builder_processor.value.template
                }
              }
            }
          }
          source = array_map_processor.value.source
          target = array_map_processor.value.target
        }
      }
      dynamic "array_processor" {
        for_each = processor.value.array_processor != null ? [processor.value.array_processor] : []
        content {
          is_enabled = array_processor.value.is_enabled
          name       = array_processor.value.name
          operation {
            dynamic "append" {
              for_each = array_processor.value.operation.append != null ? [array_processor.value.operation.append] : []
              content {
                preserve_source = append.value.preserve_source
                source          = append.value.source
                target          = append.value.target
              }
            }
            dynamic "key_value" {
              for_each = array_processor.value.operation.key_value != null ? [array_processor.value.operation.key_value] : []
              content {
                key_to_extract       = key_value.value.key_to_extract
                override_on_conflict = key_value.value.override_on_conflict
                source               = key_value.value.source
                target               = key_value.value.target
                value_to_extract     = key_value.value.value_to_extract
              }
            }
            dynamic "length" {
              for_each = array_processor.value.operation.length != null ? [array_processor.value.operation.length] : []
              content {
                source = length.value.source
                target = length.value.target
              }
            }
            dynamic "select" {
              for_each = array_processor.value.operation.select != null ? [array_processor.value.operation.select] : []
              content {
                filter           = select.value.filter
                source           = select.value.source
                target           = select.value.target
                value_to_extract = select.value.value_to_extract
              }
            }
          }
        }
      }
      dynamic "attribute_remapper" {
        for_each = processor.value.attribute_remapper != null ? [processor.value.attribute_remapper] : []
        content {
          is_enabled           = attribute_remapper.value.is_enabled
          name                 = attribute_remapper.value.name
          override_on_conflict = attribute_remapper.value.override_on_conflict
          preserve_source      = attribute_remapper.value.preserve_source
          source_type          = attribute_remapper.value.source_type
          sources              = attribute_remapper.value.sources
          target               = attribute_remapper.value.target
          target_format        = attribute_remapper.value.target_format
          target_type          = attribute_remapper.value.target_type
        }
      }
      dynamic "category_processor" {
        for_each = processor.value.category_processor != null ? [processor.value.category_processor] : []
        content {
          dynamic "category" {
            for_each = category_processor.value.category
            content {
              filter {
                query = category.value.filter.query
              }
              name = category.value.name
            }
          }
          is_enabled = category_processor.value.is_enabled
          name       = category_processor.value.name
          target     = category_processor.value.target
        }
      }
      dynamic "date_remapper" {
        for_each = processor.value.date_remapper != null ? [processor.value.date_remapper] : []
        content {
          is_enabled = date_remapper.value.is_enabled
          name       = date_remapper.value.name
          sources    = date_remapper.value.sources
        }
      }
      dynamic "decoder_processor" {
        for_each = processor.value.decoder_processor != null ? [processor.value.decoder_processor] : []
        content {
          binary_to_text_encoding = decoder_processor.value.binary_to_text_encoding
          input_representation    = decoder_processor.value.input_representation
          is_enabled              = decoder_processor.value.is_enabled
          name                    = decoder_processor.value.name
          source                  = decoder_processor.value.source
          target                  = decoder_processor.value.target
        }
      }
      dynamic "exclude_attribute_processor" {
        for_each = processor.value.exclude_attribute_processor != null ? [processor.value.exclude_attribute_processor] : []
        content {
          attribute_to_exclude = exclude_attribute_processor.value.attribute_to_exclude
          is_enabled           = exclude_attribute_processor.value.is_enabled
          name                 = exclude_attribute_processor.value.name
        }
      }
      dynamic "geo_ip_parser" {
        for_each = processor.value.geo_ip_parser != null ? [processor.value.geo_ip_parser] : []
        content {
          is_enabled = geo_ip_parser.value.is_enabled
          name       = geo_ip_parser.value.name
          sources    = geo_ip_parser.value.sources
          target     = geo_ip_parser.value.target
        }
      }
      dynamic "grok_parser" {
        for_each = processor.value.grok_parser != null ? [processor.value.grok_parser] : []
        content {
          grok {
            match_rules   = grok_parser.value.grok.match_rules
            support_rules = grok_parser.value.grok.support_rules
          }
          is_enabled = grok_parser.value.is_enabled
          name       = grok_parser.value.name
          samples    = grok_parser.value.samples
          source     = grok_parser.value.source
        }
      }
      dynamic "lookup_processor" {
        for_each = processor.value.lookup_processor != null ? [processor.value.lookup_processor] : []
        content {
          default_lookup = lookup_processor.value.default_lookup
          is_enabled     = lookup_processor.value.is_enabled
          lookup_table   = lookup_processor.value.lookup_table
          name           = lookup_processor.value.name
          source         = lookup_processor.value.source
          target         = lookup_processor.value.target
        }
      }
      dynamic "message_remapper" {
        for_each = processor.value.message_remapper != null ? [processor.value.message_remapper] : []
        content {
          is_enabled = message_remapper.value.is_enabled
          name       = message_remapper.value.name
          sources    = message_remapper.value.sources
        }
      }
      dynamic "pipeline" {
        for_each = processor.value.pipeline != null ? [processor.value.pipeline] : []
        content {
          description = pipeline.value.description
          dynamic "filter" {
            for_each = pipeline.value.filter
            content {
              query = filter.value.query
            }
          }
          is_enabled = pipeline.value.is_enabled
          name       = pipeline.value.name
          dynamic "processor" {
            for_each = pipeline.value.processor != null ? pipeline.value.processor : []
            content {
              dynamic "arithmetic_processor" {
                for_each = processor.value.arithmetic_processor != null ? [processor.value.arithmetic_processor] : []
                content {
                  expression         = arithmetic_processor.value.expression
                  is_enabled         = arithmetic_processor.value.is_enabled
                  is_replace_missing = arithmetic_processor.value.is_replace_missing
                  name               = arithmetic_processor.value.name
                  target             = arithmetic_processor.value.target
                }
              }
              dynamic "array_map_processor" {
                for_each = processor.value.array_map_processor != null ? [processor.value.array_map_processor] : []
                content {
                  is_enabled      = array_map_processor.value.is_enabled
                  name            = array_map_processor.value.name
                  preserve_source = array_map_processor.value.preserve_source
                  dynamic "processors" {
                    for_each = array_map_processor.value.processors
                    content {
                      dynamic "arithmetic_processor" {
                        for_each = processors.value.arithmetic_processor != null ? [processors.value.arithmetic_processor] : []
                        content {
                          expression         = arithmetic_processor.value.expression
                          is_replace_missing = arithmetic_processor.value.is_replace_missing
                          name               = arithmetic_processor.value.name
                          target             = arithmetic_processor.value.target
                        }
                      }
                      dynamic "attribute_remapper" {
                        for_each = processors.value.attribute_remapper != null ? [processors.value.attribute_remapper] : []
                        content {
                          name                 = attribute_remapper.value.name
                          override_on_conflict = attribute_remapper.value.override_on_conflict
                          preserve_source      = attribute_remapper.value.preserve_source
                          sources              = attribute_remapper.value.sources
                          target               = attribute_remapper.value.target
                          target_format        = attribute_remapper.value.target_format
                        }
                      }
                      dynamic "category_processor" {
                        for_each = processors.value.category_processor != null ? [processors.value.category_processor] : []
                        content {
                          dynamic "category" {
                            for_each = category_processor.value.category
                            content {
                              filter {
                                query = category.value.filter.query
                              }
                              name = category.value.name
                            }
                          }
                          name   = category_processor.value.name
                          target = category_processor.value.target
                        }
                      }
                      dynamic "string_builder_processor" {
                        for_each = processors.value.string_builder_processor != null ? [processors.value.string_builder_processor] : []
                        content {
                          is_replace_missing = string_builder_processor.value.is_replace_missing
                          name               = string_builder_processor.value.name
                          target             = string_builder_processor.value.target
                          template           = string_builder_processor.value.template
                        }
                      }
                    }
                  }
                  source = array_map_processor.value.source
                  target = array_map_processor.value.target
                }
              }
              dynamic "array_processor" {
                for_each = processor.value.array_processor != null ? [processor.value.array_processor] : []
                content {
                  is_enabled = array_processor.value.is_enabled
                  name       = array_processor.value.name
                  operation {
                    dynamic "append" {
                      for_each = array_processor.value.operation.append != null ? [array_processor.value.operation.append] : []
                      content {
                        preserve_source = append.value.preserve_source
                        source          = append.value.source
                        target          = append.value.target
                      }
                    }
                    dynamic "key_value" {
                      for_each = array_processor.value.operation.key_value != null ? [array_processor.value.operation.key_value] : []
                      content {
                        key_to_extract       = key_value.value.key_to_extract
                        override_on_conflict = key_value.value.override_on_conflict
                        source               = key_value.value.source
                        target               = key_value.value.target
                        value_to_extract     = key_value.value.value_to_extract
                      }
                    }
                    dynamic "length" {
                      for_each = array_processor.value.operation.length != null ? [array_processor.value.operation.length] : []
                      content {
                        source = length.value.source
                        target = length.value.target
                      }
                    }
                    dynamic "select" {
                      for_each = array_processor.value.operation.select != null ? [array_processor.value.operation.select] : []
                      content {
                        filter           = select.value.filter
                        source           = select.value.source
                        target           = select.value.target
                        value_to_extract = select.value.value_to_extract
                      }
                    }
                  }
                }
              }
              dynamic "attribute_remapper" {
                for_each = processor.value.attribute_remapper != null ? [processor.value.attribute_remapper] : []
                content {
                  is_enabled           = attribute_remapper.value.is_enabled
                  name                 = attribute_remapper.value.name
                  override_on_conflict = attribute_remapper.value.override_on_conflict
                  preserve_source      = attribute_remapper.value.preserve_source
                  source_type          = attribute_remapper.value.source_type
                  sources              = attribute_remapper.value.sources
                  target               = attribute_remapper.value.target
                  target_format        = attribute_remapper.value.target_format
                  target_type          = attribute_remapper.value.target_type
                }
              }
              dynamic "category_processor" {
                for_each = processor.value.category_processor != null ? [processor.value.category_processor] : []
                content {
                  dynamic "category" {
                    for_each = category_processor.value.category
                    content {
                      filter {
                        query = category.value.filter.query
                      }
                      name = category.value.name
                    }
                  }
                  is_enabled = category_processor.value.is_enabled
                  name       = category_processor.value.name
                  target     = category_processor.value.target
                }
              }
              dynamic "date_remapper" {
                for_each = processor.value.date_remapper != null ? [processor.value.date_remapper] : []
                content {
                  is_enabled = date_remapper.value.is_enabled
                  name       = date_remapper.value.name
                  sources    = date_remapper.value.sources
                }
              }
              dynamic "decoder_processor" {
                for_each = processor.value.decoder_processor != null ? [processor.value.decoder_processor] : []
                content {
                  binary_to_text_encoding = decoder_processor.value.binary_to_text_encoding
                  input_representation    = decoder_processor.value.input_representation
                  is_enabled              = decoder_processor.value.is_enabled
                  name                    = decoder_processor.value.name
                  source                  = decoder_processor.value.source
                  target                  = decoder_processor.value.target
                }
              }
              dynamic "exclude_attribute_processor" {
                for_each = processor.value.exclude_attribute_processor != null ? [processor.value.exclude_attribute_processor] : []
                content {
                  attribute_to_exclude = exclude_attribute_processor.value.attribute_to_exclude
                  is_enabled           = exclude_attribute_processor.value.is_enabled
                  name                 = exclude_attribute_processor.value.name
                }
              }
              dynamic "geo_ip_parser" {
                for_each = processor.value.geo_ip_parser != null ? [processor.value.geo_ip_parser] : []
                content {
                  is_enabled = geo_ip_parser.value.is_enabled
                  name       = geo_ip_parser.value.name
                  sources    = geo_ip_parser.value.sources
                  target     = geo_ip_parser.value.target
                }
              }
              dynamic "grok_parser" {
                for_each = processor.value.grok_parser != null ? [processor.value.grok_parser] : []
                content {
                  grok {
                    match_rules   = grok_parser.value.grok.match_rules
                    support_rules = grok_parser.value.grok.support_rules
                  }
                  is_enabled = grok_parser.value.is_enabled
                  name       = grok_parser.value.name
                  samples    = grok_parser.value.samples
                  source     = grok_parser.value.source
                }
              }
              dynamic "lookup_processor" {
                for_each = processor.value.lookup_processor != null ? [processor.value.lookup_processor] : []
                content {
                  default_lookup = lookup_processor.value.default_lookup
                  is_enabled     = lookup_processor.value.is_enabled
                  lookup_table   = lookup_processor.value.lookup_table
                  name           = lookup_processor.value.name
                  source         = lookup_processor.value.source
                  target         = lookup_processor.value.target
                }
              }
              dynamic "message_remapper" {
                for_each = processor.value.message_remapper != null ? [processor.value.message_remapper] : []
                content {
                  is_enabled = message_remapper.value.is_enabled
                  name       = message_remapper.value.name
                  sources    = message_remapper.value.sources
                }
              }
              dynamic "reference_table_lookup_processor" {
                for_each = processor.value.reference_table_lookup_processor != null ? [processor.value.reference_table_lookup_processor] : []
                content {
                  is_enabled              = reference_table_lookup_processor.value.is_enabled
                  lookup_enrichment_table = reference_table_lookup_processor.value.lookup_enrichment_table
                  name                    = reference_table_lookup_processor.value.name
                  source                  = reference_table_lookup_processor.value.source
                  target                  = reference_table_lookup_processor.value.target
                }
              }
              dynamic "schema_processor" {
                for_each = processor.value.schema_processor != null ? [processor.value.schema_processor] : []
                content {
                  is_enabled = schema_processor.value.is_enabled
                  dynamic "mappers" {
                    for_each = schema_processor.value.mappers
                    content {
                      dynamic "schema_category_mapper" {
                        for_each = mappers.value.schema_category_mapper != null ? mappers.value.schema_category_mapper : []
                        content {
                          dynamic "categories" {
                            for_each = schema_category_mapper.value.categories
                            content {
                              filter {
                                query = categories.value.filter.query
                              }
                              id   = categories.value.id
                              name = categories.value.name
                            }
                          }
                          dynamic "fallback" {
                            for_each = schema_category_mapper.value.fallback != null ? [schema_category_mapper.value.fallback] : []
                            content {
                              sources = fallback.value.sources
                              values  = fallback.value.values
                            }
                          }
                          name = schema_category_mapper.value.name
                          targets {
                            id   = schema_category_mapper.value.targets.id
                            name = schema_category_mapper.value.targets.name
                          }
                        }
                      }
                      dynamic "schema_remapper" {
                        for_each = mappers.value.schema_remapper != null ? mappers.value.schema_remapper : []
                        content {
                          name                 = schema_remapper.value.name
                          override_on_conflict = schema_remapper.value.override_on_conflict
                          preserve_source      = schema_remapper.value.preserve_source
                          sources              = schema_remapper.value.sources
                          target               = schema_remapper.value.target
                          target_format        = schema_remapper.value.target_format
                        }
                      }
                    }
                  }
                  name = schema_processor.value.name
                  schema {
                    class_name  = schema_processor.value.schema.class_name
                    class_uid   = schema_processor.value.schema.class_uid
                    extensions  = schema_processor.value.schema.extensions
                    profiles    = schema_processor.value.schema.profiles
                    schema_type = schema_processor.value.schema.schema_type
                    version     = schema_processor.value.schema.version
                  }
                }
              }
              dynamic "service_remapper" {
                for_each = processor.value.service_remapper != null ? [processor.value.service_remapper] : []
                content {
                  is_enabled = service_remapper.value.is_enabled
                  name       = service_remapper.value.name
                  sources    = service_remapper.value.sources
                }
              }
              dynamic "span_id_remapper" {
                for_each = processor.value.span_id_remapper != null ? [processor.value.span_id_remapper] : []
                content {
                  is_enabled = span_id_remapper.value.is_enabled
                  name       = span_id_remapper.value.name
                  sources    = span_id_remapper.value.sources
                }
              }
              dynamic "status_remapper" {
                for_each = processor.value.status_remapper != null ? [processor.value.status_remapper] : []
                content {
                  is_enabled = status_remapper.value.is_enabled
                  name       = status_remapper.value.name
                  sources    = status_remapper.value.sources
                }
              }
              dynamic "string_builder_processor" {
                for_each = processor.value.string_builder_processor != null ? [processor.value.string_builder_processor] : []
                content {
                  is_enabled         = string_builder_processor.value.is_enabled
                  is_replace_missing = string_builder_processor.value.is_replace_missing
                  name               = string_builder_processor.value.name
                  target             = string_builder_processor.value.target
                  template           = string_builder_processor.value.template
                }
              }
              dynamic "trace_id_remapper" {
                for_each = processor.value.trace_id_remapper != null ? [processor.value.trace_id_remapper] : []
                content {
                  is_enabled = trace_id_remapper.value.is_enabled
                  name       = trace_id_remapper.value.name
                  sources    = trace_id_remapper.value.sources
                }
              }
              dynamic "url_parser" {
                for_each = processor.value.url_parser != null ? [processor.value.url_parser] : []
                content {
                  is_enabled               = url_parser.value.is_enabled
                  name                     = url_parser.value.name
                  normalize_ending_slashes = url_parser.value.normalize_ending_slashes
                  sources                  = url_parser.value.sources
                  target                   = url_parser.value.target
                }
              }
              dynamic "user_agent_parser" {
                for_each = processor.value.user_agent_parser != null ? [processor.value.user_agent_parser] : []
                content {
                  is_enabled = user_agent_parser.value.is_enabled
                  is_encoded = user_agent_parser.value.is_encoded
                  name       = user_agent_parser.value.name
                  sources    = user_agent_parser.value.sources
                  target     = user_agent_parser.value.target
                }
              }
            }
          }
          tags = pipeline.value.tags
        }
      }
      dynamic "reference_table_lookup_processor" {
        for_each = processor.value.reference_table_lookup_processor != null ? [processor.value.reference_table_lookup_processor] : []
        content {
          is_enabled              = reference_table_lookup_processor.value.is_enabled
          lookup_enrichment_table = reference_table_lookup_processor.value.lookup_enrichment_table
          name                    = reference_table_lookup_processor.value.name
          source                  = reference_table_lookup_processor.value.source
          target                  = reference_table_lookup_processor.value.target
        }
      }
      dynamic "schema_processor" {
        for_each = processor.value.schema_processor != null ? [processor.value.schema_processor] : []
        content {
          is_enabled = schema_processor.value.is_enabled
          dynamic "mappers" {
            for_each = schema_processor.value.mappers
            content {
              dynamic "schema_category_mapper" {
                for_each = mappers.value.schema_category_mapper != null ? mappers.value.schema_category_mapper : []
                content {
                  dynamic "categories" {
                    for_each = schema_category_mapper.value.categories
                    content {
                      filter {
                        query = categories.value.filter.query
                      }
                      id   = categories.value.id
                      name = categories.value.name
                    }
                  }
                  dynamic "fallback" {
                    for_each = schema_category_mapper.value.fallback != null ? [schema_category_mapper.value.fallback] : []
                    content {
                      sources = fallback.value.sources
                      values  = fallback.value.values
                    }
                  }
                  name = schema_category_mapper.value.name
                  targets {
                    id   = schema_category_mapper.value.targets.id
                    name = schema_category_mapper.value.targets.name
                  }
                }
              }
              dynamic "schema_remapper" {
                for_each = mappers.value.schema_remapper != null ? mappers.value.schema_remapper : []
                content {
                  name                 = schema_remapper.value.name
                  override_on_conflict = schema_remapper.value.override_on_conflict
                  preserve_source      = schema_remapper.value.preserve_source
                  sources              = schema_remapper.value.sources
                  target               = schema_remapper.value.target
                  target_format        = schema_remapper.value.target_format
                }
              }
            }
          }
          name = schema_processor.value.name
          schema {
            class_name  = schema_processor.value.schema.class_name
            class_uid   = schema_processor.value.schema.class_uid
            extensions  = schema_processor.value.schema.extensions
            profiles    = schema_processor.value.schema.profiles
            schema_type = schema_processor.value.schema.schema_type
            version     = schema_processor.value.schema.version
          }
        }
      }
      dynamic "service_remapper" {
        for_each = processor.value.service_remapper != null ? [processor.value.service_remapper] : []
        content {
          is_enabled = service_remapper.value.is_enabled
          name       = service_remapper.value.name
          sources    = service_remapper.value.sources
        }
      }
      dynamic "span_id_remapper" {
        for_each = processor.value.span_id_remapper != null ? [processor.value.span_id_remapper] : []
        content {
          is_enabled = span_id_remapper.value.is_enabled
          name       = span_id_remapper.value.name
          sources    = span_id_remapper.value.sources
        }
      }
      dynamic "status_remapper" {
        for_each = processor.value.status_remapper != null ? [processor.value.status_remapper] : []
        content {
          is_enabled = status_remapper.value.is_enabled
          name       = status_remapper.value.name
          sources    = status_remapper.value.sources
        }
      }
      dynamic "string_builder_processor" {
        for_each = processor.value.string_builder_processor != null ? [processor.value.string_builder_processor] : []
        content {
          is_enabled         = string_builder_processor.value.is_enabled
          is_replace_missing = string_builder_processor.value.is_replace_missing
          name               = string_builder_processor.value.name
          target             = string_builder_processor.value.target
          template           = string_builder_processor.value.template
        }
      }
      dynamic "trace_id_remapper" {
        for_each = processor.value.trace_id_remapper != null ? [processor.value.trace_id_remapper] : []
        content {
          is_enabled = trace_id_remapper.value.is_enabled
          name       = trace_id_remapper.value.name
          sources    = trace_id_remapper.value.sources
        }
      }
      dynamic "url_parser" {
        for_each = processor.value.url_parser != null ? [processor.value.url_parser] : []
        content {
          is_enabled               = url_parser.value.is_enabled
          name                     = url_parser.value.name
          normalize_ending_slashes = url_parser.value.normalize_ending_slashes
          sources                  = url_parser.value.sources
          target                   = url_parser.value.target
        }
      }
      dynamic "user_agent_parser" {
        for_each = processor.value.user_agent_parser != null ? [processor.value.user_agent_parser] : []
        content {
          is_enabled = user_agent_parser.value.is_enabled
          is_encoded = user_agent_parser.value.is_encoded
          name       = user_agent_parser.value.name
          sources    = user_agent_parser.value.sources
          target     = user_agent_parser.value.target
        }
      }
    }
  }
}

