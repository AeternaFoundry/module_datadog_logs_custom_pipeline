variable "logs_custom_pipelines" {
  description = <<EOT
Map of logs_custom_pipelines, attributes below
Required:
    - name
    - filter (block):
        - query (required)
Optional:
    - description
    - is_enabled
    - tags
    - processor (block):
        - arithmetic_processor (optional, block):
            - expression (required)
            - is_enabled (optional)
            - is_replace_missing (optional)
            - name (optional)
            - target (required)
        - array_map_processor (optional, block):
            - is_enabled (optional)
            - name (optional)
            - preserve_source (optional)
            - processors (required, block):
                - arithmetic_processor (optional, block):
                    - expression (required)
                    - is_replace_missing (optional)
                    - name (optional)
                    - target (required)
                - attribute_remapper (optional, block):
                    - name (optional)
                    - override_on_conflict (optional)
                    - preserve_source (optional)
                    - sources (required)
                    - target (required)
                    - target_format (optional)
                - category_processor (optional, block):
                    - category (required, block):
                        - filter (required, block):
                            - query (required)
                        - name (required)
                    - name (optional)
                    - target (required)
                - string_builder_processor (optional, block):
                    - is_replace_missing (optional)
                    - name (optional)
                    - target (required)
                    - template (required)
            - source (required)
            - target (required)
        - array_processor (optional, block):
            - is_enabled (optional)
            - name (optional)
            - operation (required, block):
                - append (optional, block):
                    - preserve_source (optional)
                    - source (required)
                    - target (required)
                - key_value (optional, block):
                    - key_to_extract (required)
                    - override_on_conflict (optional)
                    - source (required)
                    - target (optional)
                    - value_to_extract (required)
                - length (optional, block):
                    - source (required)
                    - target (required)
                - select (optional, block):
                    - filter (required)
                    - source (required)
                    - target (required)
                    - value_to_extract (required)
        - attribute_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - override_on_conflict (optional)
            - preserve_source (optional)
            - source_type (required)
            - sources (required)
            - target (required)
            - target_format (optional)
            - target_type (required)
        - category_processor (optional, block):
            - category (required, block):
                - filter (required, block):
                    - query (required)
                - name (required)
            - is_enabled (optional)
            - name (optional)
            - target (required)
        - date_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
        - decoder_processor (optional, block):
            - binary_to_text_encoding (required)
            - input_representation (required)
            - is_enabled (optional)
            - name (optional)
            - source (required)
            - target (required)
        - exclude_attribute_processor (optional, block):
            - attribute_to_exclude (required)
            - is_enabled (optional)
            - name (optional)
        - geo_ip_parser (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
            - target (required)
        - grok_parser (optional, block):
            - grok (required, block):
                - match_rules (required)
                - support_rules (required)
            - is_enabled (optional)
            - name (optional)
            - samples (optional)
            - source (required)
        - lookup_processor (optional, block):
            - default_lookup (optional)
            - is_enabled (optional)
            - lookup_table (required)
            - name (optional)
            - source (required)
            - target (required)
        - message_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
        - pipeline (optional, block):
            - description (optional)
            - filter (required, block):
                - query (required)
            - is_enabled (optional)
            - name (required)
            - processor (optional, block):
                - arithmetic_processor (optional, block):
                    - expression (required)
                    - is_enabled (optional)
                    - is_replace_missing (optional)
                    - name (optional)
                    - target (required)
                - array_map_processor (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - preserve_source (optional)
                    - processors (required, block):
                        - arithmetic_processor (optional, block):
                            - expression (required)
                            - is_replace_missing (optional)
                            - name (optional)
                            - target (required)
                        - attribute_remapper (optional, block):
                            - name (optional)
                            - override_on_conflict (optional)
                            - preserve_source (optional)
                            - sources (required)
                            - target (required)
                            - target_format (optional)
                        - category_processor (optional, block):
                            - category (required, block):
                                - filter (required, block):
                                    - query (required)
                                - name (required)
                            - name (optional)
                            - target (required)
                        - string_builder_processor (optional, block):
                            - is_replace_missing (optional)
                            - name (optional)
                            - target (required)
                            - template (required)
                    - source (required)
                    - target (required)
                - array_processor (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - operation (required, block):
                        - append (optional, block):
                            - preserve_source (optional)
                            - source (required)
                            - target (required)
                        - key_value (optional, block):
                            - key_to_extract (required)
                            - override_on_conflict (optional)
                            - source (required)
                            - target (optional)
                            - value_to_extract (required)
                        - length (optional, block):
                            - source (required)
                            - target (required)
                        - select (optional, block):
                            - filter (required)
                            - source (required)
                            - target (required)
                            - value_to_extract (required)
                - attribute_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - override_on_conflict (optional)
                    - preserve_source (optional)
                    - source_type (required)
                    - sources (required)
                    - target (required)
                    - target_format (optional)
                    - target_type (required)
                - category_processor (optional, block):
                    - category (required, block):
                        - filter (required, block):
                            - query (required)
                        - name (required)
                    - is_enabled (optional)
                    - name (optional)
                    - target (required)
                - date_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                - decoder_processor (optional, block):
                    - binary_to_text_encoding (required)
                    - input_representation (required)
                    - is_enabled (optional)
                    - name (optional)
                    - source (required)
                    - target (required)
                - exclude_attribute_processor (optional, block):
                    - attribute_to_exclude (required)
                    - is_enabled (optional)
                    - name (optional)
                - geo_ip_parser (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                    - target (required)
                - grok_parser (optional, block):
                    - grok (required, block):
                        - match_rules (required)
                        - support_rules (required)
                    - is_enabled (optional)
                    - name (optional)
                    - samples (optional)
                    - source (required)
                - lookup_processor (optional, block):
                    - default_lookup (optional)
                    - is_enabled (optional)
                    - lookup_table (required)
                    - name (optional)
                    - source (required)
                    - target (required)
                - message_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                - reference_table_lookup_processor (optional, block):
                    - is_enabled (optional)
                    - lookup_enrichment_table (required)
                    - name (optional)
                    - source (required)
                    - target (required)
                - schema_processor (optional, block):
                    - is_enabled (optional)
                    - mappers (required, block):
                        - schema_category_mapper (optional, block):
                            - categories (required, block):
                                - filter (required, block):
                                    - query (required)
                                - id (required)
                                - name (required)
                            - fallback (optional, block):
                                - sources (optional)
                                - values (optional)
                            - name (required)
                            - targets (required, block):
                                - id (optional)
                                - name (optional)
                        - schema_remapper (optional, block):
                            - name (required)
                            - override_on_conflict (optional)
                            - preserve_source (optional)
                            - sources (required)
                            - target (required)
                            - target_format (optional)
                    - name (optional)
                    - schema (required, block):
                        - class_name (required)
                        - class_uid (required)
                        - extensions (optional)
                        - profiles (optional)
                        - schema_type (required)
                        - version (required)
                - service_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                - span_id_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                - status_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                - string_builder_processor (optional, block):
                    - is_enabled (optional)
                    - is_replace_missing (optional)
                    - name (optional)
                    - target (required)
                    - template (required)
                - trace_id_remapper (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - sources (required)
                - url_parser (optional, block):
                    - is_enabled (optional)
                    - name (optional)
                    - normalize_ending_slashes (optional)
                    - sources (required)
                    - target (required)
                - user_agent_parser (optional, block):
                    - is_enabled (optional)
                    - is_encoded (optional)
                    - name (optional)
                    - sources (required)
                    - target (required)
            - tags (optional)
        - reference_table_lookup_processor (optional, block):
            - is_enabled (optional)
            - lookup_enrichment_table (required)
            - name (optional)
            - source (required)
            - target (required)
        - schema_processor (optional, block):
            - is_enabled (optional)
            - mappers (required, block):
                - schema_category_mapper (optional, block):
                    - categories (required, block):
                        - filter (required, block):
                            - query (required)
                        - id (required)
                        - name (required)
                    - fallback (optional, block):
                        - sources (optional)
                        - values (optional)
                    - name (required)
                    - targets (required, block):
                        - id (optional)
                        - name (optional)
                - schema_remapper (optional, block):
                    - name (required)
                    - override_on_conflict (optional)
                    - preserve_source (optional)
                    - sources (required)
                    - target (required)
                    - target_format (optional)
            - name (optional)
            - schema (required, block):
                - class_name (required)
                - class_uid (required)
                - extensions (optional)
                - profiles (optional)
                - schema_type (required)
                - version (required)
        - service_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
        - span_id_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
        - status_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
        - string_builder_processor (optional, block):
            - is_enabled (optional)
            - is_replace_missing (optional)
            - name (optional)
            - target (required)
            - template (required)
        - trace_id_remapper (optional, block):
            - is_enabled (optional)
            - name (optional)
            - sources (required)
        - url_parser (optional, block):
            - is_enabled (optional)
            - name (optional)
            - normalize_ending_slashes (optional)
            - sources (required)
            - target (required)
        - user_agent_parser (optional, block):
            - is_enabled (optional)
            - is_encoded (optional)
            - name (optional)
            - sources (required)
            - target (required)
EOT

  type = map(object({
    name        = string
    description = optional(string)
    is_enabled  = optional(bool)
    tags        = optional(set(string))
    filter = list(object({
      query = string
    }))
    processor = optional(list(object({
      arithmetic_processor = optional(object({
        expression         = string
        is_enabled         = optional(bool)
        is_replace_missing = optional(bool)
        name               = optional(string)
        target             = string
      }))
      array_map_processor = optional(object({
        is_enabled      = optional(bool)
        name            = optional(string)
        preserve_source = optional(bool)
        processors = list(object({
          arithmetic_processor = optional(object({
            expression         = string
            is_replace_missing = optional(bool)
            name               = optional(string)
            target             = string
          }))
          attribute_remapper = optional(object({
            name                 = optional(string)
            override_on_conflict = optional(bool)
            preserve_source      = optional(bool)
            sources              = list(string)
            target               = string
            target_format        = optional(string)
          }))
          category_processor = optional(object({
            category = list(object({
              filter = object({
                query = string
              })
              name = string
            }))
            name   = optional(string)
            target = string
          }))
          string_builder_processor = optional(object({
            is_replace_missing = optional(bool)
            name               = optional(string)
            target             = string
            template           = string
          }))
        }))
        source = string
        target = string
      }))
      array_processor = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        operation = object({
          append = optional(object({
            preserve_source = optional(bool)
            source          = string
            target          = string
          }))
          key_value = optional(object({
            key_to_extract       = string
            override_on_conflict = optional(bool)
            source               = string
            target               = optional(string)
            value_to_extract     = string
          }))
          length = optional(object({
            source = string
            target = string
          }))
          select = optional(object({
            filter           = string
            source           = string
            target           = string
            value_to_extract = string
          }))
        })
      }))
      attribute_remapper = optional(object({
        is_enabled           = optional(bool)
        name                 = optional(string)
        override_on_conflict = optional(bool)
        preserve_source      = optional(bool)
        source_type          = string
        sources              = list(string)
        target               = string
        target_format        = optional(string)
        target_type          = string
      }))
      category_processor = optional(object({
        category = list(object({
          filter = object({
            query = string
          })
          name = string
        }))
        is_enabled = optional(bool)
        name       = optional(string)
        target     = string
      }))
      date_remapper = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
      }))
      decoder_processor = optional(object({
        binary_to_text_encoding = string
        input_representation    = string
        is_enabled              = optional(bool)
        name                    = optional(string)
        source                  = string
        target                  = string
      }))
      exclude_attribute_processor = optional(object({
        attribute_to_exclude = string
        is_enabled           = optional(bool)
        name                 = optional(string)
      }))
      geo_ip_parser = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
        target     = string
      }))
      grok_parser = optional(object({
        grok = object({
          match_rules   = string
          support_rules = string
        })
        is_enabled = optional(bool)
        name       = optional(string)
        samples    = optional(list(string))
        source     = string
      }))
      lookup_processor = optional(object({
        default_lookup = optional(string)
        is_enabled     = optional(bool)
        lookup_table   = list(string)
        name           = optional(string)
        source         = string
        target         = string
      }))
      message_remapper = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
      }))
      pipeline = optional(object({
        description = optional(string)
        filter = list(object({
          query = string
        }))
        is_enabled = optional(bool)
        name       = string
        processor = optional(list(object({
          arithmetic_processor = optional(object({
            expression         = string
            is_enabled         = optional(bool)
            is_replace_missing = optional(bool)
            name               = optional(string)
            target             = string
          }))
          array_map_processor = optional(object({
            is_enabled      = optional(bool)
            name            = optional(string)
            preserve_source = optional(bool)
            processors = list(object({
              arithmetic_processor = optional(object({
                expression         = string
                is_replace_missing = optional(bool)
                name               = optional(string)
                target             = string
              }))
              attribute_remapper = optional(object({
                name                 = optional(string)
                override_on_conflict = optional(bool)
                preserve_source      = optional(bool)
                sources              = list(string)
                target               = string
                target_format        = optional(string)
              }))
              category_processor = optional(object({
                category = list(object({
                  filter = object({
                    query = string
                  })
                  name = string
                }))
                name   = optional(string)
                target = string
              }))
              string_builder_processor = optional(object({
                is_replace_missing = optional(bool)
                name               = optional(string)
                target             = string
                template           = string
              }))
            }))
            source = string
            target = string
          }))
          array_processor = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            operation = object({
              append = optional(object({
                preserve_source = optional(bool)
                source          = string
                target          = string
              }))
              key_value = optional(object({
                key_to_extract       = string
                override_on_conflict = optional(bool)
                source               = string
                target               = optional(string)
                value_to_extract     = string
              }))
              length = optional(object({
                source = string
                target = string
              }))
              select = optional(object({
                filter           = string
                source           = string
                target           = string
                value_to_extract = string
              }))
            })
          }))
          attribute_remapper = optional(object({
            is_enabled           = optional(bool)
            name                 = optional(string)
            override_on_conflict = optional(bool)
            preserve_source      = optional(bool)
            source_type          = string
            sources              = list(string)
            target               = string
            target_format        = optional(string)
            target_type          = string
          }))
          category_processor = optional(object({
            category = list(object({
              filter = object({
                query = string
              })
              name = string
            }))
            is_enabled = optional(bool)
            name       = optional(string)
            target     = string
          }))
          date_remapper = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
          }))
          decoder_processor = optional(object({
            binary_to_text_encoding = string
            input_representation    = string
            is_enabled              = optional(bool)
            name                    = optional(string)
            source                  = string
            target                  = string
          }))
          exclude_attribute_processor = optional(object({
            attribute_to_exclude = string
            is_enabled           = optional(bool)
            name                 = optional(string)
          }))
          geo_ip_parser = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
            target     = string
          }))
          grok_parser = optional(object({
            grok = object({
              match_rules   = string
              support_rules = string
            })
            is_enabled = optional(bool)
            name       = optional(string)
            samples    = optional(list(string))
            source     = string
          }))
          lookup_processor = optional(object({
            default_lookup = optional(string)
            is_enabled     = optional(bool)
            lookup_table   = list(string)
            name           = optional(string)
            source         = string
            target         = string
          }))
          message_remapper = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
          }))
          reference_table_lookup_processor = optional(object({
            is_enabled              = optional(bool)
            lookup_enrichment_table = string
            name                    = optional(string)
            source                  = string
            target                  = string
          }))
          schema_processor = optional(object({
            is_enabled = optional(bool)
            mappers = list(object({
              schema_category_mapper = optional(list(object({
                categories = list(object({
                  filter = object({
                    query = string
                  })
                  id   = number
                  name = string
                }))
                fallback = optional(object({
                  sources = optional(map(string))
                  values  = optional(map(string))
                }))
                name = string
                targets = object({
                  id   = optional(string)
                  name = optional(string)
                })
              })))
              schema_remapper = optional(list(object({
                name                 = string
                override_on_conflict = optional(bool)
                preserve_source      = optional(bool)
                sources              = list(string)
                target               = string
                target_format        = optional(string)
              })))
            }))
            name = optional(string)
            schema = object({
              class_name  = string
              class_uid   = number
              extensions  = optional(list(string))
              profiles    = optional(list(string))
              schema_type = string
              version     = string
            })
          }))
          service_remapper = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
          }))
          span_id_remapper = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
          }))
          status_remapper = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
          }))
          string_builder_processor = optional(object({
            is_enabled         = optional(bool)
            is_replace_missing = optional(bool)
            name               = optional(string)
            target             = string
            template           = string
          }))
          trace_id_remapper = optional(object({
            is_enabled = optional(bool)
            name       = optional(string)
            sources    = list(string)
          }))
          url_parser = optional(object({
            is_enabled               = optional(bool)
            name                     = optional(string)
            normalize_ending_slashes = optional(bool)
            sources                  = list(string)
            target                   = string
          }))
          user_agent_parser = optional(object({
            is_enabled = optional(bool)
            is_encoded = optional(bool)
            name       = optional(string)
            sources    = list(string)
            target     = string
          }))
        })))
        tags = optional(set(string))
      }))
      reference_table_lookup_processor = optional(object({
        is_enabled              = optional(bool)
        lookup_enrichment_table = string
        name                    = optional(string)
        source                  = string
        target                  = string
      }))
      schema_processor = optional(object({
        is_enabled = optional(bool)
        mappers = list(object({
          schema_category_mapper = optional(list(object({
            categories = list(object({
              filter = object({
                query = string
              })
              id   = number
              name = string
            }))
            fallback = optional(object({
              sources = optional(map(string))
              values  = optional(map(string))
            }))
            name = string
            targets = object({
              id   = optional(string)
              name = optional(string)
            })
          })))
          schema_remapper = optional(list(object({
            name                 = string
            override_on_conflict = optional(bool)
            preserve_source      = optional(bool)
            sources              = list(string)
            target               = string
            target_format        = optional(string)
          })))
        }))
        name = optional(string)
        schema = object({
          class_name  = string
          class_uid   = number
          extensions  = optional(list(string))
          profiles    = optional(list(string))
          schema_type = string
          version     = string
        })
      }))
      service_remapper = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
      }))
      span_id_remapper = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
      }))
      status_remapper = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
      }))
      string_builder_processor = optional(object({
        is_enabled         = optional(bool)
        is_replace_missing = optional(bool)
        name               = optional(string)
        target             = string
        template           = string
      }))
      trace_id_remapper = optional(object({
        is_enabled = optional(bool)
        name       = optional(string)
        sources    = list(string)
      }))
      url_parser = optional(object({
        is_enabled               = optional(bool)
        name                     = optional(string)
        normalize_ending_slashes = optional(bool)
        sources                  = list(string)
        target                   = string
      }))
      user_agent_parser = optional(object({
        is_enabled = optional(bool)
        is_encoded = optional(bool)
        name       = optional(string)
        sources    = list(string)
        target     = string
      }))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        length(v.filter) >= 1
      )
    ])
    error_message = "Each filter list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.array_map_processor == null || (length(item.array_map_processor.processors) >= 1))])
      )
    ])
    error_message = "Each processors list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.array_map_processor == null || (alltrue([for item in item.array_map_processor.processors : (item.category_processor == null || (length(item.category_processor.category) >= 1))])))])
      )
    ])
    error_message = "Each category list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.category_processor == null || (length(item.category_processor.category) >= 1))])
      )
    ])
    error_message = "Each category list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.pipeline == null || (length(item.pipeline.filter) >= 1))])
      )
    ])
    error_message = "Each filter list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.pipeline == null || (item.pipeline.processor == null || alltrue([for item in item.pipeline.processor : (item.array_map_processor == null || (length(item.array_map_processor.processors) >= 1))])))])
      )
    ])
    error_message = "Each processors list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.pipeline == null || (item.pipeline.processor == null || alltrue([for item in item.pipeline.processor : (item.array_map_processor == null || (alltrue([for item in item.array_map_processor.processors : (item.category_processor == null || (length(item.category_processor.category) >= 1))])))])))])
      )
    ])
    error_message = "Each category list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.pipeline == null || (item.pipeline.processor == null || alltrue([for item in item.pipeline.processor : (item.category_processor == null || (length(item.category_processor.category) >= 1))])))])
      )
    ])
    error_message = "Each category list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.pipeline == null || (item.pipeline.processor == null || alltrue([for item in item.pipeline.processor : (item.schema_processor == null || (length(item.schema_processor.mappers) >= 1))])))])
      )
    ])
    error_message = "Each mappers list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.pipeline == null || (item.pipeline.processor == null || alltrue([for item in item.pipeline.processor : (item.schema_processor == null || (alltrue([for item in item.schema_processor.mappers : (item.schema_category_mapper == null || alltrue([for item in item.schema_category_mapper : (length(item.categories) >= 1)]))])))])))])
      )
    ])
    error_message = "Each categories list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.schema_processor == null || (length(item.schema_processor.mappers) >= 1))])
      )
    ])
    error_message = "Each mappers list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.logs_custom_pipelines : (
        v.processor == null || alltrue([for item in v.processor : (item.schema_processor == null || (alltrue([for item in item.schema_processor.mappers : (item.schema_category_mapper == null || alltrue([for item in item.schema_category_mapper : (length(item.categories) >= 1)]))])))])
      )
    ])
    error_message = "Each categories list must contain at least 1 items"
  }
}

