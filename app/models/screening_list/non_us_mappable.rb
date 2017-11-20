module ScreeningList
  module NonUsMappable
    def self.included(klass)
      klass.import_rate = 'Hourly'
      klass.analyze_by :snowball_asciifolding_nostop, :standard_asciifolding_nostop, :keyword_asciifolding_lowercase, :keyword_asciifolding_uppercase

      klass.settings.freeze

      klass.mappings = {
        klass.name.typeize => {
          properties: {
            _updated_at:                { type: 'date', format: 'strictDateOptionalTime' },
            # base names
            address_one_desc:           { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            address_two_desc:           { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            aka_name_nm:                { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword', analyzer: 'keyword_asciifolding_lowercase' }, }, },
            city_nm:                    { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            contact_nm:                 { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            country_nm:                 { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            customs_area_cd:            { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            effective_dt:               { type: 'date' },
            
            expiration_dt:              { type: 'date' },
            
            ignored_party_flag:         { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            last_modification_tmstp:    { type: 'date' },
            
            name_no_ws_rev_with_common: { type: 'text', analyzer: 'standard_asciifolding_nostop',
                                          term_vector: 'with_positions_offsets', },
            name_nm:                    { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            oid_nbr:                    { type: 'long' },

            source_agency_nm:           { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            source_country_nm:          { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            source_list_nm:             { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            source_url_nm:              { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            state_province_nm:          { type:        'text',
                                          fields:      {
                                            keyword: { type: 'keyword' }, }, },
            },
        },
      }.merge(klass.metadata_mappings,).freeze

      klass.class_eval do
        class << self
          attr_accessor :source
        end
      end
    end
  end
end
